# 🧰 Voraussetzungen (Checkliste)
Damit wir unser kleines Sprachmodell später lokal auf dem Raspberry Pi starten können, brauchst du ein paar Dinge.

Keine Sorge: Das meiste ist schnell vorbereitet ✅


## ✅ Kurz-Checkliste (zum Abhaken)

### Hardware
- [ ] Raspberry Pi Zero 2 W
- [ ] microSD‑Karte (mind. **32 GB** empfohlen)
- [ ] Netzteil: **Micro‑USB, 5V / 2.5A**
- [ ] WLAN‑Zugang (SSID + Passwort)
- [ ] Computer/Laptop (Windows/macOS/Linux) mit SD‑Karten‑Slot oder Adapter

### Software (auf deinem Computer)
- [ ] Raspberry Pi Imager
- [ ] Raspberry Pi OS (Legacy, 64-bit) Lite (wird im Imager ausgewählt)
- [ ] Terminal/PowerShell (für SSH)
- [ ] (später auf dem Pi) Ollama + ein kleines Sprachmodell (LLM)

***

## 💻 Hardware (die Geräte)

### 🧠 Raspberry Pi Zero 2 W
Der **Raspberry Pi Zero 2 W** ist ein Mini‑Computer.  
Er ist ungefähr halb so groß wie eine Kredit- oder EC‑Karte und passt in deine Hosentasche – kann aber Programme ausführen wie ein *normaler* PC.

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

***

### 💾 MicroSD‑Karte (mindestens 32 GB)
Die SD‑Karte ist die **Festplatte** des Raspberry Pi.

<img src="https://www.sandisk.com/content/dam/store/en-us/assets/products/memory-cards/extreme-uhs-i-microsd/extreme-uhs-i-microsd-32gb.png.wdthumb.1280.1280.webp" style="width:300px;">

Darauf werden gespeichert:
- das Betriebssystem (Raspberry Pi OS)
- alle Programme
- unser kleines Sprachmodell (LLM)

👉 **Ohne SD‑Karte kann der Raspberry Pi nicht starten!**

**Empfehlung:** 32 GB oder mehr (damit genug Platz für Updates & Modelle da ist).

***

### 🔌 Micro‑USB‑Netzteil
Der Raspberry Pi braucht Strom (Energie), genau wie jedes elektrische Gerät.

<img src="https://assets.raspberrypi.com/static/c7430727cbd44e1a3873a1696de85284/9ff6b/38da32b0-76fe-4cb6-9b6e-7dea9238f1dd_PSU%2BHero.webp" style="width:300px;">

**⚠️ Wichtiger Hinweis:**  
Nur geprüfte Netzteile mit **Micro‑USB** und **5V / 2.5A DC** benutzen!

Ein falsches Netzteil kann Probleme machen:
- Pi startet nicht
- Programme stürzen ab
- SD‑Karte kann beschädigt werden
- Zu hohe Spannung (>5V) kann den Pi dauerhaft beschädigen

👉 **Sicherheit geht vor❗**

***

## 🌐 Internetverbindung (WLAN)
Wir brauchen zunächst das Internet, um:
- Programme herunterzuladen
- das Sprachmodell zu installieren

Der Raspberry Pi Zero 2 W hat WLAN schon eingebaut – man verbindet ihn wie ein Handy mit dem WLAN.

⚠️ **Wichtig:** Besorgt euch vorher:
- WLAN‑Name (**SSID**)
- WLAN‑Passwort

👉 Wenn alles eingerichtet ist, kann das Modell später **auch ohne Internet** laufen.

***

## 🧑‍💻 Software (die Programme)

### Raspberry Pi Imager - Installationsanleitung

Der **Raspberry Pi Imager** ist ein Programm, mit dem Du das Betriebssystem für deinen Raspberry Pi ganz einfach auf eine **microSD-Karte** kopieren kannst.

#### 🔽 Schritt 1: Raspberry Pi Imager herunterladen

Öffne einen Browser (z. B. Edge oder Chrome) und gehe auf die **offizielle Website**: https://www.raspberrypi.com/software/  

<img src="../images\RPIImager\0_Download.png" style="width:700px;" alt="Schreibfortschritt">

Klicke auf **„Download for Windows“**. 

***

#### 💾 Schritt 2: Programm installieren
1. Öffne die heruntergeladene Datei (z. B. `imager.exe`)
2. Klicke auf **„Installieren“**
3. Falls Windows nachfragt → **„Ja“** anklicken

➡️ Nach ein paar Sekunden ist der Raspberry Pi Imager installiert.  

***

#### ▶️ Schritt 3: Raspberry Pi Imager starten
- Öffne das **Startmenü**
- Suche nach **„Raspberry Pi Imager“**
- Klicke auf das Programmsymbol 🥧

Jetzt ist alles bereit für den nächsten Schritt:  
👉 Das Betriebssystem auf die SD‑Karte schreiben!

***


### 🐧 Betriebssystem (Raspberry Pi OS)
Ein Betriebssystem ist wie Windows oder macOS – es sorgt dafür, dass Programme laufen können.

Für den Raspberry Pi benutzen wir:
- **Raspberry Pi OS (Legacy, 64-bit) Lite**

**Warum „Lite“?**
- weniger Schnickschnack
- schneller auf schwacher Hardware
- ideal für Terminal/SSH und unser Mini‑LLM

---

### 🤖 Ollama (LLM lokal starten)
**Ollama** ist ein Programm, mit dem man Sprachmodelle lokal starten und nutzen kann.

**Warum ist das praktisch?**
- Modelle werden lokal gespeichert
- du kannst sie im Terminal starten
- du brauchst später keine Cloud

#### 🛠️ Was bedeutet „Open‑Source“?
Open‑Source bedeutet:
- jeder kann den Code sehen,
- kostenlos nutzen,
- und Verbesserungen beitragen.

👉 Wie ein „Rezeptbuch“ für Software – offen für alle.

---

### 🧠 Sprachmodell (LLM)
Ein **Large Language Model (LLM)** ist ein Programm, das Texte verarbeitet und Antworten erzeugt – ähnlich wie ChatGPT, nur kleiner und lokal auf unserem Gerät.

**Warum nutzen wir ein kleines LLM?**
- läuft auf schwacher Hardware (Pi Zero)
- gut zum Lernen & Experimentieren

👉 Vorteile von offenen (freien) Modellen:
- **Privatsphäre:** Daten bleiben lokal
- **Kostenlos nutzbar**
- **Lehrreich:** man kann verstehen, wie KI eingesetzt wird
- **Experimente:** ihr könnt später eigene Varianten ausprobieren

---

## 👩‍🏫 Was ihr außerdem braucht
- etwas Geduld 😊
- Teamarbeit (helft euch gegenseitig!)
- Lust, Neues auszuprobieren

👉 Merksatz: **Fehler gehören dazu – so lernt man am besten.**

---

## 💻 Software auf deinem Computer (Download/Installation)
Dieses Programme brauchst du auf deinem Computer:

- **Raspberry Pi Imager**  
  https://www.raspberrypi.com/software/

- **Raspberry Pi OS (Legacy, 64-bit) Lite**  
  (wird später im Imager ausgewählt)

Optional (je nach Computer):
- SD‑Karten‑Adapter / Kartenleser
- Terminal/PowerShell (ist meistens schon vorhanden)

---
