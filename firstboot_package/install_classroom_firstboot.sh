#!/usr/bin/env bash
set -euo pipefail

# =====================================================================
# install_classroom_firstboot.sh
# ---------------------------------------------------------------------
# Installiert ein robustes First-Boot-System für Raspberry-Pi-Schulkarten.
#
# Ausführen auf der vorbereiteten Master-/Test-SD-Karte:
#   sudo bash install_classroom_firstboot.sh
#
# Danach verfügbar:
#   sudo classroom-firstboot --dry-run
#   sudo classroom-firstboot --test-config
#   sudo classroom-firstboot --test-wifi
#   sudo classroom-firstboot --status
#   sudo classroom-firstboot-arm
# =====================================================================

# -----------------------------
# Globale Defaults
# -----------------------------
# Diese Werte sind Fallbacks. Pro SD-Karte kann später auf der Windows-lesbaren
# Boot-Partition eine classroom-device.conf abgelegt werden, die diese Werte überschreibt.

DEFAULT_WIFI_SSID="KI-Workshop"
DEFAULT_WIFI_PSK="Workshop!2026"
DEFAULT_WIFI_COUNTRY="DE"
DEFAULT_WIFI_CONNECTION_NAME="ASG-wifi"

DEFAULT_HOST_PREFIX="rpi02w"
DEFAULT_HOSTNAME=""              # leer = automatisch aus HOST_PREFIX + DEVICE_ID/Serial

CREATE_CLASSROOM_USER=1
DEFAULT_CLASSROOM_USER="user"
DEFAULT_CLASSROOM_FULLNAME="Schueler"
DEFAULT_CLASSROOM_PASSWORD=""      # Klartext-Fallback; besser pro Karte setzen oder HASH verwenden
DEFAULT_CLASSROOM_PASSWORD_HASH="" # bevorzugt, wenn gesetzt: z.B. openssl passwd -6
FORCE_PASSWORD_CHANGE=0
CLASSROOM_USER_SUDO=1
ADD_RPI_GROUPS=1

# Alten Master-User standardmäßig NICHT entfernen, damit du im Fehlerfall noch Zugriff hast.
REMOVE_OLD_USER=0
OLD_USER_TO_REMOVE=""

# Tests/Anforderungen
REQUIRE_WIFI_CONNECTIVITY=1
REQUIRE_INTERNET=0
PING_TARGET="8.8.8.8"

# Konfigurationsdatei auf der Boot-Partition
DEVICE_CONFIG_FILENAME="classroom-device.conf"

# Wenn 1: logs/history beim erfolgreichen First-Boot etwas bereinigen
CLEANUP_ON_SUCCESS=1

if [[ $EUID -ne 0 ]]; then
    echo "Bitte mit sudo ausführen:"
    echo "  sudo bash install_classroom_firstboot.sh"
    exit 1
fi

echo "[INFO] Installiere Classroom First-Boot-System..."

mkdir -p /etc/classroom-firstboot

cat > /etc/classroom-firstboot/defaults.conf <<EOF
# =====================================================================
# /etc/classroom-firstboot/defaults.conf
# Wird zuerst geladen. Danach überschreibt /boot/firmware/${DEVICE_CONFIG_FILENAME}
# bzw. /boot/${DEVICE_CONFIG_FILENAME} diese Werte, falls vorhanden.
# =====================================================================

DEFAULT_WIFI_SSID=$(printf '%q' "$DEFAULT_WIFI_SSID")
DEFAULT_WIFI_PSK=$(printf '%q' "$DEFAULT_WIFI_PSK")
DEFAULT_WIFI_COUNTRY=$(printf '%q' "$DEFAULT_WIFI_COUNTRY")
DEFAULT_WIFI_CONNECTION_NAME=$(printf '%q' "$DEFAULT_WIFI_CONNECTION_NAME")

DEFAULT_HOST_PREFIX=$(printf '%q' "$DEFAULT_HOST_PREFIX")
DEFAULT_HOSTNAME=$(printf '%q' "$DEFAULT_HOSTNAME")

CREATE_CLASSROOM_USER=$CREATE_CLASSROOM_USER
DEFAULT_CLASSROOM_USER=$(printf '%q' "$DEFAULT_CLASSROOM_USER")
DEFAULT_CLASSROOM_FULLNAME=$(printf '%q' "$DEFAULT_CLASSROOM_FULLNAME")
DEFAULT_CLASSROOM_PASSWORD=$(printf '%q' "$DEFAULT_CLASSROOM_PASSWORD")
DEFAULT_CLASSROOM_PASSWORD_HASH=$(printf '%q' "$DEFAULT_CLASSROOM_PASSWORD_HASH")
FORCE_PASSWORD_CHANGE=$FORCE_PASSWORD_CHANGE
CLASSROOM_USER_SUDO=$CLASSROOM_USER_SUDO
ADD_RPI_GROUPS=$ADD_RPI_GROUPS

