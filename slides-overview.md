# Folienübersicht — Build Your Own AI

> **Hinweis:** Diese Datei ist ein **Referenz- und Korrekturdokument** — keine Quelldatei.  
> Änderungswünsche hier eintragen → Claude überträgt sie ins `slides.html`.  
> Die HTML-Datei ist die einzige autoritative Quelle; diese Datei kann veralten.

---

## Struktur

| Block | Folien | Inhalt |
|---|---|---|
| Block 1 | 01–19 | Theorie (KI-Basics) + Hardware + Setup |
| Block 2 | 20–33 | Ollama, Chatten, Prompting, Reflexion |
| Reserve | 34–42 | Vertiefung, Glossar, Troubleshooting |

**Folien-Typen:** `t-title` Titel · `t-sec` Abschnittseröffner · `t-con` Inhalt · `t-img` Bild+Text · `t-ex` Aufgabe · `t-cmd` Befehlsfolie

---

## Block 1 — Theorie + Hardware + Setup

---

### Folie 01 — Build Your Own AI
**Typ:** t-title · **Abschnitt:** Willkommen

- Workshop · 9./10. Klasse · ASG Plettenberg
- Dein eigenes Sprachmodell auf dem Raspberry Pi Zero 2W
- Chips: KI verstehen · Raspberry Pi · Eigenes Chatbot · Lokal & privat
- Fabian Pingel · PINGEL AI Solutions · Linamar Plettenberg GmbH

---

### Folie 02 — Was euch heute erwartet
**Typ:** t-con · **Abschnitt:** Überblick

**Block 1 — Heute (Theorie + Setup, ~90 Min)**
- Was ist Künstliche Intelligenz?
- Wie funktioniert ein Sprachmodell?
- Euer Raspberry Pi: Hardware kennenlernen
- Betriebssystem aufsetzen & verbinden

**Block 2 — Nächste Woche (KI in Aktion, ~90 Min)**
- Ollama installieren (ein Befehl!)
- Erstes Gespräch mit dem Modell
- Prompting: die Kunst der richtigen Frage
- Reflexion & Ausblick

**Lernziele**
- Erklären, was ein Sprachmodell ist
- Selbst einen Pi einrichten & bedienen
- Ein KI-Modell lokal starten
- Stärken und Grenzen von KI kennen

---

### Folie 03 — Was ist Künstliche Intelligenz?
**Typ:** t-con · **Abschnitt:** Block 1 · KI-Basics

**Was KI nicht ist**
- Kein denkender Roboter aus dem Film
- Kein allwissendes Gehirn
- Kein Bewusstsein, keine Gefühle
- Keine echte Intelligenz wie beim Menschen

**Was KI ist**
- Software, die aus Daten lernt
- Erkennt Muster in riesigen Datenmengen
- Löst Aufgaben, die früher nur Menschen konnten
- Nur so gut wie ihre Trainingsdaten

**KI begegnet euch täglich** (Icons: YouTube, Netflix, Siri, Spotify, Gmail, Google Translate)
- Empfehlungen: YouTube, Netflix, Spotify
- Sprachassistenten: Siri & Google
- Spam-Filter im E-Mail-Postfach
- Übersetzer: Google Translate

*Infobox: LLMs sind das Thema des Workshops (z.B. ChatGPT)*

---

### Folie 04 — Von Regeln zu Mustern
**Typ:** t-con · **Abschnitt:** Block 1 · KI-Basics

**Klassische Programmierung** (links, navy)
- Regeln + Eingabe → Ausgabe
- Bsp. 1: „Wenn Temperatur > 37,5°C → zeige Warnung"
- Bsp. 2: „Wenn E-Mail enthält ‚JETZT KLICKEN' → Spam"
- Problem: Für Sprache zu viele Ausnahmen

**Machine Learning** (rechts, orange)
- Das Modell lernt die Regeln selbst aus Beispielen
- Daten + Ausgaben → Modell
- Beispiel: Millionen von Texten lesen → Sprache verstehen
- Einordnung (Taxonomie-Diagramm): KI → Machine Learning → Deep Learning → Generative KI → LLM (ChatGPT · Llama · SmolLM2)

