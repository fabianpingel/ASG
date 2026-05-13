# 💬 Was ist ein Sprachmodell?

Ein **Sprachmodell** ist ein Computerprogramm, das aus sehr vielen Textbeispielen gelernt hat, wie Sprache typischerweise aufgebaut ist. 

Wenn Du ihm einen Textanfang oder eine Frage gibst, berechnet es **welche Wörter als Nächstes am wahrscheinlichsten passen** und setzt so Schritt für Schritt eine Antwort zusammen. 

***

## 💡 Grundidee

Ein Sprachmodell lernt also aus **sehr vielen Texten** (z. B. Büchern, Artikeln, Webseiten):

*   welche Wörter oft zusammen vorkommen
*   wie Sätze aufgebaut sind
*   was logisch oder sinnvoll klingt

👉 Es versteht Sprache nicht wie ein Mensch, sondern **erkennt Muster**:

1.  Du schreibst eine Frage oder einen Satz.
2.  Der Text wird vom Computer in **Zahlen (Tokens)** übersetzt.
3.  Das Modell berechnet:  
    *Welches Wort passt jetzt am wahrscheinlichsten als nächstes?*
4.  Die Antwort entsteht **Stück für Stück**, Wort für Wort (Token für Token).

***

### 🧩 Beispiel

*Das städtische Albert-Schweitzer Gymnasium in ...*

* A: Deutschland
* B: Plettenberg
* C: einer mittelgroßen Stadt
* D: Fußballschuhe

Natürlich kennen wir die richtige Antwort: **B**. Aber auch A und C wären plausibel, wenn wir nicht aus Plettenberg oder Umgebung kämen.


***


### 📌 Wichtig zu wissen

*   Ein Sprachmodell **hat kein Bewusstsein**
*   Es **denkt nicht**, sondern **rechnet**
*   Es kling **klug**, weil es gute Sprachmuster kennt
*   Es kann sich **irren**

> Ein Sprachmodell liefert nicht die **eine richtige Antwort**,  
> sondern nur die **wahrscheinlichste Fortsetzung**.

***

## 🧠 Large Language Model

Der englische Begriff ist **LLM** und bedeutet **L**arge **L**anguage **M**odel („großes Sprachmodell“): 
Das ist ein besonders leistungsfähiges Sprachmodell, das mit *sehr vielen Daten* trainiert wurde und deshalb Texte oft erstaunlich flüssig formulieren, zusammenfassen oder erklären kann – trotzdem kann es sich auch irren und sollte bei wichtigen Infos immer überprüft werden!

Große Sprachmodelle (z.B. [Chat-GPT](https://chatgpt.com/) oder [Gemini](https://gemini.google.com/?hl=de)) laufen normalerweise auf **riesigen Servern** in Rechenzentren. 


***


### 📍 Was bedeutet „lokal“?

👉 **Lokal** heißt:
- Das Modell läuft auf deinem eigenen Gerät (volle Kontrolle!)
- Ohne Internet (niemald liest mit!)
- Deine Daten bleiben bei dir (Datenschutz!)

☁️ **Cloud**: 

Normalerweise werden LLMs *in der Cloud* ausgeführt. Dazu werden Eure Fragen und Antworten übers Internet an die Server (Supercomputer) der jeweiligen Anbieter (OpenAI/Google) geschickt und dort verarbeitet. 

### 🔐 Warum ist das wichtig? (Datenschutz & Kontrolle)

Wenn du ein Cloud‑LLM nutzt, werden Fragen/Antworten **übers Internet** an fremde Rechner gesendet – das bedeutet: Du gibst Daten aus der Hand.  
Beim lokalen LLM passiert die Verarbeitung **auf deinem Gerät** – dadurch hast du mehr Kontrolle darüber, was mit deinen Daten passiert.   

**⚠️ Wichtige Regel (nicht nur für die Schule!):**  
- **Niemals persönlichen Daten** (Name, Adresse, private Infos) in Prompts eingeben! 


## 🧪 1.1 Übung: Mensch vs. Sprachmodell (5-10 Minuten)

Testet, ob **Menschen so antworten wie ein Sprachmodell** — also nach **Wahrscheinlichkeit** und **Plausibilität**.

1.  Denkt euch einen **Satzanfang** aus 
    (nicht zu kurz, nicht zu lang!)

    👉 Beispiel:

    > *Heute im Unterricht haben wir …*

2.  **Schreibt** den Satzanfang **auf ein Blatt**  
    (ohne ihn zu vervollständigen).

3.  Gebt den Satz an euren Sitznachbarn / eure Sitznachbarin weiter.

4.  Euer Sitznachbar **vervollständigt den Satz**  
    – **so, wie es ein Sprachmodell es tun würde:

5.  **Vergleicht** anschließend:
    *   War die Fortsetzung logisch?
    *   Hätten mehrere Antworten gepasst?

***

### 🤔 Reflexion (wichtig!)

Diskutiert kurz miteinander oder in der Klasse:

*   ✅ War die Antwort **wahrscheinlich** oder nur kreativ?
*   ✅ Gab es **mehrere richtige Möglichkeiten**?
*   ✅ Hat Euer Partner ähnlich „gerechnet“ wie ein Sprachmodell?

## ➡️ Nächster Schritt

Genug der Theorie. Fangen wir an.

> ➡️ Weiter geht’s mit Kapitel 2: [🍓 Hardware & Software (Checkliste)](02_requirements.md).






  