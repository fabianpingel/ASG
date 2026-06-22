# Raspberry Pi Classroom First-Boot Setup

Dieses Paket richtet ein reproduzierbares First-Boot-System für Raspberry Pi Zero 2 W Schulkarten ein.

## Zielarchitektur

1. Du erstellst ein Original-Master-Image deiner fertig eingerichteten SD-Karte.
2. Du testest dieses Paket auf einer zweiten SD-Karte.
3. Du erzeugst ein finales Image im Zustand **scharfgeschaltet, aber noch nicht ausgeführt**.
4. Du schreibst dieses finale Image auf alle SD-Karten.
5. Pro SD-Karte legst du auf der PC-lesbaren Boot-Partition eine `classroom-device.conf` ab.
6. Beim ersten Start richtet sich jeder Raspberry Pi automatisch ein.

## Dateien

- `install_classroom_firstboot.sh`  
  Installer für den Raspberry Pi.

- `classroom-device.conf.example`  
  Beispiel-Konfiguration für eine einzelne SD-Karte.

- `generate_device_configs.py`  
  Optionales Hilfsskript, um viele `classroom-device-XX.conf` Dateien zu erzeugen.

- `make_password_hash.sh`  
  Hilfsskript zum Erzeugen eines Linux-Passwort-Hashes.

## Installation auf Test-/Masterkarte

```bash
chmod +x install_classroom_firstboot.sh
sudo bash install_classroom_firstboot.sh
```

Beispielkonfiguration auf die Boot-Partition kopieren:

```bash
sudo cp classroom-device.conf.example /boot/firmware/classroom-device.conf
sudo nano /boot/firmware/classroom-device.conf
```

Falls dein Image noch `/boot` statt `/boot/firmware` nutzt:

```bash
sudo cp classroom-device.conf.example /boot/classroom-device.conf
sudo nano /boot/classroom-device.conf
```

## Tests

Konfiguration prüfen:

```bash
sudo classroom-firstboot --test-config
```

Dry-Run ohne Änderungen:

```bash
sudo classroom-firstboot --dry-run
```

WLAN real testen:

```bash
sudo classroom-firstboot --test-wifi
```

Status/Logs prüfen:

```bash
sudo classroom-firstboot --status
```

Logs liegen zusätzlich auf der Boot-Partition:

```text
classroom-firstboot.log
classroom-firstboot.done
classroom-firstboot.failed
classroom-firstboot.enabled
```

## Finales Image vorbereiten

Wenn alles funktioniert:

```bash
sudo classroom-firstboot-arm
sudo shutdown -h now
```

Danach die SD-Karte **nicht nochmal booten**, sondern direkt das finale Image ziehen.

## Pro SD-Karte individualisieren

Nach dem Schreiben des finalen Images auf eine SD-Karte:

1. SD-Karte am PC öffnen.
2. Auf der Boot-Partition `classroom-device.conf` ablegen/anpassen.
3. Karte in Raspberry Pi stecken.
4. Beim ersten Boot läuft die Konfiguration automatisch.

## Sicherheitshinweis

Klartextpasswörter in `classroom-device.conf` sind auf der Boot-Partition sichtbar. Besser ist `CLASSROOM_PASSWORD_HASH`.

Hash erzeugen auf Linux/Raspberry Pi:

```bash
./make_password_hash.sh
```

oder direkt:

```bash
openssl passwd -6
```