*Tipp: LLMs sind eine Unterart von Generativer KI → Deep Learning → Machine Learning*

---

### Folie 05 — Was ist ein Sprachmodell (LLM)?
**Typ:** t-con · **Abschnitt:** Block 1 · KI-Basics

**Die Grundidee**
- LLM hat Milliarden von Texten gelesen
- Lernt: Welches Wort kommt nach welchem am häufigsten?
- Beispiel: „Die Sonne geht im **Westen** unter."
- Beispiel: „Das Städtische Albert-Schweitzer-Gymnasium in **Plettenberg**."

*Wichtig: Das Modell versteht nicht wie ein Mensch — es erkennt Muster in Wahrscheinlichkeiten!*

**Wie groß sind diese Modelle?**
- ~1 000 Mrd. Parameter bei GPT-4
- 135 Mio. Parameter bei unserem Pi-Modell
- Parameter = die „Schalter" im Modell
- Vergleich: Dein Gehirn hat ~86 Mrd. Neuronen — GPT-4 hat ~10× mehr; SmolLM2 entspricht dem Gehirn einer Maus (~70 Mio. Neuronen)

**So läuft eine Antwort ab**
1. Du schreibst eine Frage (Prompt)
2. Text → Tokens
3. Modell berechnet Wahrscheinlichkeiten
4. Wort für Wort entsteht die Antwort

---

### Folie 06 — Wie „denkt" ein LLM? — Tokens & Wahrscheinlichkeiten
**Typ:** t-con · **Abschnitt:** Block 1 · KI-Basics

**Schritt 1: Text → Tokens**
- Ein Token ≈ ¾ Wort
- Beispiel: „Hallo, wie geht es dir?" → Tokens werden farbig angezeigt

**Schritt 2: Wahrscheinlichkeiten**
- Für jedes Token berechnet das Modell: Was kommt als nächstes?
- Beispiel-Tabelle mit Wahrscheinlichkeiten für nächste Wörter

*Warum erscheint Text Wort für Wort? Das Modell berechnet jedes Token einzeln!*

---

### Folie 07 — Übung: Satz vervollständigen
**Typ:** t-ex · **Abschnitt:** Block 1 · Übung

**Aufgabe (2–3 Min):** Vervollständige jeden Satz spontan mit dem ersten Wort, das dir einfällt:
- „Im Winter ist es draußen oft sehr ___"
- „Ohne Fleiß kein ___"
- „Das Smartphone liegt auf dem ___"
- „In Deutschland ist die Hauptstadt ___"

**Diskussion:** Habt ihr alle dasselbe geschrieben? Welche kamen schnell, welche nicht?

*Kernergebnis: Genau so „denkt" ein Sprachmodell — durch Wahrscheinlichkeiten, nicht durch Verstehen.*

---

### Folie 08 — Cloud vs. Lokal — Wo läuft das Modell?
**Typ:** t-con · **Abschnitt:** Block 1 · KI-Basics

**Cloud-KI (z.B. ChatGPT)**
- Läuft auf riesigen Rechenzentren weltweit
- Braucht immer Internetverbindung
- Eure Anfragen werden an Server gesendet
- Anbieter kann Daten speichern/auswerten

**Lokal (unser Projekt)**
- Läuft direkt auf eurem Raspberry Pi
- Nach dem Download kein Internet nötig
- Eure Fragen verlassen das Gerät nicht
- Volle Kontrolle über Modell & Daten

*Datenschutz-Beispiel: Würdet ihr eurem Arzt über ChatGPT schreiben? Lokal schon!*

---

### Folie 09 — Was KI kann — und was nicht
**Typ:** t-con · **Abschnitt:** Block 1 · KI-Basics

