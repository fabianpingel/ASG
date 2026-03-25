# 🚀 Build Your Own AI 🧠
## 💬 Dein eigenes Sprachmodell auf einem Raspberry Pi Zero 2W

Willkommen zu **Build Your Own AI**!  
In diesem Projekt lernst Du Schritt für Schritt, wie Du auf einem winzigen, günstigen Computer – dem **Raspberry Pi Zero 2 W** – Dein **eigenes kleines Sprachmodell (SmolLM)** installierst und betreibst.
Und zwar **lokal**, d.h. ohne Cloud und mit voller Kontrolle über Deine Daten!

👉 **Du brauchst keine Programmier‑ oder IT‑Vorkenntnisse.** Alles wird verständlich erklärt – versprochen 😊

👉 Falls Du mal über ein fremdes Wort oder einen Begriff stolperst, den Du nicht kennst, dann erklärt Dir dieses [**Glossar**](docs/99_glossar.md) alle wichtige Begriffe rund um KI, LLMs & Raspberry Pi. 


***


## 📌 Worum geht es?

Große Sprachmodelle wie z.B. [Chat-GPT](https://chatgpt.com/)   laufen normalerweise auf **riesigen** Servern.  
In diesem Projekt zeigen wir Dir:

- was ein **Sprachmodell (LLM)** eigentlich ist.
- wie KI auch **auf sehr kleiner Hardware** funktionieren kann.
- wie man einen Raspberry Pi **eigenständig** einrichtet.
- wie man ein kleines Sprachmodell (*SmolLM*) lokal startet.
- den Unterschied zwischen **echter Intelligenz und Statistik**.
- **was KI kann – und was nicht**.
- und warum das Ganze trotzdem beeindruckend ist.

Das Projekt basiert auf diesem englischsprachigen Tutorial:  
🔗 https://github.com/Gilzone/Installing-a-LLM-on-Raspberry-Pi-Zero-2-W  

➡️ Diese Anleitung ist **vereinfacht, übersetzt und didaktisch aufbereitet**.


***


## 🧰 Was brauchst du?

- 🧠 Neugier
- 💻 Computer (Windows, Linux oder macOS)
- 🍓 [**Raspberry Pi Zero 2 W**](https://www.raspberrypi.com/products/raspberry-pi-zero-2-w/)
- 💾 Micro‑SD‑Karte (mind. 32 GB)
- 🌐 Internetverbindung


***


## 📚 Kapitel 
1. [❓ Was ist ein Sprachmodell?](docs/01_basics_llm.md)   
2. [🍓 Hardware & Software (Checkliste)](docs/02_requirements.md)  
3. [▶️ Betriebssystem flashen (Raspberry Pi Imager)](docs/03_os_flashen.md)  
4. [⚙️ Erste Einrichtung: Start, IP finden, SSH](docs/04_ssh_setup.md)  
5. [⚡System aktualisieren (Updates)](docs/05_updates.md)  
6. [🦙 Ollama installieren](docs/06_ollama.md) 
7. [💬 Mit Modellen chatten](docs/07_chat.md)
8. [✍️ Prompts ans Modell senden](docs/08_prompts.md)
9. [Optional: Pi schneller machen (Swap/Overclocking)](docs/09_optimierung_optional.md)  
10. [Fazit](docs/10_fazit.md)  
99. [Glossar](docs/99_glossar.md)


***


## 📂 Projektstruktur

```text
.
├── LICENSE.md
├── README.md
├── images/
└── docs/
    ├── 01_basics_llm.md
    ├── 02_requirements.md
    ├── 03_os_flashen.md
    ├── 04_ssh_setup.md
    ├── 05_updates.md
    ├── 06_ollama.md
    ├── 07_chat.md
    ├── 08_prompts.md
    ├── 09_TBD.md
    └── 10_fazit.md
```

***

## 🪪 Lizenz & Copyright

© 2026 **Fabian Pingel**. Alle Rechte vorbehalten.

Dieses Repository enthält **Unterrichtsmaterialien/Dokumentation** und ggf. **Code**:

- **Dokumentation (README.md, docs/**)**: lizenziert unter **Creative Commons Attribution–NonCommercial 4.0 International ([CC BY‑NC 4.0](https://eap.bl.uk/sites/default/files/CC%20BY%20NC%20summary.pdf))**. 
  → Du darfst das Material **teilen** und **bearbeiten**, solange du **korrekt zitierst**, **Änderungen kennzeichnest** und es **nicht kommerziell** nutzt.
- **Code/Skripte (falls vorhanden)**: lizenziert unter der **[MIT License](https://www.choosingalicense.com/compare)**. 
  → Sehr freie Nutzung/Weitergabe/Änderung (inkl. kommerziell), solange Copyright- und Lizenztext erhalten bleiben.

➡️ Details stehen in **[LICENSE.md](LICENSE.md)**.

**Hinweis zu Drittinhalten (Bilder/Marken/Links):**  
Bilder, Logos und Markennamen (z. B. „Raspberry Pi“, „Ollama“) können Eigentum der jeweiligen Rechteinhaber:innen sein und sind **nicht** durch die obigen Lizenzen abgedeckt.

