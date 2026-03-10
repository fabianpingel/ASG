# 🚀 Build Your Own AI 🧠
## 💬 Dein eigenes Sprachmodell *Tiny‑GPT* auf einem Raspberry Pi Zero

Willkommen zu **Build Your Own AI**!  
In diesem Projekt lernst du Schritt für Schritt, wie du auf einem winzigen, günstigen Computer – dem **Raspberry Pi Zero 2 W** – dein **eigenes Sprachmodell (LLM)** installierst und betreibst.

👉 **Du brauchst keine Programmier‑ oder IT‑Vorkenntnisse.**  
Alles wird verständlich erklärt – versprochen 😊

---

## 📌 Worum geht es hier?

Große Sprachmodelle wie ChatGPT laufen normalerweise auf riesigen Servern.  
In diesem Projekt zeigen wir dir:

- wie **KI auch auf sehr kleiner Hardware** funktionieren kann
- was ein **Sprachmodell (LLM)** eigentlich ist
- wie man ein vereinfachtes Modell (*Tiny‑GPT*) selbst startet
- warum das Ganze trotzdem beeindruckend ist 💡

Das Projekt basiert auf diesem englischsprachigen Tutorial:  
🔗 https://github.com/Gilzone/Installing-a-LLM-on-Raspberry-Pi-Zero-2-W  

➡️ Diese Anleitung ist **vereinfacht, übersetzt und didaktisch aufbereitet**.

---

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

## 🧰 Was du brauchst

- 🧠 Neugier
- 💻 Einen Computer (Windows, Linux oder macOS)
- 🍓 Einen **Raspberry Pi Zero 2 W**  
  🔗 https://www.raspberrypi.com/products/raspberry-pi-zero-2-w/
- 💾 Eine micro‑SD‑Karte (mind. 16 GB)
- 🌐 Internetverbindung

---

## 📚 Inhaltsverzeichnis

1. [🔍 Grundlagen: Was ist KI & ein Sprachmodell?](docs/01_grundlagen.md)
2. [🍓 Raspberry Pi vorbereiten](docs/02_raspberry_pi_setup.md)
3. [⚙️ Installation von Tiny‑GPT](docs/03_installation_tiny_gpt.md)
4. [▶️ Tiny‑GPT starten und testen](docs/04_starten_und_testen.md)
5. [🧠 Wie „denkt“ Tiny‑GPT? (einfach erklärt)](docs/05_wie_funktioniert_es.md)
6. [⚡ Grenzen & Realität: Was geht – und was nicht?](docs/06_grenzen.md)
7. [🎓 Ideen für Schule & Unterricht](docs/07_unterrichtsideen.md)
8. [❓ FAQ & typische Probleme](docs/08_faq.md)

---

## 🎯 Lernziele

Nach diesem Projekt kannst du:

- erklären, **was KI und LLMs sind**
- einen Raspberry Pi **eigenständig einrichten**
- ein sehr kleines Sprachmodell **selbst starten**
- den Unterschied zwischen **echter Intelligenz und Statistik** verstehen
- kritisch einschätzen, **was KI kann – und was nicht**

---

## 👩‍🏫 Für wen ist dieses Projekt?

✅ Schülerinnen & Schüler (ab ca. Klasse 9)  
✅ Lehrkräfte  
✅ Maker & Bastler  
✅ Alle, die wissen wollen, **wie KI wirklich funktioniert**

---

## 📂 Projektstruktur

```text
.
├── README.md
└── docs/
    ├── 01_grundlagen.md
    ├── 02_raspberry_pi_setup.md
    ├── 03_installation_tiny_gpt.md
    ├── 04_starten_und_testen.md
    ├── 05_wie_funktioniert_es.md
    ├── 06_grenzen.md
    ├── 07_unterrichtsideen.md
    └── 08_faq.md