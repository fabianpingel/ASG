# 8 💡 Prompt‑Ideen: Was kann ich fragen? (Prompts auf Englisch)

> ⚠️ **Wichtiger Hinweis**  
> Wir nutzen auf dem Raspberry Pi Zero **sehr kleine Sprachmodelle**. Diese sind oft **erst ab einer gewissen Modellgröße** wirklich gut in **Deutsch**.  
> Damit die Antworten möglichst **verständlich und zuverlässig** sind, formulieren wir unsere **Prompts in einfachem Englisch**.  
> (Zum Testen dürfen wir später trotzdem **absichtlich auf Deutsch** fragen – siehe Übung unten.)

> ✅ Tipp: Gute Prompts sind **kurz, klar und konkret**.  
> Noch besser: Sag dem Modell **Format** und **Zielgruppe**, z. B. „in 3 Bulletpoints“ oder „for a 5th grader“.

---

### Wirken sich Rechtschreibfehler beim Prompting aus?

**Ja – manchmal.** Kleine Tippfehler sind oft **nicht schlimm**, weil ein Sprachmodell meistens erkennt, was du meinst.  
Aber: **Je mehr Fehler** oder je **unklarer** der Satz, desto eher versteht das Modell dich falsch – besonders bei **sehr kleinen Modellen** (wie bei uns auf dem Raspberry Pi Zero).

✅ **Faustregeln für euch:**
- **1–2 Tippfehler:** meistens ok.
- **Viele Fehler / wirre Sätze:** Antwort wird eher schlechter oder „am Thema vorbei“.
- **Wichtige Wörter falsch geschrieben** (z. B. Fachbegriffe): Modell kann das Thema verwechseln.

💡 **Tipp:** Wenn die Antwort komisch ist: **Prompt kurz korrigieren oder einfacher neu formulieren** (kurze Sätze, klare Wörter).


---

Ja – **auch bei sehr großen Sprachmodellen** spielen Rechtschreibung und Zeichensetzung eine Rolle, **aber anders als bei kleinen Modellen**.

### Kurz gesagt:

*   **Große LLMs sind deutlich toleranter** gegenüber Tippfehlern. Sie „raten“ oft richtig, was du meinst.
*   **Trotzdem gilt:** Je **klarer** du schreibst, desto **besser und zuverlässiger** ist die Antwort.

***

## ✅ Was ist bei großen LLMs meistens egal?

*   **Kleine Tippfehler** (`wetter` statt `Wetter`, Buchstabendreher wie `wsa` → `was`)
*   **Ein fehlendes Komma**, wenn der Satz trotzdem eindeutig bleibt
*   **Umgangssprache** oder Abkürzungen (oft)

➡️ Große Modelle haben so viel Sprachwissen gelernt, dass sie viele Fehler „mitdenken“ können.

***

## ⚠️ Was kann auch bei großen LLMs Probleme machen?

### 1) **Wenn ein Fehler ein Schlüsselwort verändert**

Beispiel:

*   „**nicht**“ vergessen → Aussage wird das Gegenteil
*   Fachbegriffe falsch: „Osmose“ vs. „Osmosee“ (kann Thema verfehlen)

### 2) **Wenn Zeichensetzung die Bedeutung ändert**

Beispiele (extrem, aber anschaulich):

*   „Wir essen, Opa.“ vs. „Wir essen Opa.“
*   „Gib keine Tipps, die gefährlich sind.“ vs. „Gib keine Tipps die gefährlich sind.“  
    (oft noch ok – aber bei langen Sätzen kann es kippen)

### 3) **Wenn dein Prompt „verschachtelt“ oder mehrdeutig ist**

Ohne klare Struktur kann selbst ein großes Modell falsch priorisieren:

*   zu viele Nebensätze
*   viele Anforderungen in einem Satz
*   unklare Pronomen („das“, „es“, „diese“ – was ist gemeint?)

***

## 🎯 Praktische Regeln für Schüler:innen (funktioniert immer)

