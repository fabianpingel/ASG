#!/usr/bin/env bash
set -euo pipefail

# Erzeugt einen SHA-512 Passwort-Hash für Linux / usermod --password.
# Nutzung:
#   ./make_password_hash.sh
# Danach den ausgegebenen Hash in classroom-device.conf eintragen:
#   CLASSROOM_PASSWORD=""
#   CLASSROOM_PASSWORD_HASH='$6$...'

if ! command -v openssl >/dev/null 2>&1; then
    echo "[ERROR] openssl wurde nicht gefunden."
    exit 1
fi

read -r -s -p "Passwort eingeben: " PASS1
echo
read -r -s -p "Passwort wiederholen: " PASS2
echo

if [[ "$PASS1" != "$PASS2" ]]; then
    echo "[ERROR] Passwörter stimmen nicht überein."
    exit 1
fi

HASH=$(openssl passwd -6 "$PASS1")
echo
echo "Passwort-Hash:"
echo "$HASH"
echo
echo "In classroom-device.conf eintragen:"
echo "CLASSROOM_PASSWORD=\"\""
echo "CLASSROOM_PASSWORD_HASH='$HASH'"