**Stärken**
- Texte schreiben, zusammenfassen, übersetzen
- Code erklären & einfache Fehler finden
- Brainstormen & kreative Ideen
- Fragen beantworten (über bekannte Themen)
- Stil anpassen (formell/informell/kindgerecht)

**Schwächen**
- Aktuelle Infos: Wissen endet beim Training
- Rechnen: Zahlen werden wie Wörter behandelt
- Fakten erfinden: Gibt plausible, aber falsche Antworten
- Quellen: Erfindet Bücher, Links, Autoren

**Halluzinationen** (orange Kachel)
- Das Modell erfindet Dinge, die falsch aber überzeugend klingen
- Beispiel: Erfindet Zitate berühmter Personen
- Regel: Wichtige Fakten immer gegenchecken!

---

### Folie 10 — Unsere Hardware
**Typ:** t-sec · **Abschnitt:** Block 1 · Hardware

*(Abschnittseröffner — Überleitung zur Hardware-Einheit)*
- Chips: Was ist ein Pi? · Technische Daten · Vergleich mit normalen PCs · Zusammenbau

---

### Folie 11 — Der Raspberry Pi Zero 2W
**Typ:** t-con · **Abschnitt:** Block 1 · Hardware

**Technische Daten** (navy Tabelle)

| Eigenschaft | Wert |
|---|---|
| CPU | 4-Kern ARM Cortex-A53, 1 GHz |
| RAM | 512 MB LPDDR2 |
| Speicher | microSD-Karte (wir: 32 GB) |
| WLAN | 802.11 b/g/n (2,4 GHz) |
| Bluetooth | 4.2 BLE |
| Anschlüsse | Mini-HDMI, 2× Micro-USB, CSI |
| GPIO | 40-polige Stiftleiste |
| Strom | 5V / 2,5A via Micro-USB |
| Gewicht | 10 g |
| **Größe** | **65 × 30 mm (~halbe Kreditkarte)** |

*Info: Ein Büro-PC der 1990er hatte weniger Rechenleistung — und kostete mehrere Tausend Euro.*

---

### Folie 12 — Kleiner Computer, große Wirkung
**Typ:** t-con · **Abschnitt:** Block 1 · Hardware

**Vergleichstabelle** (mit Fotos in Spaltenköpfen)

| Eigenschaft | 🖥️ Desktop-PC 1996 | 🍓 Pi Zero 2W (2021) | 💻 Euer Laptop heute |
|---|---|---|---|
| Preis | ~2 000 € | **~15 €** | ~500–1 500 € |
| CPU-Kerne | 1 Kern | 4 Kerne | 4–16 Kerne |
| RAM | 32 MB | 512 MB | 8–32 GB |
| Stromverbrauch | ~200 Watt | **~2 Watt** | 15–65 Watt |
| Betriebssystem | Windows 95 | Linux | Windows / macOS |
| KI-Modell lauffähig? | ❌ Nein | **✅ Ja (klein)** | ✅ Ja (groß) |

*Tipp: Warum ist der Pi so billig? Kein Bildschirm, keine Tastatur, keine aufwändige Kühlung.*

---

### Folie 13 — Checkliste & Gehäuse zusammenbauen
**Typ:** t-ex · **Abschnitt:** Block 1 · Hardware

**Paketinhalt prüfen**
- Raspberry Pi Zero 2W
- microSD-Karte (32 GB, bereits mit OS geflasht)
- Micro-USB-Netzteil (5V / 2,5A)
- Kühlkörper (kleines schwarzes Pad)
- 3D-gedrucktes Gehäuse (Ober- & Unterteil)

**Zusammenbau — Schritt für Schritt**
1. Pi in das Gehäuse-Unterteil einlegen (Ports zeigen nach außen)
2. Schutzfolie vom Kühlkörper abziehen
3. Kühlkörper mittig auf den silbernen Chip des Pi kleben
4. Gehäuse-Oberteil aufstecken — bis es einrastet
5. microSD-Karte in den Schlitz an der Seite stecken

