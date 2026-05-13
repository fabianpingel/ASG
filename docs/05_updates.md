# 5. 🔄 Systemaktualisierung (Updates)

Bevor wir ein Sprachmodell installieren, bringen wir den Raspberry Pi auf den neuesten Stand.  
Das sorgt für **Sicherheit**, **Stabilität** und weniger Fehler bei Installationen.

***

## 🎯 Lernziel

Am Ende kannst Du:
- dein System aktualisieren (Pakete + Sicherheitsupdates)
- prüfen, ob alles sauber durchgelaufen ist
- (optional) den Pi neu starten

***

## ✅ Voraussetzungen

- Du bist per **SSH** auf dem Raspberry Pi eingeloggt (Kapitel „SSH-Setup“).
- Du siehst eine Eingabezeile wie z. B.:

```text
pi@raspberrypi:~ $
```

***

## 5.1 Paketlisten aktualisieren

Zuerst holt sich der Pi eine aktuelle Liste, welche Updates verfügbar sind:

```bash
sudo apt update
```

**Was passiert hier?**  
Der Pi lädt **nur Informationen** über verfügbare Updates herunter (noch keine Installation).

<img src="..\images\Updates\01_update.png" style="width:700px;" alt="Paketlisten aktualisieren">

***

## 5.2 Updates installieren

Jetzt werden die Updates installiert:

```bash
sudo apt full-upgrade -y
```

**Warum `full-upgrade`?**  
Damit dürfen auch Abhängigkeiten angepasst werden (z. B. wenn ein Paket ersetzt werden muss).  
Das ist oft robuster als ein reines `upgrade`.

> ⏳ Das kann je nach Internet und SD-Karte 5-10 Minuten dauern.

<img src="..\images/Updates/02_upgrade.png" style="width:700px;" alt="Updates installieren">


***

## 5.3 Aufräumen (empfohlen)

Wenn Updates alte Pakete nicht mehr brauchen, können wir Speicher freigeben:

```bash
sudo apt autoremove -y
```

Optional: Heruntergeladene Paket-Dateien aus dem Cache löschen:

```bash
sudo apt clean
```

<img src="..\images\Updates\03_clean.png" style="width:700px;" alt="Speicher nach Update freigeben">

***

## 5.4 (Optional) Firmware/Kernel aktualisieren

Zusätzlich ein Firmware-Update machen:

```bash
sudo rpi-update
```

<img src="..\images\Updates\04_firmware.png" style="width:700px;" alt="Firmware Update">

⚠️ **Hinweis:** `rpi-update` kann experimentell sein, weil es sehr neue Firmware/Kernel einspielt.  
Wenn ihr möglichst „stabil“ bleiben wollt, könnt ihr diesen Schritt auch weglassen und nur `apt` nutzen.

✅ Wenn ihr es ausführt ist danach ein Neustart notwendig.

***

## 5.5 Neustart (empfohlen nach Updates)

Wenn alles durch ist, starte den Pi neu:

```bash
sudo reboot
```

<img src="..\images\Updates\04_reboot.png" style="width:700px;" alt="Neustart">

Danach wird die SSH-Verbindung getrennt (das ist normal).  
Warte ca. **30–90 Sekunden** und verbinde Dich dann wieder per SSH.

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

<img src="..\images\Updates\05_reconnect.png" style="width:700px;" alt="Reconnect nach Neustart">

### B) Speicher prüfen (hilfreich für später)

```bash
df -h
```

Achte darauf, dass auf `/` (Root) noch genug Platz frei ist (ein paar GB sind hilfreich).

Hier im Beispiel sind noch 21 GB verfügbar.

<img src="..\images/Updates/06_diskspace.png" style="width:700px;" alt="Speicherplatz prüfen">


***


# ➡️ Nächster Schritt

Wenn dein Pi aktualisiert ist, geht’s weiter mit Kapitel 6:

➡️ [🦙 **Ollama installieren**](06_ollama.md)  (damit wir ein kleines LLM lokal starten können).


***

## 🛠️ Troubleshooting (häufige Probleme)

### 🚧 Problem 1: „Could not get lock /var/lib/dpkg/lock…“

**Ursache:** Ein anderes Update läuft noch im Hintergrund.

**Lösung:**

*   Warte 1–2 Minuten und versuche es erneut.
*   Wenn es hängt: Pi neu starten mit `sudo reboot` und nochmal probieren.

***

### 🚧 Problem 2: „Temporary failure resolving …“ / keine Verbindung

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

<img src="..\images\Updates\07_ping.png" style="width:700px;" alt="DNS/WLAN prüfen">



***

### 🚧 Problem 3: Update bricht ab (zu wenig Speicher)

**Ursache:** SD-Karte zu klein oder voll.

**Lösung:**

*   `sudo apt autoremove -y` und `sudo apt clean`
*   Wenn es weiter knapp ist: größere SD-Karte nutzen und neu flashen.


