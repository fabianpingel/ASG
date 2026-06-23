#!/usr/bin/env python3
"""
generate_device_configs.py

Erzeugt mehrere classroom-device-XX.conf Dateien zur späteren Ablage auf der
Boot-Partition einzelner SD-Karten.

Beispiel:
  python generate_device_configs.py --count 15 --wifi-ssid "SchulWLAN" --wifi-psk "Passwort" --out configs

Hinweis:
  Dieses Skript schreibt standardmäßig Klartextpasswörter in die Konfigdateien.
  Für bessere Sicherheit kannst du nachträglich CLASSROOM_PASSWORD_HASH setzen
  und CLASSROOM_PASSWORD leer lassen.
"""

from pathlib import Path
import argparse


def build_config(i: int, args: argparse.Namespace) -> str:
    device_id = f"{i:02d}"
    hostname = f"{args.host_prefix}-{device_id}"
    username = f"{args.user_prefix}{device_id}"
    fullname = f"{args.fullname_prefix} {device_id}"
    password = args.password_pattern.format(n=i, nn=device_id)

    return f"""# classroom-device.conf für Karte {device_id}
DEVICE_ID="{device_id}"

HOST_PREFIX="{args.host_prefix}"
HOSTNAME="{hostname}"

WIFI_COUNTRY="{args.wifi_country}"
WIFI_SSID="{args.wifi_ssid}"
WIFI_PSK="{args.wifi_psk}"
WIFI_CONNECTION_NAME="classroom-wifi"

CREATE_CLASSROOM_USER=1
CLASSROOM_USER="{username}"
CLASSROOM_FULLNAME="{fullname}"

# Klartextpasswort. Besser: CLASSROOM_PASSWORD_HASH verwenden.
CLASSROOM_PASSWORD="{password}"
CLASSROOM_PASSWORD_HASH=""

FORCE_PASSWORD_CHANGE={1 if args.force_password_change else 0}
CLASSROOM_USER_SUDO={1 if args.sudo else 0}
ADD_RPI_GROUPS=1

REMOVE_OLD_USER={1 if args.remove_old_user else 0}
OLD_USER_TO_REMOVE="{args.old_user}"

REQUIRE_WIFI_CONNECTIVITY=1
REQUIRE_INTERNET={1 if args.require_internet else 0}
PING_TARGET="{args.ping_target}"
CLEANUP_ON_SUCCESS=1
"""


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--count", type=int, required=True, help="Anzahl Karten")
    parser.add_argument("--out", default="device_configs", help="Ausgabeordner")
    parser.add_argument("--wifi-ssid", default="KI-Workshop", help="WLAN SSID")
    parser.add_argument("--wifi-psk", default="Workshop!2026", help="WLAN Passwort")
    parser.add_argument("--wifi-country", default="DE")
    parser.add_argument("--host-prefix", default="rpi02w")
    parser.add_argument("--user-prefix", default="user")
    parser.add_argument("--fullname-prefix", default="Schueler")
    parser.add_argument("--password-pattern", default="StartPasswort{nn}!", help="Pattern mit {n} oder {nn}")
    parser.add_argument("--force-password-change", action="store_true")
    parser.add_argument("--sudo", action="store_true", default=True)
    parser.add_argument("--no-sudo", dest="sudo", action="store_false")
    parser.add_argument("--remove-old-user", action="store_true")
    parser.add_argument("--old-user", default="")
    parser.add_argument("--require-internet", action="store_true")
    parser.add_argument("--ping-target", default="8.8.8.8")
    args = parser.parse_args()

    out = Path(args.out)
    out.mkdir(parents=True, exist_ok=True)

    for i in range(1, args.count + 1):
        device_id = f"{i:02d}"
        path = out / f"classroom-device-{device_id}.conf"
        path.write_text(build_config(i, args), encoding="utf-8")
        print(f"geschrieben: {path}")

    print()
    print("Fertig. Für jede SD-Karte die passende Datei nach dem Flashen auf die Boot-Partition kopieren")
    print("und dort in 'classroom-device.conf' umbenennen.")


if __name__ == "__main__":
    main()
