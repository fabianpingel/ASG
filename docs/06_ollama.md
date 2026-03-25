# 6. 🦙 Ollama installieren (und LLM lokal starten)

In diesem Kapitel installierst Du [**Ollama**](https://ollama.com/) auf deinem Raspberry Pi.  
Ollama ist ein Programm, mit dem man **Sprachmodelle (LLMs)** lokal herunterladen und starten kann.

<img src="..\images\Ollama\01_Ollama_App.png" style="width:700px;" alt="Ollama-App (Windows)">


> ✅ Nach der Installation prüfen wir kurz, ob Ollama läuft.  
> ▶️ Das eigentliche Starten eines Modells kommt im nächsten Kapitel.

***

## ✅ Voraussetzungen
- Du bist per **SSH** auf dem Raspberry Pi eingeloggt (Kapitel: [Erste Einrichtung: Start, IP finden, SSH](04_ssh_setup.md))
- Dein System ist **aktualisiert** (Kapitel: [System aktualisieren (Updates)](05_updates.md)  )
- Internet ist verfügbar (für Download/Installation nötig)

***

## 6.1 (Optional) Kurzer Check: Internet ok?
Wenn du unsicher bist, ob der Pi Internet hat:

```bash
ping -c 3 8.8.8.8
```

Wenn du Antworten bekommst, hast Du eine Internetverbindung ✅ 

<img src="..\images\Ollama\02_Ollama_ping.png" style="width:700px;" alt="Internetverbindugn prüfen">

***

## 6.2 Ollama installieren

Ollama wird per Installations-Skript eingerichtet.

```bash
curl -fsSL https://ollama.com/install.sh | sh
```

> ⏳ Das dauert je nach Verbindung 1–5 Minuten.

<img src="..\images\Ollama\03_Ollama_install.png" style="width:700px;" alt="Ollama Installation">

***


## 6.3 Installation prüfen (Version)

Wenn die Installation geklappt hat:

```bash
ollama --version
```

✅ Du solltest eine Versionsausgabe sehen (z. B. `ollama version is ...`).

<img src="..\images\Ollama\04_Ollama_version.png" style="width:700px;" alt="Ollama Version überprüfen">

***

## 6.4 Dienst starten (falls nötig)

Auf vielen Systemen wird Ollama automatisch als Dienst eingerichtet. Prüfe den Status:

```bash
sudo systemctl status ollama --no-pager
```

Wenn dort „active (running)“ steht läuft Ollama bereits ✅ 

<img src="..\images/Ollama/05_Ollama_systemctl.png" style="width:700px;" alt="Ollama Dienst starten">


Falls nicht, starte Ollama mit:

```bash
sudo systemctl enable --now ollama
```

***

## 6.5 Kurzer Funktionstest

Ollama zeigt dir Hilfe und verfügbare Befehle mit:

```bash
ollama help
```

<img src="..\images\Ollama\06_Ollama_help.png" style="width:700px;" alt="Ollama Befehlsübersicht">

Mit `ollama list` bekommst Du Modelle angezeigt, die bereits lokal vorhanden sind. Am Anfang ist die Liste meist leer.

```bash
ollama list
```

<img src="..\images\Ollama\07_Ollama_list.png" style="width:700px;" alt="Ollama Modelle">


***


# ➡️ Nächster Schritt

➡️ Jetzt haben wir endlich alles eingerichtet, um mit einem Modell zu chatten.
Weiter geht's mit Kapitel 7: [💬 **Mit Modellen chatten**](07_chat.md):  
Hier laden wir ein kleines Modell und starten den Chat mit:

*   `ollama run <modellname>`


***



## 🛠️ Troubleshooting (häufige Probleme)

### 🚧 Problem 1: `ollama: command not found`

**Ursache:** Installation ist nicht korrekt durchgelaufen oder du bist in einer alten SSH-Session.

**Lösung:**

1.  SSH einmal trennen und neu verbinden
2.  Dann nochmal prüfen:
    ```bash
    which ollama
    ollama --version
    ```

***

### 🚧 Problem 2: Dienst läuft nicht / keine Antwort

**Lösung:**

```bash
sudo systemctl restart ollama
sudo systemctl status ollama --no-pager
```

***

### 🚧 Problem 3: „Zu wenig Speicherplatz“

**Ursache:** SD-Karte ist zu voll (Modelle brauchen Platz).

**Lösung:**

*   Speicher prüfen:
    ```bash
    df -h
    ```
*   Alte Pakete aufräumen:
    ```bash
    sudo apt autoremove -y
    sudo apt clean
    ```
*   größere MicroSD-Karte verwenden (>32 GB)

***

### 🚧 Problem 4: Installation bricht ab (sehr langsam / hängt)

**Ursache:** WLAN instabil oder SD-Karte sehr langsam.

**Lösung:**

*   Nochmal versuchen (oft klappt es beim zweiten Mal)
*   Pi näher an den Router positionieren / besseres WLAN
*   (wenn möglich) bessere SD-Karte nutzen

***

### 🚧 Problem 4: `curl` fehlt (sehr selten)

```bash
sudo apt update
sudo apt install -y curl
```