*Netzteil: Unbedingt das richtige (5V/2,5A) verwenden!*
*Kühlkörper ist wichtig: Ohne ihn wird der Pi heiß und langsamer.*

---

### Folie 14 — Setup in 4 Schritten
**Typ:** t-sec · **Abschnitt:** Block 1 · Setup

*(Abschnittseröffner — Überleitung zum Software-Setup)*
- Chips: OS flashen · SSH verbinden · Updates installieren · Ollama installieren

---

### Folie 15 — Betriebssystem flashen (1/2) — Raspberry Pi Imager
**Typ:** t-img · **Abschnitt:** Block 1 · Setup

*(Rechte Seite: Bildslider mit 2 Screenshots — wechselt alle 10 s)*

**Ablauf**
1. microSD in euren Computer stecken
2. Raspberry Pi Imager starten
3. Modell wählen: `Raspberry Pi Zero 2 W`
4. Betriebssystem: `Raspberry Pi OS (Legacy, 64-bit) Lite`
5. Speicher: eure SD-Karte auswählen

*Achtung: Beim Flashen werden alle Daten auf der SD-Karte gelöscht!*

---

### Folie 16 — Betriebssystem flashen (2/2) — Einstellungen
**Typ:** t-img · **Abschnitt:** Block 1 · Setup

*(Rechte Seite: Bildslider mit 3 Screenshots — wechselt alle 10 s)*

**Diese Einstellungen setzen**

| Einstellung | Wert |
|---|---|
| Hostname | `rpi02W-[euerName]` |
| Benutzername | `[euer Vorname]` |
| Passwort | `[euer Nachname]` |
| WLAN SSID | `KI-Workshop` |
| WLAN-Passwort | `Workshop!2026` |
| **SSH** | **✅ Aktivieren (Passwort)** |

*Tipp: Der Hostname ist wichtig — damit findet ihr euren Pi unter 10 gleichzeitig laufenden Pis!*

---

### Folie 17 — SSH — Fernzugriff ohne Bildschirm
**Typ:** t-con · **Abschnitt:** Block 1 · Setup

**Was bedeutet „Headless"?**
- Kein Bildschirm, keine Tastatur am Pi
- Bedienung komplett über das Netzwerk

**Was ist SSH?**
- Secure Shell — verschlüsselte Verbindung zum Pi-Terminal
- Wie eine sichere Telefonleitung: alles was ihr tippt, wird dort ausgeführt

**Pi im Netzwerk finden**
```bash
# Option A: Hostname
ping rpi02W-<kürzel>.local

# Option B: alle Geräte anzeigen
arp -a
```

**Verbinden**
```bash
ssh <vorname>@rpi02W-<kürzel>.local
```

---

### Folie 18 — System aktualisieren (Updates)
**Typ:** t-cmd · **Abschnitt:** Block 1 · Setup

**Warum Updates?**
- Schließt Sicherheitslücken
- Stabiler bei Ollama-Installation
- Weniger Fehler beim Einrichten

```bash
sudo apt update
sudo apt full-upgrade -y
sudo apt autoremove -y
sudo reboot
```

*Nach dem Reboot ~2 Min warten, dann neu verbinden.*

---

### Folie 19 — Block 1 geschafft!
**Typ:** t-con · **Abschnitt:** Block 1 · Zusammenfassung

**KI-Theorie**
- Was Künstliche Intelligenz ist (und nicht ist)
- Wie ein Sprachmodell aus Mustern lernt
- Was Tokens sind und wie Wahrscheinlichkeiten funktionieren
- Unterschied Cloud ↔ Lokal
- Was Halluzinationen sind

**Praxis**
- Raspberry Pi Zero 2W kennen und zusammengebaut
- Betriebssystem geflasht
- Per SSH verbunden
- System aktualisiert

*„Block 2 startet in einer Woche!" — Dann: Ollama installieren & erstes KI-Gespräch.*

---

## Block 2 — KI in Aktion

---

### Folie 20 — Euer eigenes Sprachmodell
**Typ:** t-sec · **Abschnitt:** Block 2 · KI in Aktion