REMOVE_OLD_USER=$REMOVE_OLD_USER
OLD_USER_TO_REMOVE=$(printf '%q' "$OLD_USER_TO_REMOVE")

REQUIRE_WIFI_CONNECTIVITY=$REQUIRE_WIFI_CONNECTIVITY
REQUIRE_INTERNET=$REQUIRE_INTERNET
PING_TARGET=$(printf '%q' "$PING_TARGET")

DEVICE_CONFIG_FILENAME=$(printf '%q' "$DEVICE_CONFIG_FILENAME")
CLEANUP_ON_SUCCESS=$CLEANUP_ON_SUCCESS
EOF

chmod 600 /etc/classroom-firstboot/defaults.conf
chown root:root /etc/classroom-firstboot/defaults.conf

cat > /usr/local/sbin/classroom-firstboot <<'SCRIPT'
#!/usr/bin/env bash
set -u

# =====================================================================
# classroom-firstboot
# ---------------------------------------------------------------------
# Modi:
#   --dry-run       Simuliert den First-Boot-Lauf ohne Änderungen
#   --test-config   Liest und validiert Konfiguration ohne Änderungen
#   --test-wifi     Legt WLAN-Profil real an und testet Verbindung
#   --run           Echter First-Boot-Lauf, normalerweise via systemd
#   --status        Zeigt Marker und letzte Logs
# =====================================================================

DEFAULTS_FILE="/etc/classroom-firstboot/defaults.conf"

BOOT_DIR="/boot/firmware"
if [[ ! -d "$BOOT_DIR" ]]; then
    BOOT_DIR="/boot"
fi

LOG_FILE="/var/log/classroom-firstboot.log"
BOOT_LOG_FILE="$BOOT_DIR/classroom-firstboot.log"
ENABLED_FLAG="$BOOT_DIR/classroom-firstboot.enabled"
DONE_FLAG="$BOOT_DIR/classroom-firstboot.done"
FAILED_FLAG="$BOOT_DIR/classroom-firstboot.failed"

MODE="${1:---help}"
DRY_RUN=0
CONFIG_LOADED=0

log() {
    local msg="$1"
    local line
    line="$(date '+%Y-%m-%d %H:%M:%S') | $msg"
    echo "$line"
    mkdir -p "$(dirname "$LOG_FILE")" 2>/dev/null || true
    echo "$line" >> "$LOG_FILE" 2>/dev/null || true
    echo "$line" >> "$BOOT_LOG_FILE" 2>/dev/null || true
}

run_cmd() {
    if [[ "$DRY_RUN" -eq 1 ]]; then
        log "[DRY-RUN] $*"
    else
        log "[CMD] $*"
        "$@"
    fi
}

safe_source() {
    # Hinweis: Diese Lösung ist für kontrollierte Schul-/Laborkarten gedacht.
    # Die Konfigurationsdatei ist eine Shell-Datei und wird daher ausgeführt.
    # Nur vertrauenswürdige classroom-device.conf verwenden.
    local file="$1"
    if [[ -f "$file" ]]; then
        # shellcheck source=/dev/null
        source "$file"
        return 0
    fi
    return 1
}

