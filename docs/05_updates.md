# Systemaktualisierung (Updates) 🔄

Bevor wir ein Sprachmodell installieren, bringen wir den Raspberry Pi auf den neuesten Stand.  
Das sorgt für **Sicherheit**, **Stabilität** und weniger Fehler bei Installationen.

***

## ✅ Ziel

Am Ende kannst du:
- dein System aktualisieren (Pakete + Sicherheitsupdates)
- prüfen, ob alles sauber durchgelaufen ist
- (optional) den Pi neu starten

***

## ✅ Voraussetzungen

- Du bist per **SSH** auf dem Raspberry Pi eingeloggt (Kapitel „SSH-Setup“).
- Du siehst eine Eingabezeile wie z. B.:

```text
pi@raspberrypi:~ $
````

***

## 1) Paketlisten aktualisieren

Zuerst holt sich der Pi eine aktuelle Liste, welche Updates verfügbar sind:

```bash
sudo apt update
```

**Was passiert hier?**  
Der Pi lädt **nur Informationen** über verfügbare Updates herunter (noch keine Installation).

***

## 2) Updates installieren

Jetzt werden die Updates installiert:

```bash
sudo apt full-upgrade -y
```

**Warum `full-upgrade`?**  
Damit dürfen auch Abhängigkeiten angepasst werden (z. B. wenn ein Paket ersetzt werden muss).  
Das ist oft robuster als ein reines `upgrade`.

> ⏳ Das kann je nach Internet und SD-Karte einige Minuten dauern.

***

## 3) Aufräumen (empfohlen)

Wenn Updates alte Pakete nicht mehr brauchen, können wir Speicher freigeben:

```bash
sudo apt autoremove -y
```

Optional (löscht heruntergeladene Paket-Dateien aus dem Cache):

```bash
sudo apt clean
```

***

## 4) (Optional) Firmware/Kernel aktualisieren

Manchmal wird im Workshop zusätzlich ein Firmware-Update gemacht:

```bash
sudo rpi-update
```

⚠️ **Hinweis:** `rpi-update` kann experimentell sein, weil es sehr neue Firmware/Kernel einspielt.  
Wenn ihr möglichst „stabil“ bleiben wollt, könnt ihr diesen Schritt auch weglassen und nur `apt` nutzen.

✅ Wenn ihr es ausführt: Danach ist ein Neustart sinnvoll.

***

## 5) Neustart (empfohlen nach Updates)

Wenn alles durch ist, starte den Pi neu:

```bash
sudo reboot
```

Danach wird die SSH-Verbindung getrennt (das ist normal).  
Warte ca. **30–90 Sekunden** und verbinde dich dann wieder per SSH.

Beispiel:

```bash
ssh BENUTZERNAME@raspberrypi.local
```

oder per IP:

```bash
ssh BENUTZERNAME@192.168.x.y
```

***

## ✅ Kurz-Check: Hat alles geklappt?

### A) Prüfen, ob noch Updates offen sind

```bash
sudo apt update
```

Wenn danach keine Updates mehr angeboten werden: ✅ gut.

### B) Speicher prüfen (hilfreich für später)

```bash
df -h
```

Achte darauf, dass auf `/` (Root) noch genug Platz frei ist (ein paar GB sind hilfreich).

***

## Troubleshooting (häufige Probleme)

### Problem 1: „Could not get lock /var/lib/dpkg/lock…“

**Ursache:** Ein anderes Update läuft noch im Hintergrund.

**Lösung:**

*   Warte 1–2 Minuten und versuche es erneut.
*   Wenn es hängt: Pi neu starten und nochmal probieren.

***

### Problem 2: „Temporary failure resolving …“ / keine Verbindung

**Ursache:** DNS/WLAN-Problem, Pi hat kein Internet.

**Lösung:**

1.  Prüfe, ob WLAN verbunden ist:
    ```bash
    ip a
    ```
2.  Teste Internet (Ping):
    ```bash
    ping -c 3 8.8.8.8
    ```
3.  Wenn das geht, aber Webseiten nicht:
    ```bash
    ping -c 3 google.com
    ```
    → dann ist DNS das Problem.

***

### Problem 3: Update bricht ab (zu wenig Speicher)

**Ursache:** SD-Karte zu klein oder voll.

**Lösung:**

*   `sudo apt autoremove -y` und `sudo apt clean`
*   Wenn es weiter knapp ist: größere SD-Karte nutzen und neu flashen.

***

# ✅ Nächster Schritt

Wenn dein Pi aktualisiert ist, geht’s weiter mit:

➡️ [**Ollama installieren**](06_ollama.md) (damit wir ein kleines LLM lokal starten können).