*(Abschnittseröffner Block 2)*
- Chips: Ollama installieren · Modell herunterladen · Chatten · Prompting lernen

---

### Folie 21 — Ollama installieren — ein Befehl reicht
**Typ:** t-cmd · **Abschnitt:** Block 2 · KI in Aktion

**Was ist Ollama?**
- Open-Source-Tool zum lokalen Betrieb von KI-Modellen
- Lädt Modelle herunter und verwaltet sie
- Startet einen Server im Hintergrund
- Komplett kostenlos

```bash
curl -fsSL https://ollama.com/install.sh | sh

# Prüfen:
ollama --version
ollama list
```

---

### Folie 22 — Erstes Modell herunterladen & starten
**Typ:** t-cmd · **Abschnitt:** Block 2 · KI in Aktion

**Unser Modell: SmolLM2**
- 135 Mio. Parameter — optimiert für kleine Hardware
- `q4_K_S` = 4-Bit-Quantisierung → nur 102 MB
- Entwickelt von Hugging Face

```bash
ollama run smollm2:135m-instruct-q4_K_S
```

*Beim ersten Mal: Download (~102 MB). Danach direkt startklar.*

---

### Folie 23 — Was passiert gerade im Pi?
**Typ:** t-img · **Abschnitt:** Block 2 · KI in Aktion

**CPU überwachen**
```bash
top
```

**Was ihr beobachten könnt**
- Text erscheint Wort für Wort (Token für Token)
- CPU-Last springt auf fast 300% (4 Kerne × ~75%)
- Erste Antwort dauert manchmal länger (Modell wird geladen)
- Kleine Modelle = schneller, aber weniger „klug"

---

### Folie 24 — Wenn der Pi „schwitzt" — Temperatur & Throttling
**Typ:** t-con · **Abschnitt:** Block 2 · KI in Aktion

```bash
vcgencmd measure_temp
```

| Bereich | Bedeutung |
|---|---|
| < 50°C | Normal — alles gut |
| 50–70°C | Warm — normal beim KI-Betrieb |
| > 70°C | Heiß — Kühlkörper wichtig! |
| > 80°C | Kritisch — Throttling aktiv |

**Throttling:** Pi reduziert automatisch Taktrate → Modell wird langsamer

---

### Folie 25 — Was ist Prompting?
**Typ:** t-con · **Abschnitt:** Block 2 · Prompting

**Definition:** Die Kunst, einer KI die richtige Frage zu stellen

**5 Regeln für gute Prompts**
1. Konkret sein: Was genau wollt ihr wissen?
2. Format vorgeben: „Antworte in 3 Sätzen" / „Erstelle eine Liste"
3. Kontext geben: „Du bist ein Lehrer und erklärst…"
4. Auf Englisch schreiben (bei SmolLM2)
5. Schlüsselwörter korrekt schreiben

**Schlecht vs. Gut**
- ❌ „Erkläre KI"
- ✅ „Explain artificial intelligence in 3 simple sentences for a 15-year-old."

---

### Folie 26 — Übung A: Gleiche Frage — zwei Sprachen
**Typ:** t-ex · **Abschnitt:** Block 2 · Übungen

**Aufgabe:** Stelle dieselbe Frage auf Deutsch und Englisch:
- Deutsch: „Erkläre mir, wie das Internet funktioniert."
- Englisch: „Explain how the internet works."

**Beobachte:** Antwortzeit · Verständlichkeit · Vollständigkeit · Sprachfehler · Hält Sprache ein?

*Erkenntnis: Englisch funktioniert bei kleinen Modellen deutlich besser.*

---

### Folie 27 — Übung B: Klarer Prompt = bessere Antwort
**Typ:** t-ex · **Abschnitt:** Block 2 · Übungen

**Vager Prompt:** „Tell me about space."

**Klarer Prompt:** „You are a science teacher. Explain in exactly 2 sentences what a black hole is, suitable for 15-year-olds."