load_config() {
    if [[ "$CONFIG_LOADED" -eq 1 ]]; then
        return 0
    fi

    if [[ ! -f "$DEFAULTS_FILE" ]]; then
        log "[ERROR] Defaults-Datei fehlt: $DEFAULTS_FILE"
        return 1
    fi

    # shellcheck source=/dev/null
    source "$DEFAULTS_FILE"

    DEVICE_CONFIG="$BOOT_DIR/${DEVICE_CONFIG_FILENAME:-classroom-device.conf}"

    if [[ -f "$DEVICE_CONFIG" ]]; then
        log "[INFO] Lade Geräte-Konfiguration: $DEVICE_CONFIG"
        safe_source "$DEVICE_CONFIG"
    else
        log "[WARN] Keine Geräte-Konfiguration gefunden: $DEVICE_CONFIG"
        log "[WARN] Es werden nur Defaults verwendet. Für individuelle Karten ist classroom-device.conf empfohlen."
    fi

    # Effektive Variablen bilden: DEVICE-Werte überschreiben DEFAULT-Werte.
    DEVICE_ID="${DEVICE_ID:-}"

    WIFI_SSID="${WIFI_SSID:-${DEFAULT_WIFI_SSID:-}}"
    WIFI_PSK="${WIFI_PSK:-${DEFAULT_WIFI_PSK:-}}"
    WIFI_COUNTRY="${WIFI_COUNTRY:-${DEFAULT_WIFI_COUNTRY:-DE}}"
    WIFI_CONNECTION_NAME="${WIFI_CONNECTION_NAME:-${DEFAULT_WIFI_CONNECTION_NAME:-classroom-wifi}}"

    HOST_PREFIX="${HOST_PREFIX:-${DEFAULT_HOST_PREFIX:-rpi-zero}}"
    HOSTNAME="${HOSTNAME:-${DEFAULT_HOSTNAME:-}}"

    CLASSROOM_USER="${CLASSROOM_USER:-${DEFAULT_CLASSROOM_USER:-student}}"
    CLASSROOM_FULLNAME="${CLASSROOM_FULLNAME:-${DEFAULT_CLASSROOM_FULLNAME:-Student}}"
    CLASSROOM_PASSWORD="${CLASSROOM_PASSWORD:-${DEFAULT_CLASSROOM_PASSWORD:-}}"
    CLASSROOM_PASSWORD_HASH="${CLASSROOM_PASSWORD_HASH:-${DEFAULT_CLASSROOM_PASSWORD_HASH:-}}"

    CREATE_CLASSROOM_USER="${CREATE_CLASSROOM_USER:-1}"
    FORCE_PASSWORD_CHANGE="${FORCE_PASSWORD_CHANGE:-0}"
    CLASSROOM_USER_SUDO="${CLASSROOM_USER_SUDO:-1}"
    ADD_RPI_GROUPS="${ADD_RPI_GROUPS:-1}"
    REMOVE_OLD_USER="${REMOVE_OLD_USER:-0}"
    OLD_USER_TO_REMOVE="${OLD_USER_TO_REMOVE:-}"

    REQUIRE_WIFI_CONNECTIVITY="${REQUIRE_WIFI_CONNECTIVITY:-1}"
    REQUIRE_INTERNET="${REQUIRE_INTERNET:-0}"
    PING_TARGET="${PING_TARGET:-8.8.8.8}"
    CLEANUP_ON_SUCCESS="${CLEANUP_ON_SUCCESS:-1}"

    CONFIG_LOADED=1
}

get_serial_suffix() {
    local serial
    serial="$(awk '/Serial/ {print $3}' /proc/cpuinfo 2>/dev/null | tail -n 1)"
    if [[ -z "$serial" ]]; then
        serial="$(cat /etc/machine-id 2>/dev/null | head -c 12)"
    fi
    if [[ -z "$serial" ]]; then
        serial="unknown"
    fi
    echo "${serial: -6}"
}

resolve_hostname() {
    if [[ -n "${HOSTNAME:-}" ]]; then
        echo "$HOSTNAME"
    elif [[ -n "${DEVICE_ID:-}" ]]; then
        echo "${HOST_PREFIX}-${DEVICE_ID}"
    else
        echo "${HOST_PREFIX}-$(get_serial_suffix)"
    fi
}

validate_username() {
    local username="$1"
    if [[ "$username" =~ ^[a-z_][a-z0-9_-]*[$]?$ ]]; then
        return 0
    fi
    return 1
}

validate_hostname() {
    local hn="$1"
    if [[ "$hn" =~ ^[a-zA-Z0-9][a-zA-Z0-9-]{0,62}$ && ! "$hn" =~ -- && ! "$hn" =~ -$ ]]; then
        return 0
    fi
    return 1
}

check_requirements() {
    local ok=1
    log "[CHECK] Prüfe Voraussetzungen..."

    if [[ $EUID -ne 0 ]]; then
        log "[ERROR] Dieses Skript muss mit sudo/root laufen."
        ok=0
    fi

    if ! command -v nmcli >/dev/null 2>&1; then
        log "[ERROR] nmcli nicht gefunden. Raspberry Pi OS Bookworm/Trixie nutzt normalerweise NetworkManager."
        ok=0
    else
        log "[OK] nmcli gefunden: $(command -v nmcli)"
    fi

    if ! systemctl list-unit-files NetworkManager.service >/dev/null 2>&1; then
        log "[WARN] NetworkManager.service nicht in systemd gefunden. WLAN kann trotzdem funktionieren, wird aber geprüft."
    fi

    if ! command -v hostnamectl >/dev/null 2>&1; then
        log "[WARN] hostnamectl nicht gefunden."
    fi

    if ! command -v ssh-keygen >/dev/null 2>&1; then
        log "[WARN] ssh-keygen nicht gefunden. SSH-Host-Keys können ggf. nicht neu erzeugt werden."
    fi

    if ! command -v useradd >/dev/null 2>&1; then
        log "[ERROR] useradd nicht gefunden. Nutzeranlage nicht möglich."
        ok=0
    fi

    if [[ "$ok" -ne 1 ]]; then
        return 1
    fi
    return 0
}

