# 📖 Glossar – wichtige Begriffe rund um KI, LLMs & Raspberry Pi (für Schüler:innen)

Dieses Glossar erklärt zentrale Begriffe aus unserem Workshop – **kurz, verständlich und mit Alltagsbezug**.  
💡 **Tipp:** Wenn Du ein Wort nicht kennst: zuerst hier nachschlagen 😊

---

## 🧠 KI & Grundbegriffe

### KI (Künstliche Intelligenz) *(AI – Artificial Intelligence)*
Ein Sammelbegriff für Programme, die Aufgaben lösen, die „intelligent“ wirken (z. B. Texte schreiben, Bilder erkennen).

### Maschinelles Lernen (ML – Machine Learning)
Ein Teilbereich der KI: Ein Computer „lernt“ aus vielen Beispielen, statt feste Regeln zu bekommen.

### Deep Learning (DL)
Ein Teilbereich von ML: Lernen mit **neuronalen Netzen**, die aus vielen „Schichten“ bestehen.

### Neuronales Netz
Ein Rechenmodell, das grob vom Gehirn inspiriert ist. Es besteht aus vielen „Knoten“, die Informationen weitergeben und gewichten.

### Modell
Ein trainiertes KI-Programm. Beispiel: Ein LLM ist ein „Modell“, das Text erzeugen kann.

### Training
Die Lernphase: Das Modell sieht sehr viele Daten (z. B. Texte) und passt sich an, um Muster zu lernen.

### Inferenz
Die Nutzungsphase: Das Modell ist fertig trainiert und erzeugt jetzt Antworten auf deine Eingabe (Prompt).

### Datensatz (Dataset)
Die Sammlung von Beispielen, mit denen ein Modell trainiert wurde (z. B. Texte, Codes, Bücher, Webseiten).

---

## 💬 LLM & Textverständnis

### LLM (Large Language Model) – „Sprachmodell“
Ein Programm, das Texte verarbeitet und erzeugt – es sagt vereinfacht „wahrscheinliche nächste Wörter“ voraus.

### Chatbot
Eine Benutzeroberfläche, die ein Modell „wie in einem Chat“ nutzbar macht (Frage → Antwort).

### Prompt
Deine Eingabe an das Modell (Frage, Aufgabe, Anweisung).  
Beispiel: „Erkläre Fotosynthese in 3 Sätzen.“

### Prompting
Die „Kunst“, Prompts so zu formulieren, dass gute Ergebnisse herauskommen (klar, konkret, mit Formatvorgaben).

### Kontext
Alles, was das Modell „gerade weiß“, weil es in der aktuellen Unterhaltung oder Eingabe steht.

### Kontextfenster
Wie viel Text das Modell auf einmal berücksichtigen kann (begrenzter Speicher für den Chat-Verlauf).

### Token
Text-Bausteine, in die das Modell Eingaben zerlegt (nicht immer ganze Wörter).  
Beispiel: „Wasserflasche“ kann in mehrere Tokens zerfallen.

### Ausgabe (Output)
Der Text, den das Modell erzeugt (Antwort).

### System / Rolle / Anweisung
Man kann dem Modell eine Rolle geben („Du bist Lehrkraft…“) oder klare Regeln („Antworte in Bulletpoints…“).

---

## 🎯 Qualität, Fehler & Risiken

### Halluzination
Wenn ein Modell Dinge **selbstbewusst erfindet**, obwohl sie falsch sind.  
Wichtig: LLMs können plausibel klingen – trotzdem können Details erfunden sein.

### Bias (Verzerrung)
Wenn Antworten unfair oder einseitig werden, weil Trainingsdaten bestimmte Sichtweisen stärker enthalten.

### Faktencheck
Das Überprüfen von Aussagen mit sicheren Quellen (Schulbuch, seriöse Seiten, mehrere Quellen vergleichen).

### Quelle
Woher eine Information stammt. Gute Antworten sollten nachvollziehbar sein (bei LLMs musst du selbst prüfen!).

### Datenschutz
Schutz persönlicher Daten. Regel im Workshop: **Keine echten Namen, Adressen, Passwörter, privaten Infos** in Prompts.

---

## 🔧 Modell-„Tuning“ (einfach erklärt)