**Beobachte:** Länge · Hält sich an „2 Sätze"? · Folgt der Rollen-Anweisung? · Natürlichkeit?

*Erkenntnis: Struktur und Rollen verbessern die Antwortqualität erheblich.*

---

### Folie 28 — Übung C: Wenn KI erfindet — und trotzdem sicher klingt
**Typ:** t-ex · **Abschnitt:** Block 2 · Übungen

**Halluzinationen erkunden:**
- „Who was the first person to walk on Mars?"
- „What is the capital of the country Bloravia?"
- „Name a famous book by [erfundener Autor]."

**Namensgedächtnis-Test:**
- Schreibe: „My name is `<euer Name>`."
- Führe ein paar Sätze Gespräch
- Frage dann: „What is my name?"

*Kernerkenntnis: Das Modell kann täuschend echt klingen — auch wenn es erfindet. Immer prüfen!*

---

### Folie 29 — Was haben wir heute gelernt?
**Typ:** t-con · **Abschnitt:** Block 2 · Reflexion

**KI verstehen**
- LLMs lernen Muster — kein echtes Verstehen
- Tokens & Wahrscheinlichkeiten
- Grenzen: Halluzinationen, kein aktuelles Wissen
- Cloud vs. lokal

**Technik gemacht**
- Linux-Terminal bedient
- Raspberry Pi eingerichtet (OS, SSH, Updates)
- Ollama installiert & Modell geladen
- KI lokal auf Mini-Computer gestartet

**Prompting gelernt**
- Klare Prompts = bessere Antworten
- Englisch vs. Deutsch
- Rollen & Format helfen
- Halluzinationen selbst erlebt & erkannt

---

### Folie 30 — Was kann der Pi noch? — Projekte & Ideen
**Typ:** t-con · **Abschnitt:** Block 2 · Ausblick

**Pi-hole** — Werbeblocker für das ganze Netzwerk (alle Geräte gleichzeitig)

**Heimserver**
- Nextcloud (eigene Cloud)
- Home Assistant (Hausautomation)
- Wetterstation
- Netzwerk-Überwachung

**Weiterlernen**
- Linux vertiefen (bash, cron, systemd)
- Python programmieren
- Webseiten hosten
- Größere KI-Modelle auf stärkerem Pi

---

### Folie 31 — KI & Ihr — Was bedeutet das für eure Zukunft?
**Typ:** t-con · **Abschnitt:** Block 2 · Ausblick

**KI verändert Berufe**
- Routineaufgaben werden automatisiert
- Neue Berufe entstehen: Prompt Engineer, KI-Trainer, KI-Ethiker
- Kreativität & kritisches Denken bleiben wichtig

**Was bleibt wichtig**
- Kritisch denken & Quellen prüfen
- Datenschutz verstehen
- Verantwortungsvoll mit Technologie umgehen

**Eure neue Superkraft**
- KI ist Mathematik & Daten — keine Magie
- Auch ein Mini-Computer kann KI
- Die richtige Frage stellen ist eine Fähigkeit
- Ihr könnt Technologie selbst gestalten

---

### Folie 32 — Fazit
**Typ:** t-sec · **Abschnitt:** Fazit

*(Abschluss-Sektion — Überleitung zur Danke-Folie)*

---

### Folie 33 — Danke & viel Erfolg!
**Typ:** t-title · **Abschnitt:** Ende des Workshops