validate_config() {
    load_config || return 1

    local ok=1
    local effective_hostname
    effective_hostname="$(resolve_hostname)"

    log "[CONFIG] Boot-Verzeichnis: $BOOT_DIR"
    log "[CONFIG] Device-Konfig: $DEVICE_CONFIG"
    log "[CONFIG] DEVICE_ID='${DEVICE_ID:-}'"
    log "[CONFIG] Effektiver Hostname='$effective_hostname'"
    log "[CONFIG] WIFI_SSID='${WIFI_SSID:-}'"
    log "[CONFIG] WIFI_COUNTRY='${WIFI_COUNTRY:-}'"
    log "[CONFIG] WIFI_CONNECTION_NAME='${WIFI_CONNECTION_NAME:-}'"
    log "[CONFIG] CREATE_CLASSROOM_USER='${CREATE_CLASSROOM_USER:-}'"
    log "[CONFIG] CLASSROOM_USER='${CLASSROOM_USER:-}'"
    log "[CONFIG] FORCE_PASSWORD_CHANGE='${FORCE_PASSWORD_CHANGE:-}'"
    log "[CONFIG] CLASSROOM_USER_SUDO='${CLASSROOM_USER_SUDO:-}'"
    log "[CONFIG] REMOVE_OLD_USER='${REMOVE_OLD_USER:-}'"

    if ! validate_hostname "$effective_hostname"; then
        log "[ERROR] Ungültiger Hostname: '$effective_hostname'"
        ok=0
    fi

    if [[ "${CREATE_CLASSROOM_USER:-1}" -eq 1 ]]; then
        if ! validate_username "$CLASSROOM_USER"; then
            log "[ERROR] Ungültiger Benutzername: '$CLASSROOM_USER'"
            ok=0
        fi
        if [[ -z "${CLASSROOM_PASSWORD:-}" && -z "${CLASSROOM_PASSWORD_HASH:-}" ]]; then
            log "[ERROR] Kein Passwort gesetzt. Setze CLASSROOM_PASSWORD oder besser CLASSROOM_PASSWORD_HASH."
            ok=0
        fi
    fi

    if [[ -z "${WIFI_SSID:-}" ]]; then
        log "[ERROR] WIFI_SSID ist leer."
        ok=0
    fi
    if [[ -z "${WIFI_PSK:-}" ]]; then
        log "[ERROR] WIFI_PSK ist leer."
        ok=0
    fi

    if [[ "$ok" -eq 1 ]]; then
        log "[OK] Konfiguration plausibel."
        return 0
    fi
    log "[ERROR] Konfiguration ist nicht plausibel."
    return 1
}

configure_wifi_country() {
    log "[INFO] Setze WLAN-Ländercode: $WIFI_COUNTRY"

    if command -v raspi-config >/dev/null 2>&1; then
        run_cmd raspi-config nonint do_wifi_country "$WIFI_COUNTRY" || log "[WARN] raspi-config do_wifi_country fehlgeschlagen."
    else
        log "[WARN] raspi-config nicht gefunden."
    fi

    if command -v iw >/dev/null 2>&1; then
        run_cmd iw reg set "$WIFI_COUNTRY" || log "[WARN] iw reg set fehlgeschlagen."
    fi
}

