# 7 💬 Mit Modell über Ollama chatten  

>🎩 **Chapeau!** Wenn Du bis hierhin durchgehalten hast, ist das eine **richtig starke Leistung!**  
Du hast dich durch Hardware, Setup, Flashen, SSH und Updates durchgearbeitet – das ist nicht „mal eben“, sondern echte IT‑Praxis. **Sei stolz auf Dich!** 👏


In diesem Kapitel lernst Du, wie Du mit **Ollama** ein kleines Sprachmodell startest und damit im Terminal „chattest“.  
Außerdem bekommst Du Ideen für Fragen (Prompts) und Beobachtungen, die besonders spannend sind, wenn ein Modell auf einem **Raspberry Pi Zero 2 W** läuft.

***

## 🎯 Lernziel

Am Ende kannst du:
- ein Modell mit Ollama **starten**
- im Terminal **Fragen stellen** und Antworten bekommen
- **beobachten**, wie sich ein kleines LLM auf schwacher Hardware verhält (Tempo, Grenzen, Qualität)

***

## 📋 Voraussetzungen

- Du bist per **SSH** auf dem Raspberry Pi eingeloggt
- **Ollama ist installiert** und läuft (Kapitel 6 [Ollama installieren](06_ollama.md))
- Internet ist nur **für den ersten Modell-Download** nötig  
  (danach läuft es ohne Internet, weil das Modell lokal gespeichert ist)

***

## 7.1 Kurzer Check: Läuft Ollama?

```bash
ollama --version
````

Optional (Dienststatus):

```bash
sudo systemctl status ollama --no-pager
```

<img src="..\images\Chat\01_chat_ollama_check.png" style="width:700px;" alt="Ollama Status Check">

***

## 7.2 Ein Modell starten (Chat öffnen)

> 💡 Hinweis: Beim **ersten Start** wird das Modell heruntergeladen. Das dauert (je nach WLAN) etwas.

### Beispiel: Kleines Modell starten

```bash
ollama run smollm2:135m-instruct-q4_K_S
```

Danach bist du im Chat. Du erkennst das daran, dass du direkt tippen kannst.

<img src="..\images\Chat\02_chat_ollama_run.png" style="width:700px;" alt="Chat mit Ollama">

### Chat beenden

Je nach Version klappt z.B.:

*   tippe `/bye`
*   oder `Ctrl + C` (abbrechen)

<img src="..\images\Chat\03_chat_ollama_bye.png" style="width:700px;" alt="Chat mit Ollama">

***

## 7.3 geeignete Modelle finden

Öffne am PC/Laptop ein Browserfenster und suche unter `https://ollama.com/search` nach Modellen

<img src="..\images\Chat\04_chat_ollama_models.png" style="width:700px;" alt="Chat mit Ollama">

Damit die Modelle auf dem Raspberry Pi Zero funktionieren müssen diese **kleiner 500MB** sein. Folgende Modelle könnt ihr ausprobieren:
* smollm2:135m-instruct-q4_K_S (102 MB)
* smollm2:135m-instruct-q3_K_S (88 MB) 
* smollm2:135m-instruct-q2_K (88 MB)
* gemma3:270m (292 MB)
* granite4:350m-h (366 MB) 

***

## 7.4 Nützliche Ollama-Befehle (Kurzliste)

### Modelle anzeigen, die schon lokal gespeichert sind

```bash
ollama list
```

<img src="..\images\Ollama\07_Ollama_list.png" style="width:700px;" alt="Modell herunterladen">

### Modell *vorab* herunterladen (ohne es direkt zu starten)

```bash
ollama pull <MODELNAME>
```
zum Beispiel

```bash
ollama pull smollm2:135m
```

<img src="..\images\Chat\05_chat_ollama_pull_model.png" style="width:700px;" alt="Modell herunterladen">

### Informationen über ein Modell anzeigen

```bash
ollama show smollm2:135m
```

<img src="..\images\Chat\06_chat_ollama_show_model.png" style="width:700px;" alt="Modelleigenschaften anzeigen">

### Modell löschen (macht Speicher frei)

```bash
ollama rm smollm2:135m
```

<img src="..\images\Chat\07_chat_ollama_delete_model.png" style="width:700px;" alt="Modell entfernen">

