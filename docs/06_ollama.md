# 6. Ollama installieren 🦙 (LLM lokal starten)

In diesem Kapitel installierst du [**Ollama**](https://ollama.com/) auf deinem Raspberry Pi.  
Ollama ist ein Programm, mit dem man **Sprachmodelle (LLMs)** lokal herunterladen und starten kann.

> ✅ Nach der Installation prüfen wir kurz, ob Ollama läuft.  
> ▶️ Das eigentliche Starten eines Modells kommt im nächsten Kapitel.

***

## ✅ Voraussetzungen
- Du bist per **SSH** auf dem Raspberry Pi eingeloggt (Kapitel: [Erste Einrichtung: Start, IP finden, SSH](04_ssh_setup.md))
- Dein System ist **aktualisiert** (Kapitel: [System aktualisieren (Updates)](05_updates.md)  )
- Internet ist verfügbar (nur für Download/Installation nötig)

***

## 6.1 (Optional) Kurzer Check: Internet ok?
Wenn du unsicher bist, ob der Pi Internet hat:

```bash
ping -c 3 8.8.8.8
```

Wenn du Antworten bekommst: ✅ Internet klappt.

***

## 6.2 Ollama installieren

Ollama wird per Installations-Skript eingerichtet.

```bash
curl -fsSL https://ollama.com/install.sh | sh
```

> ⏳ Das dauert je nach Verbindung 1–5 Minuten.


Bild einfügen

***


## 6.3 Installation prüfen (Version)

Wenn die Installation geklappt hat:

```bash
ollama --version
```

✅ Du solltest eine Versionsausgabe sehen (z. B. `ollama version ...`).

***

## 6.4 Dienst starten (falls nötig)

Auf vielen Systemen wird Ollama als Dienst eingerichtet. Prüfe den Status:

```bash
sudo systemctl status ollama --no-pager
```

Wenn dort steht „active (running)“: ✅ läuft.

Falls nicht, starte Ollama:

```bash
sudo systemctl enable --now ollama
```

***

## 6.5 Kurzer Funktionstest

Ollama zeigt dir Hilfe und verfügbare Befehle:

```bash
ollama help
```

Optional:

```bash
ollama list
```

> `ollama list` zeigt Modelle, die bereits lokal vorhanden sind. Am Anfang ist die Liste meist leer.

***

## ✅ Mini-Check

Beantworte kurz:

1.  Wofür nutzen wir Ollama?
2.  Welcher Befehl zeigt die Version?
3.  Woran erkennst du, dass der Dienst läuft?

***

## Troubleshooting (häufige Probleme)

### Problem 1: `ollama: command not found`

**Ursache:** Installation ist nicht korrekt durchgelaufen oder du bist in einer alten SSH-Session.

**Lösung:**

1.  SSH einmal trennen und neu verbinden
2.  Dann nochmal prüfen:
    ```bash
    which ollama
    ollama --version
    ```

***

### Problem 2: Dienst läuft nicht / keine Antwort

**Lösung:**

```bash
sudo systemctl restart ollama
sudo systemctl status ollama --no-pager
```

***

### Problem 3: „Zu wenig Speicherplatz“

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

***

### Problem 4: Installation bricht ab (sehr langsam / hängt)

**Ursache:** WLAN instabil oder SD-Karte sehr langsam.

**Lösung:**

*   Nochmal versuchen (oft klappt es beim zweiten Mal)
*   Pi näher an den Router / besseres WLAN
*   (wenn möglich) bessere SD-Karte nutzen

***

### Problem 4: `curl` fehlt (selten)

```bash
sudo apt update
sudo apt install -y curl
```

***

# ✅ Nächster Schritt

➡️ Weiter mit **„Modell starten“**:  
Wir laden ein kleines Modell und starten den Chat mit:

*   `ollama run <modellname>`