configure_wifi_profile() {
    log "[INFO] Richte WLAN-Profil '$WIFI_CONNECTION_NAME' für SSID '$WIFI_SSID' ein."

    if [[ "$DRY_RUN" -eq 1 ]]; then
        log "[DRY-RUN] Würde NetworkManager-Verbindung anlegen/aktualisieren."
        return 0
    fi

    nmcli radio wifi on || true

    if nmcli connection show "$WIFI_CONNECTION_NAME" >/dev/null 2>&1; then
        log "[INFO] Bestehende Verbindung gefunden. Aktualisiere Profil."
    else
        nmcli connection add type wifi con-name "$WIFI_CONNECTION_NAME" ifname wlan0 ssid "$WIFI_SSID"
    fi

    nmcli connection modify "$WIFI_CONNECTION_NAME" \
        connection.autoconnect yes \
        connection.autoconnect-priority 100 \
        wifi.mode infrastructure \
        wifi.ssid "$WIFI_SSID" \
        wifi-sec.key-mgmt wpa-psk \
        wifi-sec.psk "$WIFI_PSK" \
        ipv4.method auto \
        ipv6.method auto

    chmod 600 /etc/NetworkManager/system-connections/* 2>/dev/null || true

    log "[INFO] Versuche WLAN-Verbindung zu aktivieren..."
    if nmcli connection up "$WIFI_CONNECTION_NAME"; then
        log "[OK] WLAN-Verbindung aktiviert."
        return 0
    fi

    log "[ERROR] WLAN-Verbindung konnte nicht aktiviert werden."
    return 1
}

set_unique_hostname() {
    local new_hostname
    new_hostname="$(resolve_hostname)"

    log "[INFO] Setze Hostname: $new_hostname"
    if [[ "$DRY_RUN" -eq 1 ]]; then
        log "[DRY-RUN] Würde hostnamectl set-hostname '$new_hostname' ausführen."
        log "[DRY-RUN] Würde /etc/hosts aktualisieren."
        return 0
    fi

    hostnamectl set-hostname "$new_hostname" || echo "$new_hostname" > /etc/hostname

    if grep -q "^127.0.1.1" /etc/hosts; then
        sed -i "s/^127.0.1.1.*/127.0.1.1\t$new_hostname/" /etc/hosts
    else
        echo -e "127.0.1.1\t$new_hostname" >> /etc/hosts
    fi

    log "[OK] Hostname gesetzt: $new_hostname"
}

regenerate_machine_id() {
    log "[INFO] Erzeuge machine-id neu."

    if [[ "$DRY_RUN" -eq 1 ]]; then
        log "[DRY-RUN] Würde /etc/machine-id und /var/lib/dbus/machine-id neu erzeugen."
        return 0
    fi

    rm -f /etc/machine-id /var/lib/dbus/machine-id
    systemd-machine-id-setup || true
    if [[ -f /etc/machine-id ]]; then
        ln -sf /etc/machine-id /var/lib/dbus/machine-id 2>/dev/null || true
    fi
    log "[OK] machine-id aktualisiert."
}

regenerate_ssh_host_keys() {
    log "[INFO] Erzeuge SSH-Host-Keys neu."

    if [[ "$DRY_RUN" -eq 1 ]]; then
        log "[DRY-RUN] Würde /etc/ssh/ssh_host_* löschen und ssh-keygen -A ausführen."
        return 0
    fi

    rm -f /etc/ssh/ssh_host_*
    ssh-keygen -A || log "[WARN] ssh-keygen -A fehlgeschlagen."

    if systemctl list-unit-files ssh.service >/dev/null 2>&1; then
        systemctl restart ssh || true
    fi

    log "[OK] SSH-Host-Keys neu erzeugt."
}