1.  **Kurze Sätze** (lieber 2 kurze als 1 langer)
2.  **Wichtige Wörter richtig** (Namen, Fachbegriffe, „nicht“)
3.  **Format sagen**: „in 3 Bulletpoints“, „in 2 Sätzen“, „ein Beispiel“
4.  **Wenn Output komisch ist:** Prompt **einfacher** neu schreiben oder korrigieren.

***

## 🧠 Merksatz

> **Große Modelle verzeihen Tippfehler besser – aber klare Sprache bringt bessere Antworten.**

Wenn du willst, kann ich dir daraus noch einen **Mini-Infokasten (2–3 Zeilen)** machen, den du direkt in euer Prompting-Kapitel einfügst.


---

## A) Schnell & gut testbar (Einsteiger – sehr leichtes Englisch)

1) **Erklären (super einfach)**
- “Explain rain in 3 short sentences for a 10-year-old.”

2) **Erklären (Schule, leicht)**
- “Explain the water cycle in 4 short sentences for a 5th grader.”

3) **Liste**
- “Give me 5 examples of AI in everyday life.”

4) **Zusammenfassen**
- “Summarize this text in 3 bullet points: …”

5) **Umformulieren (leichter)**
- “Rewrite this sentence in very simple English: …”

6) **Beispiele**
- “Give 2 examples to explain this idea: …”

---

## B) Prompt‑Tricks (macht Unterschiede sichtbar)

1) **Format festlegen**
- “Answer in 5 bullet points only.”
- “Answer in a short list.”

2) **Länge begrenzen**
- “Answer in 2 sentences.”
- “Use only 30 words.”

3) **Zielgruppe nennen**
- “Explain it for a 4th grader.”
- “Explain it like I am 12 years old.”

4) **Schritt‑für‑Schritt (Achtung!)**
- “Explain step by step how to …”
  - ⚠️ Hinweis: Schritt-für-Schritt klingt oft überzeugend, kann aber trotzdem Fehler enthalten.

---

## C) Kritisch prüfen (sehr wichtig!)

1) **Unsicherheit markieren lassen**
- “If you are not sure, say: ‘I am not sure.’ Do not guess.”

2) **Fehler suchen**
- “Check this text for mistakes and explain them: …”

3) **Pro & Contra**
- “Give 2 arguments for and 2 arguments against: …”

4) **Fakten‑Alarm**
- “Write 3 facts. Then write ‘CHECK’ next to any fact that might be wrong.”

---

## 🧪 Übung: Einmal Deutsch, einmal Englisch – und beobachten! (5–10 Minuten)

**Ziel:** Wir testen, wie sich ein *kleines* Modell auf dem Pi Zero in Deutsch vs. Englisch verhält.

### Schritt 1: Frage auf Deutsch (absichtlich)
Kopiere diesen Prompt (Deutsch):
- „Erkläre den Wasserkreislauf in 4 kurzen Sätzen für die 5. Klasse.“

### Schritt 2: Gleiche Frage auf Englisch (empfohlen)
Kopiere diesen Prompt (Englisch):
- “Explain the water cycle in 4 short sentences for a 5th grader.”

### Schritt 3: Beobachten & vergleichen (kurz notieren)
- **Tempo:** Welche Antwort kommt schneller?
- **Verständlichkeit:** Welche ist leichter zu lesen?
- **Sprache:** Gibt es komische Wörter/Grammatik?
- **Inhalt:** Wirkt etwas erfunden oder unsicher?
- **Länge:** Hält das Modell die Vorgabe (4 Sätze) ein?

✅ **Mini‑Fazit (1 Satz):**  
„Auf unserem Pi Zero funktioniert ________ (Deutsch/Englisch) besser, weil ________.“

---

# 🧪 Mini-Lab (10–15 Minuten) – Teamaufgabe

## Aufgabe 1: „Kurz vs. Lang“

1.  Prompt A: „Erkläre Photosynthese in **2 Sätzen**.“
2.  Prompt B: „Erkläre Photosynthese **sehr ausführlich** mit Details.“