***


## 7.5 Optional: Hardware-Effekt (Pi arbeitet sichtbar)

Optional (für neugierige Teams): Während das Modell antwortet, in einem zweiten SSH-Fenster prüfen:

### CPU-Last anzeigen

```bash
top
```

<img src="..\images\Ollama\08_Ollama_top.png" style="width:700px;" alt="CPU- und Speicher-Auslastung">

Wie man in der ersten Zeile erkennt, ist die CPU hier mit 291,2% 'über'ausgelastet, weshalb die einzelnen Antwort-Tokens vom Sprachmodell auch nur sehr verzögert auf dem Terminal erscheinen.

Man beendet die Anzeige mit **STRG + C**.

### 🌡️ Temperatur (Thermomanagement)

```bash
vcgencmd measure_temp
```

<img src="..\images\Ollama\09_Ollama_temp.png" style="width:700px;" alt="CPU- und Speicher-Auslastung">

Im **Leerlauf** liegt ein Raspberry Pi normalerweise bei **40–50 °C** (je nach Raumtemperatur und Gehäuse).

Unter **Last** (z.B. beim Chatten mit einem Modell) kann die CPU-Temperatur auf **über 80°C** steigen.

#### 🥵 Throttling (Drosselung)

Der Raspberry Pi schützt sich vor Überhitzung automatisch durch **Thermal Throttling**. Ab etwa **80 °C** beginnt er, die Leistung zu drosseln (CPU wird langsamer) und ab etwa **85 °C** wird noch stärker gedrosselt, damit die Temperatur nicht weiter ansteigt und Schäden an der CPU vermieden werden.

Ob der Pi gedrosselt hat, könnt ihr überprüfen mit:

```bash
vcgencmd get_throttled
```

Steht hier ein anderer Wert als `throttled=0x0` gab es z.B. ein Temperaturlimit (oder Unterspannung) seit dem letzten Boot.


> ⚠️ **Warnhinweis: Verbrennungsgefahr**    
Bei hoher Last können Chip/Heatsink spürbar heiß werden. Kontakt mit heißen Oberflächen kann Verbrennungen verursachen – insbesondere wenn man länger dranfasst. 

> ℹ️ **Hinweis:** Nach intensiver Nutzung nicht direkt am Kühler anfassen, sondern abkühlen lassen und den Pi so platzieren, dass niemand versehentlich an heiße Teile kommt.

### 🧪 7.1. Mini-Teamaufgabe (5-10 Minuten) – Temperatur & Throttling prüfen (über Terminal)

Aktuelle Temperatur anzeigen:
```bash
vcgencmd measure_temp
```

oder automatisiert alle 30 Sekunden:

```bash
watch -n 30 vcgencmd measure_temp
```

✅ Aufgabe:

*   Wie warm wird der Pi?
*   Steigt die CPU-Last während der Antwort stark an?
*   Macht z.B. alle 30 Sekunden eine Messung und zeichnet die Temperaturkurve auf.
*   Vergleiche verschiedene Sprachmodelle


***


# ➡️ Nächster Schritt

➡️ Als nächstes schauen wir uns an, was ein ein kleines Modell gut kann – und was nicht? Weiter geht's mit Kapitel 8 [✍️ Prompts ans Modell senden](08_prompts.md).


***


# 🛠️ Troubleshooting

## 🚧 Problem 1: Download hängt / dauert ewig

*   WLAN ist langsam oder instabil → warten oder erneut versuchen
*   näher an den Router / besserer Empfang hilft oft

## 🚧 Problem 2: „not enough space“

Prüfe Speicher:

```bash
df -h
```

Wenn voll: Modelle löschen, die du nicht brauchst:

```bash
ollama list
ollama rm <modellname>
```

## 🚧 Problem 3: Modell startet, aber Antworten sind extrem langsam

Das ist beim Pi Zero normal. Tipp:

*   kürzere Prompts
*   kürzere gewünschte Antworten („in 3 Sätzen“)
*   kleinere 'quantisierte' Modelle wählen

## 🚧 Problem 4: Chat lässt sich nicht beenden

*   `Ctrl + C` drücken
*   Wenn das Terminal „hängt“: SSH trennen und neu verbinden