create_classroom_user() {
    if [[ "${CREATE_CLASSROOM_USER:-1}" -ne 1 ]]; then
        log "[INFO] Nutzeranlage ist deaktiviert."
        return 0
    fi

    local username="$CLASSROOM_USER"
    log "[INFO] Zielnutzer: $username"

    if id "$username" >/dev/null 2>&1; then
        log "[INFO] Nutzer '$username' existiert bereits. Aktualisiere Gruppen/Passwort gemäß Konfig."
    else
        if [[ "$DRY_RUN" -eq 1 ]]; then
            log "[DRY-RUN] Würde Nutzer '$username' mit Home-Verzeichnis anlegen."
        else
            useradd -m -s /bin/bash -c "$CLASSROOM_FULLNAME" "$username"
            log "[OK] Nutzer '$username' wurde angelegt."
        fi
    fi

    if [[ -n "${CLASSROOM_PASSWORD_HASH:-}" ]]; then
        if [[ "$DRY_RUN" -eq 1 ]]; then
            log "[DRY-RUN] Würde Passwort-Hash für '$username' setzen."
        else
            usermod --password "$CLASSROOM_PASSWORD_HASH" "$username"
            log "[OK] Passwort-Hash für '$username' gesetzt."
        fi
    elif [[ -n "${CLASSROOM_PASSWORD:-}" ]]; then
        if [[ "$DRY_RUN" -eq 1 ]]; then
            log "[DRY-RUN] Würde Klartextpasswort für '$username' über chpasswd setzen."
        else
            echo "${username}:${CLASSROOM_PASSWORD}" | chpasswd
            log "[OK] Passwort für '$username' gesetzt."
        fi
    else
        log "[ERROR] Kein Passwort für '$username' gesetzt."
        return 1
    fi

    if [[ "${CLASSROOM_USER_SUDO:-1}" -eq 1 ]]; then
        if getent group sudo >/dev/null 2>&1; then
            if [[ "$DRY_RUN" -eq 1 ]]; then
                log "[DRY-RUN] Würde '$username' zur Gruppe sudo hinzufügen."
            else
                usermod -aG sudo "$username"
            fi
        fi
    fi

    if [[ "${ADD_RPI_GROUPS:-1}" -eq 1 ]]; then
        local groups_to_add="adm dialout cdrom audio video plugdev games users input render netdev gpio i2c spi"
        if [[ "${CLASSROOM_USER_SUDO:-1}" -eq 1 ]]; then
            groups_to_add="sudo $groups_to_add"
        fi
        for group_name in $groups_to_add; do
            if getent group "$group_name" >/dev/null 2>&1; then
                if [[ "$DRY_RUN" -eq 1 ]]; then
                    log "[DRY-RUN] Würde '$username' zu Gruppe '$group_name' hinzufügen."
                else
                    usermod -aG "$group_name" "$username" || true
                fi
            fi
        done
    fi

    if [[ "${FORCE_PASSWORD_CHANGE:-0}" -eq 1 ]]; then
        if [[ "$DRY_RUN" -eq 1 ]]; then
            log "[DRY-RUN] Würde Passwortänderung beim ersten Login für '$username' erzwingen."
        else
            chage -d 0 "$username"
            log "[OK] Passwortänderung beim ersten Login aktiviert."
        fi
    fi

    if [[ "${REMOVE_OLD_USER:-0}" -eq 1 ]]; then
        if [[ -n "${OLD_USER_TO_REMOVE:-}" && "$OLD_USER_TO_REMOVE" != "$username" ]]; then
            if id "$OLD_USER_TO_REMOVE" >/dev/null 2>&1; then
                log "[INFO] Entferne alten Nutzer '$OLD_USER_TO_REMOVE'."
                if [[ "$DRY_RUN" -eq 1 ]]; then
                    log "[DRY-RUN] Würde deluser --remove-home '$OLD_USER_TO_REMOVE' ausführen."
                else
                    deluser --remove-home "$OLD_USER_TO_REMOVE" || log "[WARN] Konnte '$OLD_USER_TO_REMOVE' nicht vollständig entfernen."
                fi
            else
                log "[INFO] Alter Nutzer '$OLD_USER_TO_REMOVE' existiert nicht."
            fi
        else
            log "[WARN] Alter Nutzer wird nicht entfernt, weil OLD_USER_TO_REMOVE leer ist oder dem Zielnutzer entspricht."
        fi
    fi

    log "[OK] Nutzer-Konfiguration abgeschlossen."
}

