# 8 💡 Prompt‑Ideen: Was kann ich fragen? (Prompts auf Englisch)

> ⚠️ **Wichtiger Hinweis!**  
> Wir nutzen auf dem Raspberry Pi Zero **sehr kleine Sprachmodelle**. Diese sind oft erst ab einer gewissen Modellgröße wirklich gut in deutscher Sprache.  
> Damit die Antworten möglichst verständlich und zuverlässig sind, formulieren wir unsere **Prompts in einfachem Englisch**.  
> (Zum Testen dürfen wir später trotzdem *absichtlich* auf Deutsch fragen – siehe Übung unten.)

> ✅ Tipp: Gute Prompts sind **kurz, klar und konkret**.  
> Noch besser: Sag dem Modell **Format** und **Zielgruppe**, z. B. „in 3 Bulletpoints“ oder „for a 5th grader“.

***

## 💡 Gut zu wissen

Hier findest du kurze Hinweise und Tipps, die dir helfen, besser mit Sprachmodellen umzugehen.

### 🤖 Was ist Prompting?

**Prompting** bedeutet:  
👉 *Du sagst einer KI (z. B. ChatGPT oder Copilot) genau, was sie tun soll.*

Der **Prompt** ist dabei deine **Eingabe** – also deine Frage und/oder Anweisung.

👉 Je klarer und genauer du fragst, desto besser ist die Antwort.

#### ✏️ Beispiel:
- ❌ Schlechter Prompt:  
  > „Erklär Mathe.“

- ✅ Guter Prompt:  
  > „Erkläre mir den Satz des Pythagoras einfach mit den Worten eines 9. Klässlers und mit einem konkreten Beispiel.“


### ✍️ Wirken sich Rechtschreibfehler beim Prompting aus?

**Ja – manchmal.** Kleine Tippfehler sind oft nicht schlimm, weil ein Sprachmodell meistens erkennt, was du meinst.  
Aber: **Je mehr Fehler** oder je **unklarer** der Satz, desto eher versteht das Modell dich falsch – insbesondere bei sehr kleinen Modellen (wie bei uns auf dem Raspberry Pi Zero).

✅ **Faustregeln:**
- **1–2 Tippfehler:** meistens ok.
- **Viele Fehler / wirre Sätze:** Antwortqualität wird schlechter oder „am Thema vorbei“.
- **Wichtige Wörter falsch geschrieben** (z. B. Fachbegriffe): Modell kann das Thema verwechseln.


#### 🎯 Praktische Regeln

1.  **Kurze Sätze** (lieber 2 kurze Sätze als 1 langer Satz)
2.  **Wichtige Wörter richtig** (Namen, Fachbegriffe, „nicht“)
3.  **Format festlegen:** „in 3 Stichpunkten, „in 2 Sätzen“, „als Tabelle“
4.  **Rolle geben:** „Du bist eine Lehrkraft. Erkläre…“
5.  **Beispiele:** „Gib zuerst eine Definition, dann ein Beispiel aus dem Alltag.“


***

#### 🧩 Beispiele: Schnell & gut testbar (leichtes Englisch)

1) **Erklären**
- “Explain rain in 3 short sentences for a 10-year-old.”
- “Explain the water cycle in 4 short sentences for a 5th grader.”

2) **Liste**
- “Give me 5 examples of AI in everyday life.”

3) **Zusammenfassen**
- “Summarize this text in 3 bullet points: …”

4) **Umformulieren**
- “Rewrite this sentence in very simple English: …”

***

## 🧪 Übung A: Deutsch vs. Englisch (5–10 Minuten)

**Ziel:** Wir testen nun, wie sich ein *kleines* Modell auf dem Pi Zero in Deutsch vs. Englisch verhält.

### Schritt 1: Frage auf Deutsch 
Kopiere diesen Prompt (Deutsch):
- „Erkläre den Wasserkreislauf in 4 kurzen Sätzen für die 5. Klasse.“

### Schritt 2: Gleiche Frage auf Englisch
Kopiere diesen Prompt (Englisch):
- “Explain the water cycle in 4 short sentences for a 5th grader.”

### Schritt 3: Beobachten & vergleichen (kurz notieren)
- **Tempo:** Welche Antwort kommt schneller?
- **Verständlichkeit:** Welche ist leichter zu lesen?
- **Sprache:** Gibt es komische Wörter/Grammatik?
- **Inhalt:** Wirkt etwas erfunden oder unsicher?
- **Länge:** Hält das Modell die Vorgabe (4 Sätze) ein?

***

## 🧪 Übung B: Teamaufgabe (10–15 Minuten)

### Aufgabe 1: „Kurz vs. Lang“

1.  Prompt A: „Explain photosynthesis in two sentences.“
2.  Prompt B: „Explain photosynthesis in great detail.“

➡️ Vergleicht Geschwindigkeit,Verständlichkeit und Fehler/Unsicherheiten

### Aufgabe 2: „Prompt verbessern“

Startprompt:

*   „Explain climate change.“

Verbesserter Prompt:

*   „Explain climate change for grade 8 in 5 bullet points and name 2 uncertainties that should be checked.
“

➡️ Welche Antwort ist besser?

***

## 🧪 Übung C: Was konntet ihr beobachten? (5-10 Minuten)

### Aufgabe 1: Geschwindigkeit & „Wartegefühl“

*   Wie lange dauert es, bis die **erste Antwort** kommt?
*   Kommt Text **stückweise** (Token für Token) oder erst am Ende?
*   Ist Euch bei Zahlen etwas aufgefallen?

👀 Beobachtungsauftrag:

*   Stoppe grob die Zeit: „Start“ → „erste Wörter sichtbar“.

### Aufgabe 2: Qualität vs. Länge der Antwort

*   Kurze Aufgaben funktionieren oft besser.
*   Lange Texte/komplizierte Aufgaben können schlechter werden oder abbrechen.

👀 Beobachtungsauftrag:

*   Vergleiche: „Erkläre in 2 Sätzen“ vs. „Erkläre sehr ausführlich“.

### Aufgabe 3: „Halluzinationen“ (selbstbewusst falsch)

*   Klingt die Antwort plausibel, obwohl sie falsch sein könnte?

👀 Beobachtungsauftrag:

*   Stelle eine Frage mit Zahlen/Details und prüft diese (Schulbuch/Internet/Lehrkraft).

### Aufgabe 4: Kontext-Grenzen (Vergessen im Chat)

*   Merkt sich das KI-Modell alles aus dem Verlauf?
*   Wann „vergisst“ es Details?

👀 Beobachtungsauftrag:

*   Gib eine Info („Mein Hund heißt Nellie) und frage 10 Zeilen später erneut.