➡️ Vergleicht:

*   Geschwindigkeit
*   Verständlichkeit
*   Fehler/Unsicherheiten

## Aufgabe 2: „Prompt verbessern“

Startprompt:

*   „Erkläre Klimawandel.“

Verbesserter Prompt:

*   „Erkläre Klimawandel **für Klasse 8** in **5 Bulletpoints** und nenne **2 Unsicherheiten**, die man prüfen sollte.“

➡️ Was wird besser?

***


# 6.4 💡 Prompt-Ideen: Was kann ich fragen?

> Tipp: Gute Prompts sind **kurz, klar und konkret**.  
> Noch besser: sag dem Modell **Format** und **Rolle**, z. B. „in 5 Bulletpoints“.

## A) Schnell & gut testbar (Einsteiger)

1.  **Erklären (leicht):**

*   „Erkläre den Treibhauseffekt in 4 kurzen Sätzen für Klasse 7.“

2.  **Zusammenfassen:**

*   „Fasse diesen Text in 3 Stichpunkten zusammen: …“

3.  **Liste erstellen:**

*   „Gib mir 5 Beispiele, wo KI im Alltag vorkommt.“

4.  **Umformulieren:**

*   „Formuliere diesen Satz einfacher: …“

5.  **Quiz:**

*   „Stelle mir 5 Quizfragen zu \[Thema] und gib die Lösungen unten an.“

## B) Prompting-Tricks (macht Unterschiede sichtbar)

1.  **Format festlegen:**

*   „Antworte **nur** in 5 Bulletpoints.“
*   „Gib eine Tabelle…“ (Achtung: im Terminal manchmal unübersichtlich)

2.  **Rolle geben:**

*   „Du bist eine Lehrkraft. Erkläre…“
*   „Du bist ein Prüfer. Finde Fehler in…“

3.  **Beispiele verlangen:**

*   „Gib zuerst eine Definition, dann ein Beispiel aus dem Alltag.“

4.  **Schritt-für-Schritt (Achtung: kann falsch sein):**

*   „Erkläre Schritt für Schritt, wie man … macht.“

## C) Kritisch prüfen (sehr wichtig!)

1.  **Faktencheck anfordern:**

*   „Nenne 3 Punkte, die unsicher sein könnten, und sag dazu ‚bitte prüfen‘.“

2.  **Gegenthese:**

*   „Nenne Argumente **dafür und dagegen**.“

3.  **Unsicherheit markieren:**

*   „Wenn du etwas nicht weißt, schreibe **‚Ich bin unsicher‘** statt zu raten.“

***

# 👀 Was sollen Schüler:innen besonders beobachten? (Pi Zero = spannend!)

## 1) Geschwindigkeit & „Wartegefühl“

*   Wie lange dauert es, bis die **erste Antwort** kommt?
*   Kommt Text **stückweise** (Token für Token) oder erst am Ende?

✅ Beobachtungsauftrag:

*   Stoppe grob die Zeit: „Start“ → „erste Wörter sichtbar“.

## 2) Qualität vs. Länge der Antwort

*   Kurze Aufgaben funktionieren oft besser.
*   Lange Texte/komplizierte Aufgaben können schlechter werden oder abbrechen.

✅ Beobachtungsauftrag:

*   Vergleiche: „Erkläre in 2 Sätzen“ vs. „Erkläre sehr ausführlich“.

## 3) „Halluzinationen“ (selbstbewusst falsch)

*   Klingt die Antwort plausibel, obwohl sie falsch sein könnte?

✅ Beobachtungsauftrag:

*   Stelle eine Frage mit Zahlen/Details und prüfe (Schulbuch/Internet/Lehrkraft).

## 4) Kontext-Grenzen (Vergessen im Chat)

*   Merkt sich das Modell alles aus dem Verlauf?
*   Wann „vergisst“ es Details?

✅ Beobachtungsauftrag:

*   Gib eine Info („Mein Hund heißt Luna“) und frage 10 Zeilen später erneut.