cleanup_after_success() {
    if [[ "${CLEANUP_ON_SUCCESS:-1}" -ne 1 ]]; then
        log "[INFO] Cleanup deaktiviert."
        return 0
    fi

    log "[INFO] Bereinige temporäre Logs/History vorsichtig."

    if [[ "$DRY_RUN" -eq 1 ]]; then
        log "[DRY-RUN] Würde Shell-Histories und einige temporäre Dateien bereinigen."
        return 0
    fi

    rm -f /root/.bash_history 2>/dev/null || true
    find /home -maxdepth 2 -name ".bash_history" -type f -delete 2>/dev/null || true
    rm -rf /tmp/* /var/tmp/* 2>/dev/null || true
    journalctl --rotate >/dev/null 2>&1 || true
    journalctl --vacuum-time=1s >/dev/null 2>&1 || true
}

test_wifi() {
    load_config || return 1
    validate_config || return 1
    check_requirements || return 1

    configure_wifi_country
    if ! configure_wifi_profile; then
        return 1
    fi

    log "[INFO] NetworkManager Status:"
    nmcli device status | tee -a "$LOG_FILE" "$BOOT_LOG_FILE" >/dev/null || true

    log "[INFO] IP-Adresse wlan0:"
    ip -4 addr show wlan0 | tee -a "$LOG_FILE" "$BOOT_LOG_FILE" >/dev/null || true

    if [[ "${REQUIRE_INTERNET:-0}" -eq 1 ]]; then
        log "[TEST] Prüfe Internet per Ping auf $PING_TARGET"
        if ping -c 3 -W 3 "$PING_TARGET" >/dev/null 2>&1; then
            log "[OK] Internet-Ping erfolgreich."
        else
            log "[ERROR] Internet-Ping fehlgeschlagen."
            return 1
        fi
    else
        log "[INFO] Internet-Ping ist deaktiviert."
    fi

    log "[OK] WLAN-Test abgeschlossen."
}

run_firstboot() {
    log "============================================================"
    log "[START] Classroom First-Boot gestartet."
    log "============================================================"

    if [[ ! -f "$ENABLED_FLAG" ]]; then
        log "[INFO] First-Boot ist nicht scharfgeschaltet. Beende ohne Änderungen."
        exit 0
    fi

    if [[ -f "$DONE_FLAG" ]]; then
        log "[INFO] First-Boot wurde bereits abgeschlossen. Beende."
        exit 0
    fi

    rm -f "$FAILED_FLAG" 2>/dev/null || true

    load_config || { touch "$FAILED_FLAG"; exit 1; }
    validate_config || { touch "$FAILED_FLAG"; exit 1; }
    check_requirements || { touch "$FAILED_FLAG"; exit 1; }

    configure_wifi_country
    set_unique_hostname
    regenerate_machine_id
    create_classroom_user || { touch "$FAILED_FLAG"; exit 1; }
    regenerate_ssh_host_keys

    WIFI_OK=0
    if configure_wifi_profile; then
        WIFI_OK=1
    fi

    if [[ "${REQUIRE_WIFI_CONNECTIVITY:-1}" -eq 1 && "$WIFI_OK" -ne 1 ]]; then
        log "[ERROR] WLAN war erforderlich, konnte aber nicht verbunden werden."
        touch "$FAILED_FLAG"
        exit 1
    fi

    if [[ "${REQUIRE_INTERNET:-0}" -eq 1 ]]; then
        log "[INFO] Prüfe Internetverbindung per Ping auf $PING_TARGET"
        if ping -c 3 -W 3 "$PING_TARGET" >/dev/null 2>&1; then
            log "[OK] Internet erreichbar."
        else
            log "[ERROR] Internet-Ping fehlgeschlagen."
            touch "$FAILED_FLAG"
            exit 1
        fi
    fi

    cleanup_after_success

    touch "$DONE_FLAG"
    rm -f "$ENABLED_FLAG" "$FAILED_FLAG" 2>/dev/null || true
    systemctl disable classroom-firstboot.service >/dev/null 2>&1 || true
    systemctl disable classroom-firstboot-bootfallback.service >/dev/null 2>&1 || true

    log "[OK] Classroom First-Boot erfolgreich abgeschlossen."
    log "[INFO] Marker-Datei geschrieben: $DONE_FLAG"

    exit 0
}

show_status() {
    echo "Boot-Verzeichnis: $BOOT_DIR"
    echo "Logdatei: $LOG_FILE"
    echo "Boot-Logdatei: $BOOT_LOG_FILE"
    echo
    echo "Marker/Konfig auf Boot-Partition:"
    ls -l "$BOOT_DIR"/classroom-* 2>/dev/null || true
    echo
    echo "Aktive Hostname/IP-Infos:"
    hostnamectl 2>/dev/null || hostname || true
    ip -4 addr show wlan0 2>/dev/null || true
    echo
    echo "Letzte Logzeilen:"
    tail -n 80 "$LOG_FILE" 2>/dev/null || true
}

case "$MODE" in
    --dry-run)
        DRY_RUN=1
        log "[MODE] Dry-Run gestartet."
        load_config || exit 1
        validate_config || exit 1
        check_requirements || exit 1
        configure_wifi_country
        set_unique_hostname
        regenerate_machine_id
        create_classroom_user
        regenerate_ssh_host_keys
        configure_wifi_profile
        cleanup_after_success
        log "[OK] Dry-Run abgeschlossen. Es wurden keine Änderungen vorgenommen."
        ;;

    --test-config)
        log "[MODE] Test-Config gestartet."
        load_config || exit 1
        validate_config || exit 1
        check_requirements || exit 1
        log "[OK] Test-Config abgeschlossen."
        ;;

    --test-wifi)
        log "[MODE] WLAN-Test gestartet."
        test_wifi
        ;;

    --run)
        run_firstboot
        ;;

    --status)
        show_status
        ;;

    *)
        echo "Verwendung:"
        echo "  sudo classroom-firstboot --dry-run"
        echo "  sudo classroom-firstboot --test-config"
        echo "  sudo classroom-firstboot --test-wifi"
        echo "  sudo classroom-firstboot --run"
        echo "  sudo classroom-firstboot --status"
        exit 1
        ;;
esac
SCRIPT

chmod 755 /usr/local/sbin/classroom-firstboot
chown root:root /usr/local/sbin/classroom-firstboot

cat > /usr/local/sbin/classroom-firstboot-arm <<'SCRIPT'
#!/usr/bin/env bash
set -euo pipefail

BOOT_DIR="/boot/firmware"
if [[ ! -d "$BOOT_DIR" ]]; then
    BOOT_DIR="/boot"
fi

ENABLED_FLAG="$BOOT_DIR/classroom-firstboot.enabled"
DONE_FLAG="$BOOT_DIR/classroom-firstboot.done"
FAILED_FLAG="$BOOT_DIR/classroom-firstboot.failed"
LOG_FILE="$BOOT_DIR/classroom-firstboot.log"

if [[ $EUID -ne 0 ]]; then
    echo "Bitte mit sudo ausführen:"
    echo "  sudo classroom-firstboot-arm"
    exit 1
fi

echo "[INFO] Prüfe Konfiguration vor dem Scharfschalten..."
if ! classroom-firstboot --test-config; then
    echo "[ERROR] Konfiguration ist nicht gültig. Nicht scharfgeschaltet."
    exit 1
fi

rm -f "$DONE_FLAG" "$FAILED_FLAG"
touch "$ENABLED_FLAG"
chmod 644 "$ENABLED_FLAG" || true

systemctl enable classroom-firstboot.service >/dev/null
systemctl enable classroom-firstboot-bootfallback.service >/dev/null 2>&1 || true

echo "[OK] Classroom First-Boot wurde scharfgeschaltet."
echo
echo "Marker-Datei: $ENABLED_FLAG"
echo "Logdatei:     $LOG_FILE"
echo
echo "WICHTIG: Jetzt den Master/Test-Pi herunterfahren und NICHT erneut booten:"
echo
echo "  sudo shutdown -h now"
echo
echo "Danach Image von dieser SD-Karte ziehen."
SCRIPT

chmod 755 /usr/local/sbin/classroom-firstboot-arm
chown root:root /usr/local/sbin/classroom-firstboot-arm

cat > /usr/local/sbin/classroom-firstboot-disarm <<'SCRIPT'
#!/usr/bin/env bash
set -euo pipefail

BOOT_DIR="/boot/firmware"
if [[ ! -d "$BOOT_DIR" ]]; then
    BOOT_DIR="/boot"
fi

if [[ $EUID -ne 0 ]]; then
    echo "Bitte mit sudo ausführen:"
    echo "  sudo classroom-firstboot-disarm"
    exit 1
fi

rm -f "$BOOT_DIR/classroom-firstboot.enabled"
systemctl disable classroom-firstboot.service >/dev/null 2>&1 || true

echo "[OK] Classroom First-Boot ist entschärft."
SCRIPT

chmod 755 /usr/local/sbin/classroom-firstboot-disarm
chown root:root /usr/local/sbin/classroom-firstboot-disarm

cat > /etc/systemd/system/classroom-firstboot.service <<'UNIT'
[Unit]
Description=Classroom Raspberry Pi First-Boot Setup
Wants=NetworkManager.service
After=NetworkManager.service
ConditionPathExists=/boot/firmware/classroom-firstboot.enabled

[Service]
Type=oneshot
ExecStart=/usr/local/sbin/classroom-firstboot --run
RemainAfterExit=no
TimeoutStartSec=180

[Install]
WantedBy=multi-user.target
UNIT

# Fallback-Service für ältere Layouts ohne /boot/firmware.
cat > /etc/systemd/system/classroom-firstboot-bootfallback.service <<'UNIT'
[Unit]
Description=Classroom Raspberry Pi First-Boot Setup Fallback Boot Path
Wants=NetworkManager.service
After=NetworkManager.service
ConditionPathExists=/boot/classroom-firstboot.enabled

[Service]
Type=oneshot
ExecStart=/usr/local/sbin/classroom-firstboot --run
RemainAfterExit=no
TimeoutStartSec=180

[Install]
WantedBy=multi-user.target
UNIT

systemctl daemon-reload
# Wichtig: Installation aktiviert den Service noch NICHT. Aktivieren erst mit classroom-firstboot-arm.
systemctl disable classroom-firstboot.service >/dev/null 2>&1 || true
systemctl disable classroom-firstboot-bootfallback.service >/dev/null 2>&1 || true

echo
echo "[OK] Installation abgeschlossen."
echo
echo "Nächste Schritte auf der Testkarte:"
echo "  1) Beispiel-Konfig auf Boot-Partition kopieren/anpassen:"
echo "     sudo cp classroom-device.conf.example /boot/firmware/classroom-device.conf"
echo "     sudo nano /boot/firmware/classroom-device.conf"
echo
echo "  2) Konfig testen:"
echo "     sudo classroom-firstboot --test-config"
echo
echo "  3) Dry-Run testen:"
echo "     sudo classroom-firstboot --dry-run"
echo
echo "  4) WLAN real testen:"
echo "     sudo classroom-firstboot --test-wifi"
echo
echo "  5) Final scharfschalten, DIREKT herunterfahren, Image ziehen:"
echo "     sudo classroom-firstboot-arm"
echo "     sudo shutdown -h now"
echo