### Parameter
Die „inneren Stellschrauben“ eines Modells. Viele Parameter = oft leistungsfähiger, aber braucht mehr Rechenleistung.

### Fine-Tuning
Nachtraining eines fertigen Modells auf spezielle Aufgaben (z. B. „nur Matheaufgaben“ oder „Schulstil“).

### Quantisierung
Eine Technik, um Modelle kleiner/schneller zu machen (weniger Speicher, oft etwas weniger Qualität).

### Temperatur (Temperature)
Regler für Kreativität:  
- niedrig = eher vorsichtig/gleichförmig  
- hoch = kreativer, aber auch mehr Fehler möglich

### Top-p / Top-k
Weitere Regler, wie „mutig“ das Modell Wörter auswählt. (Für Fortgeschrittene – muss man nicht können.)

---

## 🖥️ Lokal vs. Cloud

### Lokal (On-device)
Das Modell läuft auf deinem eigenen Gerät (z. B. Raspberry Pi). Vorteil: mehr Kontrolle, oft datenschutzfreundlicher.

### Cloud
Das Modell läuft auf Servern im Internet. Vorteil: oft schneller/stärker – aber Daten gehen übers Internet.

### Server
Ein sehr leistungsstarker Computer, der Dienste für viele Nutzer gleichzeitig anbietet (z. B. Chatbots in der Cloud).

---

## 🍓 Raspberry Pi & Technikbegriffe

### Raspberry Pi
Ein kleiner, günstiger Computer (wie ein Mini-PC), der ein Betriebssystem starten kann.

### Raspberry Pi Zero 2 W
Eine sehr kleine Pi-Version. Kann viel, ist aber deutlich schwächer als ein normaler Laptop/PC.

### microSD-Karte
Die „Festplatte“ des Raspberry Pi. Darauf ist das Betriebssystem und alles, was du installierst.

### Betriebssystem (OS)
Grundsoftware, damit Programme laufen (wie Windows/macOS). Beim Pi nutzen wir Raspberry Pi OS.

### Flashen
Das Betriebssystem wird auf die microSD-Karte geschrieben (alles auf der Karte wird dabei gelöscht).

### Lite
Eine schlanke OS-Version ohne grafische Oberfläche (kein Desktop) → schneller auf schwacher Hardware.

### Terminal
Ein Textfenster, in dem man Befehle eingibt (statt zu klicken).

### Befehl (Command)
Eine Text-Anweisung im Terminal, z. B. `sudo apt update`.

### Update / Upgrade
Aktualisierung von Programmen und Sicherheitsupdates.

### CPU
Der „Hauptrechner“ des Computers (Prozessor).

### GPU
Ein Spezialchip für viele parallele Rechnungen (hilfreich für KI, aber im Pi Zero meist nicht dafür geeignet).

### RAM
Arbeitsspeicher: kurzfristiger Speicher, den Programme zum Laufen brauchen. Zu wenig RAM → Programme werden langsam oder stürzen ab.

### Swap
„Ersatz-RAM“ auf der SD-Karte (langsamer als RAM, kann aber helfen, Abstürze zu vermeiden).

---

## 🌐 Netzwerk & Zugriff

### WLAN
Drahtloses Netzwerk, mit dem der Pi ins Internet oder ins Schulnetz kommt.

### SSID
Der Name eines WLANs (z. B. „Schule-WLAN“).

### IP-Adresse
Die „Hausnummer“ eines Geräts im Netzwerk (z. B. `192.168.1.42`).

### Hostname
Der Name eines Geräts im Netzwerk (z.B. `rpi02W-fapi`).

### Router
Das Gerät, das dein WLAN macht und IP-Adressen verteilt.

### SSH (Secure Shell)
Ein sicherer Fernzugriff: Du steuerst den Pi per Terminal vom PC aus, ohne Monitor/Tastatur am Pi.

### Headless
Der Pi läuft „kopflos“ – ohne Bildschirm, Maus, Tastatur. Steuerung dann z. B. per SSH.

---

## 🦙 Ollama & Workshop-spezifisch

### Ollama
Ein Programm, mit dem man LLMs lokal herunterladen und starten kann.

### Modell „pullen“ / herunterladen
Beim ersten Start lädt Ollama das Modell und speichert es lokal – danach geht es auch ohne Internet (je nach Setup).

---
