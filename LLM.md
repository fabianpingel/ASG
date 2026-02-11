# 🧠 Installation eines LLM auf einem Raspberry Pi Zero 2 W mit Ollama

Diese Anleitung orientiert sich an [diesem](https://github.com/Gilzone/Installing-a-LLM-on-Raspberry-Pi-Zero-2-W) englischsprachigen Tutorial und zeigt dir Schritt für Schritt, wie du auf einem sehr kleinen, kostengünstigen Computer – dem **[Raspberry Pi Zero 2 W](https://www.raspberrypi.com/products/raspberry-pi-zero-2-w/)** – ein eigenes **Großes-Sprach-Modell (LLM)** installierst und ausführst.

Du brauchst **keine Programmier- oder Linux-Vorkenntnisse**.  
Alles wird erklärt 😊

---

# 🎯 Ziel

Am Ende kannst du:

- Ein LLM lokal auf deinem Raspberry Pi starten
- Fragen an das Sprachmodell stellen
- Verstehen, wie KI „auf Hardware läuft“

---

# 🧰 Voraussetzungen

## Hardware

- Raspberry Pi Zero 2 W  
- MicroSD-Karte (mind. 32 GB empfohlen)
- Micro-USB-Netzteil
- Internetverbindung (WLAN oder Adapter)

👉 Die SD-Karte ist die „Festplatte“ des Raspberry Pi.

---

## Software

Diese Programme brauchst du auf deinem Computer:

- **Raspberry Pi Imager**  
  https://www.raspberrypi.com/software/

- **Raspberry Pi OS (Legacy, 64-bit) Lite**  
  (Wird im Imager ausgewählt)

- **Ollama**  
  https://ollama.com

---

# 1️⃣ Betriebssystem installieren („Flashen“)

„Flashen“ bedeutet:  
Das Betriebssystem auf die SD-Karte schreiben.

---

## Schritt 1: Imager herunterladen

👉 https://www.raspberrypi.com/software/

Installiere und starte das Programm.

---

📸 **Screenshot-Platzhalter:**  
`[Screenshot: Raspberry Pi Imager Startbildschirm]`

---

## Schritt 2: SD-Karte einstecken

Stecke die MicroSD-Karte in deinen Computer.

---

## Schritt 3: System auswählen

Im Imager einstellen:

- **Operating System:**  
  Raspberry Pi OS (Legacy, 64-bit) Lite

- **Storage:**  
  Deine SD-Karte

---

📸 **Screenshot-Platzhalter:**  
`[Screenshot: OS- und Storage-Auswahl im Imager]`

---

👉 Warum „Lite“?

- Keine grafische Oberfläche
- Spart Leistung
- Besser für KI auf schwacher Hardware

---

## Schritt 4: Erweiterte Optionen ⚙️

Aktiviere:

- SSH
- Benutzername + Passwort
- WLAN (falls nötig)

---

📸 **Screenshot-Platzhalter:**  
`[Screenshot: Advanced Options im Imager]`

---

👉 Warum?

Der Pi hat keinen Bildschirm →  
Du steuerst ihn später aus der Ferne.

---

## Schritt 5: Schreiben

Klicke **Write** und warte.

Danach SD-Karte sicher entfernen.

---

# 2️⃣ Erste Einrichtung

## Schritt 1: Raspberry Pi starten

- SD-Karte einstecken
- Strom anschließen

Er startet automatisch.

---

## Schritt 2: IP-Adresse finden

Am Computer im Terminal eingeben:

```bash
arp -a
```

suche nach
```bash
raspberrypi
```

📸 Screenshot-Platzhalter:
[Screenshot: Terminal mit arp -a Ausgabe]

👉 Die IP ist die „Adresse“ des Pi im Netzwerk.

---

Schritt 3: Verbindung herstellen (SSH)
```bash
ssh pi@raspberrypi.local
```

📸 Screenshot-Platzhalter:
[Screenshot: Erste SSH-Verbindung]

Falls Fehler:

```bash
ssh-keygen -R raspberrypi.local
```

Dann erneut verbinden.

---

# 3️⃣ System aktualisieren 🔄
```bash
sudo apt update && sudo apt full-upgrade -y
sudo rpi-update
```

👉 Warum?

- Sicherheitsupdates
- Fehlerbehebungen
- Bessere Stabilität

Vergleich: Handy-Softwareupdate.

📸 Screenshot-Platzhalter:
[Screenshot: Update-Prozess im Terminal]

---

# 4️⃣ Raspberry Pi schneller machen 🚀

Der Pi Zero ist sehr schwach → Optimierung nötig.

## 4.1 Overclocking (Übertakten)

Datei öffnen:

```bash
sudo nano /boot/config.txt
```

Am Ende einfügen:

```bash
over_voltage=6
arm_freq=1000
force_turbo=1
```

Speichern mit:

- Ctrl + O
- Enter
- Ctrl + X

📸 Screenshot-Platzhalter:
[Screenshot: config.txt mit Overclocking-Einträgen]

⚠️ Achtung:

- Mehr Hitze
- Garantie kann verfallen
- Risiko bei falscher Nutzung

👉 Warum machen wir das?

KI braucht Rechenleistung.

## 4.2 Swap-Speicher erhöhen

Swap = „Ersatz-RAM“ auf der SD-Karte.

Deaktivieren:
```bash
sudo dphys-swapfile swapoff
```

Konfiguration öffnen:
```bash
sudo nano /etc/dphys-swapfile
```

Ändern:
```bash
CONF_SWAPSIZE=1024
```

Aktivieren:
```bash
sudo dphys-swapfile setup
sudo dphys-swapfile swapon
```

📸 Screenshot-Platzhalter:
[Screenshot: Swapfile-Konfiguration]

👉 Warum?

Der Pi hat sehr wenig Arbeitsspeicher.
Swap verhindert Abstürze.

---

# 5️⃣ KI-Bibliotheken installieren 📦
```bash
pip install transformers optimum
pip install torch torchvision --extra-index-url https://download.pytorch.org/whl/arm
```

👉 Erklärung:

- transformers → Sprachmodelle nutzen

- torch → KI rechnen lassen

- optimum → Optimierung

📸 Screenshot-Platzhalter:
[Screenshot: pip Installationsausgabe]

---

# 6️⃣ Ollama installieren 🦙

Download + Installation:

```bash
curl -fsSL https://ollama.com/install.sh | sh
```

👉 Website:
https://ollama.com

Installation prüfen:
```bash
ollama --version
```

📸 Screenshot-Platzhalter:
[Screenshot: Ollama Versionsausgabe]

👉 Was ist Ollama?

Eine Software, die:

- KI-Modelle herunterlädt
- Lokal startet
- Chat ermöglicht

---

# 7️⃣ KI-Modell starten 🧠
```bash
ollama run smollm2:135m-instruct-q4_K_S
```

👉 Was passiert hierbei?

1. Modell wird geladen
2. Lokal gespeichert
3. Startet im Terminal
4. Du kannst Fragen stellen

📸 Screenshot-Platzhalter:
[Screenshot: Laufendes Modell im Terminal]

---

# ⚠️ Hinweise
## Leistung

Der Pi Zero 2 W ist sehr schwach.

Erwarte:

- Langsame Antworten
- Lange Ladezeiten

👉 Besser: Raspberry Pi 4/5

## Temperatur 🌡️

Beim Übertakten:

- Gerät kann heiß werden
- Kühlung empfohlen

---

# ✅ Zusammenfassung

Du hast:

1. Betriebssystem installiert
2. Fernzugriff eingerichtet
3. Updates gemacht
4. Leistung optimiert
5. KI-Bibliotheken installiert
6. Ollama eingerichtet
7. Ein LLM gestartet

🎉 Ergebnis:
Dein eigener Mini-KI-Computer!
