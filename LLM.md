# 🚀 Build Your Own AI 🧠
# 💬 Dein eigenes Sprachmodell *Tiny-GPT* auf einem Raspberry Pi Zero

Diese Anleitung orientiert sich an diesem englischsprachigen [Tutorial](https://github.com/Gilzone/Installing-a-LLM-on-Raspberry-Pi-Zero-2-W) und zeigt dir Schritt für Schritt, wie du auf einem sehr kleinen, kostengünstigen Computer – dem **[Raspberry Pi Zero 2 W](https://www.raspberrypi.com/products/raspberry-pi-zero-2-w/)** – ein eigenes **Großes-Sprach-Modell (Large-Language-Model, LLM)** installierst und ausführst.

Du brauchst hierfür **keine Programmier- oder IT-Kenntnisse**.  Alles wird Dir erklärt 😊

---

# 🎯 Ziel

Am Ende kannst du:

- Ein Betriebssystem installieren
- Ein LLM **lokal** auf deinem Raspberry Pi starten
- Fragen an das Sprachmodell stellen
- Verstehen, wie Sprachmodelle „funktionieren“


## 📍 Was bedeutet „lokal“?

👉 **Lokal** heißt:
- Auf deinem eigenen Gerät (volle Kontrolle!)
- Ohne Internet (niemald liest mit!)
- Daten bleiben bei dir (Datenschutz!)

🌍 **Online** (Gegenteil): Normalerweise werden LLMs wie z.B. [Chat-GPT](https://chatgpt.com/)  oder [Gemini](https://gemini.google.com/?is_sa=1&is_sa=1&android-min-version=301356232&ios-min-version=322.0&campaign_id=bkws&utm_source=sem&utm_medium=paid-media&utm_campaign=bkws&pt=9008&mt=8&ct=p-growth-sem-bkws&gclsrc=aw.ds&gad_source=1&gad_campaignid=20437330488&gbraid=0AAAAApk5Bhll4UdF6H12nDRP-hYPNvO_3&gclid=Cj0KCQiA18DMBhDeARIsABtYwT1UtnWIxdl1yIjM5aGZn1GUVL_2VCC23zdFXqipTi6-jjiXP40WlQ0aAnB1EALw_wcB) *in der Cloud* ausgeführt. Dazu werden Eure Fragen und Antworten übers Internet an die Supercomputer der jeweiligen Anbieter (OpenAI/Google) geschickt und dort verarbeitet. 

---

# 🧰 Voraussetzungen

## 💻 Hardware (die Geräte)

### 🧠 Raspberry Pi Zero 2 W

Der Raspberry Pi Zero 2 W ist ein Mini-Computer.
Er ist ungefähr halb so groß wie eine Kredit- oder EC-Karte und passt in Deine Hosentasche, kann aber Programme ausführen wie ein *normaler* PC.

<img src="https://assets.raspberrypi.com/static/51035ec4c2f8f630b3d26c32e90c93f1/2b8d7/zero2-hero.webp" style="width:600px;">

Hier mal zum Vergleich, was mein erster PC konnte, als ich so alt war wie ihr. (lang ist es her... 😄)

| Merkmal | Raspberry Pi Zero 2 W | Typischer PC (ca. 1996) |
|----------|----------------------|---------------------------|
| 🧠 Prozessor | 1 GHz (viel schneller) | 75–166 MHz |
| 💾 Arbeitsspeicher | 512 MB | 8–16 MB |
| 💽 Speicher | SD-Karte bis 32 GB+ | Festplatte 500 MB – 1 GB |
| 📶 Netzwerk | WLAN & Bluetooth eingebaut | meist Modem oder kein Netzwerk |
| 📺 Bildschirm | externer Monitor möglich | großer Röhrenmonitor |
| ⚡ Stromverbrauch | sehr wenig | viel Strom |
| 💰 Preis | ca. 17 € | oft 1000 DM oder mehr |
| 📏 Größe | kreditkartengroß | großer Desktop-PC |

--- 

### 💾 MicroSD-Karte (mindestens 32 GB)

Die SD-Karte ist die **Festplatte** des Raspberry Pi's. 

<img src="https://www.sandisk.com/content/dam/store/en-us/assets/products/memory-cards/extreme-uhs-i-microsd/extreme-uhs-i-microsd-32gb.png.wdthumb.1280.1280.webp" style="width:300px;">

Darauf werden das Betriebssystem, alle Programme und unser Sprachmodell gespeichert.

👉 Ohne SD-Karte kann der Raspberry Pi nicht starten!

--- 

### 🔌 Micro-USB-Netzteil

Der Raspberry Pi braucht Strom (Energie), genau wie jedes elektrische Gerät.

<img src="https://assets.raspberrypi.com/static/c7430727cbd44e1a3873a1696de85284/9ff6b/38da32b0-76fe-4cb6-9b6e-7dea9238f1dd_PSU%2BHero.webp" style="width:300px;">

**⚠️ Wichtiger Hinweis:**

Nur geprüfte Netzteil mit **Micro-USB Anschluss und 5V / 2.5A DC** benutzen!

Ein falsches Netzteil kann Probleme machen:
  - Pi startet nicht
  - Programme stürzen ab
  - SD-Karte kann beschädigt werden
  - Zu hohe Spannung (>5V) kann den Pi dauerhaft beschädigen 

👉 Sicherheit geht vor❗

---

## 🌐 Internetverbindung (WLAN)

Wir brauchen zunächst das Internet, um:
- Programme herunterzuladen und 
- das Sprachmodell zu installieren

Der Raspberry Pi Zero 2 W hat bereits WLAN eingebaut.
Man kann ihn wie ein Handy mit dem WLAN verbinden.

⚠️ Besorgt Euch schon mal den WLAN-Namen (SSID) und das WLAN-Passwort.
Dies braucht ihr später noch!

👉 Wenn alles eingerichtet ist, wird das Modell aber ohne Internet laufen!

---

## 🧑‍💻 Software (die Programme)
### 🐧 Betriebssystem

Das Betriebssystem ist wie Windows oder macOS und sorgt dafür, dass Programme laufen können.
Für den Raspberry Pi benutzen wir **Raspberry Pi OS (Legacy, 64-bit) Lite**.  

---

### 🤖 Ollama

[Ollama](https://ollama.com/) ist ein Programm, mit dem man Sprachmodelle auf dem eigenen Computer starten kann.

Die Gründer heißen *Jeffrey Morgan* und *Michael Chiang*. Ihr Ziel war es, KI **für alle zugänglich** und **einfach nutzbar** zu machen – auch ohne teure Server oder Cloud‑Dienste. Solche Art von Software nennt man auch **Open-Source**!

#### 🛠️ Was bedeutet Open-Source?

👉 Jeder kann den Code sehen, *kostenlos* benutzen und mithelfen.

👉 Es ist wie ein Rezeptbuch für Programme – offen für alle Menschen auf der ganzen Welt.

- Man kann den Quelltext/Code lesen und verstehen, wie das Programm funktioniert
- Mitmachen erlaubt: Man kann Fehler verbessern und neue Funktionen hinzufügen

---

### 🧠 Sprachmodell (LLM)

Ein großes Sprachmodell (**L**arge-**L**anguage-**M**odel **LLM**) ist ein Programm, das Texte versteht und Antworten schreibt.
Zum Beispiel ähnlich wie ChatGPT – nur kleiner und auf unserem eigenen Gerät.

Im Gegensatz zu kommerziellen Sprachmodellen z.B. ChatGPT (OpenAI) sind Open-Source LLMs **kostenlos** nutzbar.

Es gibt inzwischen sehr viele freie LLMs z.B. für Bildung & Forschung (Universitäten), Schüler:innen, Entwickler:innen sollen KI verstehen können




👉 Vorteile:

Privatsphäre – Daten bleiben lokal

Kostenlos nutzbar

Lehrreich – man kann sehen, wie KI funktioniert

Experimente – ihr könnt eigene Versionen bauen

🌟 Warum gibt es freie LLMs?

Bildung & Forschung

Universitäten, Schüler:innen, Entwickler:innen sollen KI verstehen können

Transparenz & Kontrolle

Jeder kann prüfen, wie die KI Antworten erzeugt

Zugang für alle

Nicht jeder kann teure Server oder Cloud-Dienste bezahlen





## 👩‍🏫 Was ihr außerdem braucht

- etwas Geduld 😊
- Teamarbeit (helft Euch gegenseitig!)
- Lust, Neues auszuprobieren

👉 Und denkt immer daran: Fehler gehören dazu – nur so lernt man (am besten).

---


## Software

Diese Programme brauchst du auf deinem Computer:

- **Raspberry Pi Imager**  
  https://www.raspberrypi.com/software/

- **Raspberry Pi OS (Legacy, 64-bit) Lite**  
  (Wird im Imager ausgewählt)

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