- Kontakt: [info@fabian-pingel.de](mailto:info@fabian-pingel.de)
- Website: [fabian-pingel.de](https://www.fabian-pingel.de)
- GitHub: [github.com/fabianpingel/ASG](https://github.com/fabianpingel/ASG)
- Workshop ermöglicht durch **Linamar Plettenberg GmbH** · Fabian Pingel · PINGEL AI Solutions

---

## Reserve — Vertiefung & Glossar

---

### Folie 34 — Vertiefung & Glossar
**Typ:** t-sec · **Abschnitt:** Reserve

*(Abschnittseröffner Reserve)*
- Chips: Wie lernt KI? · Quantisierung · Pi-hole · Glossar

---

### Folie 35 — Wie lernt ein KI-Modell? — Training vereinfacht
**Typ:** t-con · **Abschnitt:** Reserve · Vertiefung

**Phase 1: Pre-Training**
- Modell liest Milliarden Texte
- Lernt: Welche Wörter folgen aufeinander?
- Dauert Wochen auf tausenden GPUs

**Phase 2: Fine-Tuning**
- Auf spezifische Aufgaben trainiert (z.B. Anweisungen befolgen)
- Menschliches Feedback fließt ein (RLHF)

**Was sind Parameter?**
- Zahlen, die das Modell beim Training anpasst
- Je mehr Parameter → mehr „Gedächtnis" für Muster
- Werden einmal trainiert, dann eingefroren

---

### Folie 36 — Quantisierung — Warum läuft das Modell auf dem Pi?
**Typ:** t-con · **Abschnitt:** Reserve · Vertiefung

**Das Problem**
- SmolLM2 (135 Mio. Parameter) × 4 Byte = **540 MB** — zu groß für 512 MB RAM!

**Die Lösung: Quantisierung** (orange Kachel)
- Zahlen werden weniger genau gespeichert (4-Bit statt 32-Bit)
- Beispiel Kreisfläche (r = 5 cm):
  - 32-Bit: π = 3,14159265… → A = **78,5398 cm²**
  - 4-Bit:  π ≈ 3,14        → A = **78,5000 cm²**
  - Fehler: < 0,05% — wie im Matheunterricht!
- `q4_K_S` = 4-Bit-Quantisierung → nur ~**102 MB**

**Analogie: Bildkomprimierung**
- Original PNG: 10 MB, perfekte Qualität
- JPEG komprimiert: 500 KB, kaum sichtbarer Unterschied

**Modelle für den Pi (< 500 MB)**
| Modell | Größe |
|---|---|
| `smollm2:135m-instruct-q4_K_S` | 102 MB |
| `gemma3:270m` | 292 MB |
| `granite4:350m-h` | 366 MB |

---

### Folie 37 — Pi-hole — Werbung im ganzen Netzwerk blockieren
**Typ:** t-con · **Abschnitt:** Reserve · Vertiefung

**Wie Internet normalerweise funktioniert**
- Jeder Seitenaufruf beginnt mit einem DNS-Request
- Auch Werbung kommt von eigenen Servern mit DNS-Anfragen

**Was macht Pi-hole?**
- DNS-Server auf dem Pi — beantwortet alle Netzwerk-DNS-Anfragen
- Bekannte Werbe-Adressen → „Existiert nicht" → Werbung wird nie geladen

**Vorteile**
- Blockiert auf **allen Geräten** gleichzeitig (Handy, TV, Laptop)
- Keine App nötig
- Seiten laden schneller
- Schützt vor Tracking-Domains
- Einfach auf dem Pi installierbar

---

### Folie 38 — Glossar I — KI & Sprachmodelle
**Typ:** t-con · **Abschnitt:** Reserve · Glossar

| Begriff | Erklärung |
|---|---|
| KI / AI | Software, die menschliche Denkaufgaben löst |
| LLM | Large Language Model — großes Sprachmodell |
| Modell | Das trainierte neuronale Netz |
| Parameter | „Schalter" im Modell, beim Training eingestellt |
| Token | Kleinste Texteinheit, die das Modell verarbeitet (≈ ¾ Wort) |
| Prompt | Die Eingabe/Frage an das Modell |
| Halluzination | Wenn das Modell erfundene, falsche Infos liefert |
| Trainingsdaten | Texte, auf denen das Modell trainiert wurde |
| Fine-Tuning | Nachtraining auf spezifische Aufgaben |
| Quantisierung | Komprimierung durch weniger genaue Zahlen |

---

### Folie 39 — Glossar II — Hardware & Netzwerk
**Typ:** t-con · **Abschnitt:** Reserve · Glossar

| Begriff | Erklärung |
|---|---|
| Raspberry Pi | Einplatinencomputer — vollständiger Linux-PC |
| GPIO | General Purpose Input/Output — Pins für Elektronikprojekte |
| microSD | Speicherkarte als „Festplatte" des Pi |
| SSH | Secure Shell — verschlüsselter Fernzugriff |
| Headless | Computer ohne angeschlossenen Bildschirm |
| IP-Adresse | Eindeutige Adresse eines Geräts im Netzwerk |
| Hostname | Name eines Geräts im Netzwerk (z.B. `rpi02W-fapi.local`) |
| DNS | Domain Name System — Übersetzt Hostnamen in IP-Adressen |
| Throttling | Automatische Leistungsreduzierung bei Überhitzung |
| WLAN | Drahtlose Netzwerkverbindung (Wi-Fi) |

---

### Folie 40 — Glossar III — Befehle & Tools
**Typ:** t-con · **Abschnitt:** Reserve · Glossar

| Befehl | Bedeutung |
|---|---|
| `apt update` | Paketliste aktualisieren (noch nichts installieren) |
| `apt full-upgrade -y` | Alle Updates installieren |
| `sudo` | Befehl als Administrator ausführen |
| `ssh <user>@<host>` | SSH-Verbindung herstellen |
| `ping <hostname>` | Erreichbarkeit prüfen (Bsp: `ping rpi02W-fapi.local`) |
| `Ollama` | Tool zum lokalen Betrieb von KI-Modellen |
| `ollama run <modell>` | Modell starten & interaktiv chatten |
| `ollama list` | Installierte Modelle anzeigen |
| `ollama pull <modell>` | Modell herunterladen ohne Start |
| `top` | CPU-Auslastung & Prozesse in Echtzeit |
| `vcgencmd measure_temp` | Aktuelle Pi-Temperatur anzeigen |
| `sudo reboot / poweroff` | Neustart / sicheres Herunterfahren |

---

### Folie 41 — Troubleshooting — Häufige Probleme & Lösungen
**Typ:** t-con · **Abschnitt:** Reserve · Troubleshooting

**SSH: „Connection timed out"**
- Pi noch nicht fertig gebootet? → 3–4 Min warten
- WLAN-Daten beim Flashen falsch? → Neu flashen
- Hostname falsch? → `arp -a` für IP-Adresse nutzen

**SSH: „Permission denied"**
- Benutzername oder Passwort falsch
- Beim Tippen des Passworts keine Zeichen sichtbar — das ist normal!
- Groß-/Kleinschreibung beachten

**`ollama: command not found`**
- SSH-Session neu starten: `exit`, dann neu verbinden
- Ollama-Dienst starten: `sudo systemctl start ollama`

**Modell-Download hängt / bricht ab**
- WLAN-Verbindung prüfen: `ping -c 3 8.8.8.8`
- Einfach `ollama run …` nochmal — setzt automatisch fort
- Speicher prüfen: `df -h` (mind. 500 MB frei)

**Modell extrem langsam**
- Temperatur prüfen: `vcgencmd measure_temp`
- Über 80°C? → Throttling! Pause einlegen
- Kühlkörper richtig aufgeklebt?

**Pi sicher ausschalten**
```bash
sudo poweroff
```
*Nie einfach den Strom trennen — Daten auf der SD-Karte können beschädigt werden!*

---

### Folie 42 — Weitere Modelle ausprobieren
**Typ:** t-con · **Abschnitt:** Reserve · Vertiefung

*(Übersicht alternativer Modelle für den Raspberry Pi)*

| Modell | Größe | Besonderheit |
|---|---|---|
| `smollm2:135m-instruct-q4_K_S` | 102 MB | Unser Standard-Modell |
| `gemma3:270m` | 292 MB | Von Google, etwas klüger |
| `granite4:350m-h` | 366 MB | Von IBM, Hybrid-Modell |

---

*Letzte Aktualisierung: Mai 2026*
