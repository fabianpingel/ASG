# 🚀 Build Your Own AI 🧠
## 💬 Dein eigenes Sprachmodell auf einem Raspberry Pi Zero 2W

Willkommen zu **Build Your Own AI**!  
In diesem Projekt lernst du Schritt für Schritt, wie du auf einem winzigen, günstigen Computer – dem **Raspberry Pi Zero 2 W** – dein **eigenes kleines Sprachmodell (SmolLM)** installierst und betreibst.
Und zwar **lokal**, d.h. ohne Cloud und mit voller Kontrolle über Deine Daten!

👉 **Du brauchst keine Programmier‑ oder IT‑Vorkenntnisse.** Alles wird verständlich erklärt – versprochen 😊

👉 Falls Du mal über ein fremdes Wort oder einen Begriff stolperst, den Du nicht kennst, dann erklärt Dir dieses [**Glossar**](docs/99_glossar.md) alle wichtige Begriffe rund um KI, LLMs & Raspberry Pi. 


***


## 📌 Worum geht es?

Große Sprachmodelle wie *ChatGPT* laufen normalerweise auf **riesigen** Servern.  
In diesem Projekt zeigen wir dir:

- was ein **Sprachmodell (LLM)** eigentlich ist 
- wie KI auch **auf sehr kleiner Hardware** funktionieren kann
- wie man einen Raspberry Pi **eigenständig** einrichtet
- wie man ein kleines Sprachmodell (*SmolLM*) lokal startet
- den Unterschied zwischen **echter Intelligenz und Statistik**
- **was KI kann – und was nicht**
- und warum das Ganze trotzdem beeindruckend ist 💡

Das Projekt basiert auf diesem englischsprachigen Tutorial:  
🔗 https://github.com/Gilzone/Installing-a-LLM-on-Raspberry-Pi-Zero-2-W  

➡️ Diese Anleitung ist **vereinfacht, übersetzt und didaktisch aufbereitet**.


***


## 💬 Was ist ein Sprachmodell

Ein **Sprachmodell** ist ein Computerprogramm, das aus sehr vielen Textbeispielen gelernt hat, wie Sprache typischerweise aufgebaut ist. 

Wenn du ihm einen Textanfang oder eine Frage gibst, berechnet es, **welche Wörter als Nächstes am wahrscheinlichsten passen**, und setzt so Schritt für Schritt eine Antwort zusammen. 

Der englische Begriff ist **LLM** und bedeutet **L**arge **L**anguage **M**odel („großes Sprachmodell“): 
Das ist ein besonders leistungsfähiges Sprachmodell, das mit *sehr vielen Daten* trainiert wurde und deshalb Texte oft erstaunlich flüssig formulieren, zusammenfassen oder erklären kann – trotzdem kann es sich auch irren und sollte bei wichtigen Infos immer überprüft werden!

***


## 📍 Was bedeutet „lokal“?

👉 **Lokal** heißt:
- Auf deinem eigenen Gerät (volle Kontrolle!)
- Ohne Internet (niemald liest mit!)
- Daten bleiben bei dir (Datenschutz!)

🌍 **Online** (Gegenteil): Normalerweise werden LLMs wie z.B. [Chat-GPT](https://chatgpt.com/)  oder [Gemini](https://gemini.google.com/?is_sa=1&is_sa=1&android-min-version=301356232&ios-min-version=322.0&campaign_id=bkws&utm_source=sem&utm_medium=paid-media&utm_campaign=bkws&pt=9008&mt=8&ct=p-growth-sem-bkws&gclsrc=aw.ds&gad_source=1&gad_campaignid=20437330488&gbraid=0AAAAApk5Bhll4UdF6H12nDRP-hYPNvO_3&gclid=Cj0KCQiA18DMBhDeARIsABtYwT1UtnWIxdl1yIjM5aGZn1GUVL_2VCC23zdFXqipTi6-jjiXP40WlQ0aAnB1EALw_wcB) *in der Cloud* ausgeführt. Dazu werden Eure Fragen und Antworten übers Internet an die Supercomputer der jeweiligen Anbieter (OpenAI/Google) geschickt und dort verarbeitet. 


***


## 🧰 Was brauchst du?

- 🧠 Neugier
- 💻 Computer (Windows, Linux oder macOS)
- 🍓 [**Raspberry Pi Zero 2 W**](https://www.raspberrypi.com/products/raspberry-pi-zero-2-w/)
- 💾 Micro‑SD‑Karte (mind. 16 GB)
- 🌐 Internetverbindung


***


## 📚 Kapitel 
1. [❓ Worum geht’s?](docs/01_worum_gehts.md)   
2. [🍓 Hardware & Software (Checkliste)](docs/03_voraussetzungen.md)  
3. [▶️ Betriebssystem flashen (Raspberry Pi Imager)](docs/03_os_flashen.md)  
4. [⚙️ Erste Einrichtung: Start, IP finden, SSH](docs/04_ssh_setup.md)  
5. [⚡System aktualisieren (Updates)](docs/05_updates.md)  
6. [🦙 Ollama installieren](docs/06_ollama.md) 
7. [💬 Mit Modellen chatten](docs/07_chat.md)
8. [✍️ Prompts ans Modell senden](docs/08_prompts.md)
7. [Optional: Pi schneller machen (Swap/Overclocking)](docs/07_optimierung_optional.md)  
 
9. [Hinweise: Leistung & Temperatur](docs/10_hinweise.md)  
10. [❓FAQ / typische Probleme](docs/11_faq.md)
99. [Glossar](docs/99_glossar.md)


***


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
```

***

## 🪪 Lizenz & Copyright

© 2026 **Fabian Pingel**. Alle Rechte vorbehalten.

Dieses Repository enthält **Unterrichtsmaterialien/Dokumentation** und ggf. **Code**:

- **Dokumentation (README.md, docs/**)**: lizenziert unter **Creative Commons Attribution–NonCommercial 4.0 International (CC BY‑NC 4.0)**. [1](https://eap.bl.uk/sites/default/files/CC%20BY%20NC%20summary.pdf)  
  → Du darfst das Material **teilen** und **bearbeiten**, solange du **korrekt zitierst**, **Änderungen kennzeichnest** und es **nicht kommerziell** nutzt. [1](https://eap.bl.uk/sites/default/files/CC%20BY%20NC%20summary.pdf)
- **Code/Skripte (falls vorhanden)**: lizenziert unter der **MIT License**. [2](https://www.choosingalicense.com/compare)  
  → Sehr freie Nutzung/Weitergabe/Änderung (inkl. kommerziell), solange Copyright- und Lizenztext erhalten bleiben. [2](https://www.choosingalicense.com/compare)

➡️ Details stehen in **[LICENSE.md](LICENSE.md)**.

**Hinweis zu Drittinhalten (Bilder/Marken/Links):**  
Bilder, Logos und Markennamen (z. B. „Raspberry Pi“, „Ollama“) können Eigentum der jeweiligen Rechteinhaber:innen sein und sind ggf. **nicht** automatisch durch die obigen Lizenzen abgedeckt. [1](https://eap.bl.uk/sites/default/files/CC%20BY%20NC%20summary.pdf)[2](https://www.choosingalicense.com/compare)


***