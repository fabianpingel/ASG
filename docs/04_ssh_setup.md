# 4. 🔐 SSH-Setup: Mit dem Raspberry Pi verbinden (Headless)

In diesem Kapitel verbindest Du dich per **SSH** mit deinem Raspberry Pi – also **ohne Monitor, Tastatur und Maus**.  
Du steuerst den Pi dann vom PC/Laptop aus über ein Terminal („Retro-Computing“ mit Textbefehlen wie in den 1980ern 💀).


***


## 🎯 Lernziel

Am Ende kannst Du:
- den Raspberry Pi im Netzwerk finden (über Hostname oder IP-Adresse)
- Dich per SSH einloggen
- typische SSH-Probleme schnell lösen


***


## 📋 Was Du brauchst

- Raspberry Pi ist **geflasht** (Kapitel: [Betriebssystem flashen](03_os_flashen.md)) und wurde **eingesteckt**
- Pi ist im **gleichen WLAN** wie dein PC/Laptop
- SSH wurde im Imager **aktiviert**
- Du kennst:
  - **Hostname** (z.B. `rpi0-gruppe1` oder Standard `raspberrypi`)
  - **Benutzername** und **Passwort** (aus dem Imager)

> ⏱️ Hinweis: Nach dem ersten Einschalten braucht der Pi oft **2–4 Minuten**, bis er vollständig im WLAN ist. Man erkennt das an der grünen LED. Solange diese flackert ist der Pi noch mit Lese-/Schreibvorgängen beschäftigt.


***


## ℹ️ Begriffe kurz erklärt (für dieses SSH‑Kapitel)

**SSH (Secure Shell)**  
SSH ist ein **sicherer Fernzugriff**: Du kannst dich von deinem Computer aus bei einem anderen Gerät (z.B. dem Raspberry Pi) **anmelden** und es **über Textbefehle steuern** – und zwar verschlüsselt, damit niemand im WLAN einfach mitlesen kann.

**Terminal**  
Das Terminal ist ein **Textfenster**, in das Du Befehle eintippst. Statt zu klicken, „sprichst“ Du mit dem Computer über kurze Kommandos (Befehle) wie `ssh ...` oder `ping ...`.

**Hostname**  
Der **Name** des Raspberry Pi im Netzwerk (z. B. `raspberrypi` oder `rpi0-gruppe1`). Damit kann man den Pi oft leichter ansprechen als mit Zahlen der IP-Adresse.

**IP‑Adresse**  
Die „Hausnummer“ eines Geräts im Netzwerk (z. B. `192.168.1.42`). Wenn der Hostname nicht funktioniert, klappt SSH oft über die IP (IP steht für Internet Protocol).

**`.local`**  
Eine praktische Endung, mit der Geräte im gleichen WLAN manchmal automatisch gefunden werden (z.B. `raspberrypi.local`). Das funktioniert nicht in jedem Netzwerk, aber oft zu Hause oder in einfachen WLANs.

**Port (meist 22)**  
Ein Port ist wie eine „Tür“ am Gerät. SSH nutzt normalerweise **Port 22**. In der Regel muss man den nicht extra angeben.

**„Headless“**  
Der Raspberry Pi läuft **ohne Bildschirm, Tastatur, Maus**. Deshalb brauchst Du SSH als „Fernbedienung“.

**Ping**  
Ein Test-Befehl, um zu prüfen, ob ein Gerät erreichbar ist (z.B. `ping raspberrypi.local`). Wenn Ping antwortet, ist das Gerät meist im Netzwerk da. (Ping ist die Abkürzung für *P*acket *I*nter-*N*etwork *G*roper)

**`arp -a`**  
Ein Befehl, der eine Liste von Geräten/Adressen zeigt, die Dein Computer im Netzwerk „gesehen“ hat. Damit kann man oft die IP des Pi finden.


***


## 4.1 🖥️ Terminal öffnen (PC/Laptop)

### Windows
- Öffne **PowerShell** oder **Windows Terminal**
  - Startmenü → „PowerShell“ eintippen

### macOS / Linux
- Öffne **Terminal**

***

## 4.2 🖧 Den Raspberry Pi im Netzwerk finden

Du hast 3 Möglichkeiten. Probiere sie am besten in dieser Reihenfolge:

### Möglichkeit A (einfach): Hostname verwenden

Wenn Du im Imager einen Hostnamen gesetzt hast, probiere:

```bash
ping rpi0-gruppe1.local
````

Oder beim Standard-Hostnamen:

```bash
ping raspberrypi.local
```

Wenn Du Antworten bekommst (z. B. „Antwort von …“), ist der Pi erreichbar ✅

<img src="..\images\SSH\01_ping_RPI.png" style="width:700px;" alt="Raspberry Pi im Netzwerk über Hostname finden">

> **Warum `.local`?** Das ist ein Netzwerk-„Namensdienst“ im lokalen WLAN (mDNS). Oft funktioniert das direkt.


***


### Möglichkeit B: IP-Adresse über `arp` finden

Wenn `.local` nicht klappt, suche die IP-Adresse.

#### Windows / macOS / Linux

```bash
arp -a
```

Suche in der Liste nach einem Eintrag, der neu aussieht oder „raspberry“ ähnlich ist.  

<img src="..\images\SSH\02_arp_a.png" style="width:700px;" alt="IP-Adresse über `arp` finden">

Oft hilft auch: Pi kurz vom Strom trennen, wieder einstecken und **direkt danach** nochmal `arp -a` ausführen.

> ✅ Tipp: Viele Schulrouter vergeben IPs wie `192.168.0.x` oder `192.168.1.x`.


***


### Möglichkeit C: Router-/WLAN-Übersicht

Wenn ihr zu Hause Zugriff auf euren Router habt:

*   In der Routeroberfläche nach „Mesh“ / „Geräte“ / „Client-Liste“ schauen
*   Nach (Host-)Namen wie `rpi0-gruppe1`, `raspberrypi` oder „Raspberry Pi“ suchen

<img src="..\images\SSH\03_Router_RPI.png" style="width:700px;" alt="IP-Adresse über den Router finden">


***


## 4.3 Per SSH verbinden

### Variante 1: Verbindung per Hostname

```bash
ssh BENUTZERNAME@HOSTNAME.local
```

Beispiel:

```bash
ssh pi@raspberrypi.local
```

oder:

```bash
ssh workshop@rpi0-gruppe1.local
```

### Variante 2: Verbindung per IP-Adresse

```bash
ssh BENUTZERNAME@IP_ADRESSE
```

Beispiel:

```bash
ssh pi@192.168.1.42
```


***


## 4.4 Erste Verbindung: Sicherheitsabfrage bestätigen

Beim ersten Verbinden kommt oft eine Meldung wie:

> „Are you sure you want to continue connecting (yes/no/\[fingerprint])?“


<img src="..\images\SSH\04_ssh_key.png" style="width:700px;" alt="Sicherheitsabfrage bei erster Verbindung">


Tippe:

```text
yes
```

Dann Passwort eingeben (beim Tippen siehst du **keine Zeichen** – das ist normal).

<img src="..\images\SSH\05_ssh_pwd.png" style="width:700px;" alt="Passworteingabe">


✅ Wenn du danach so etwas siehst, bist du drin:

```text
pi@raspberrypi:~ $
```

<img src="..\images\SSH\06_ssh_loggedin.png" style="width:700px;" alt="Passworteingabe">


***


## 4.5 ✅ Schnelltest: Bin ich wirklich auf dem Pi?

Gib folgende Befehle ein:

Aktuellen Rechnernamen anzeigen: 

```bash
hostname
```

Systeminformationen anzeigen (Kernel, Hardware/Architektur etc.)

```bash
uname -a
```

Netzwerk‑Infos anzeigen:

```bash
ip a
```

Wenn das sinnvolle Ausgaben liefert: perfekt ✅

<img src="..\images\SSH\07_ssh_check.png" style="width:700px;" alt="Schnelltests">


***


## 4.6 Weiteres WLAN hinzufügen

TODO

***

## 4.6 Pi herunterfahren / ausschalten

Um den Pi ordentlich herunterzufahren tippen wir im Terminal:

```bash
sudo poweroff
```

<img src="..\images\SSH\08_ssh_poweroff.png" style="width:700px;" alt="Raspberry Pi herunterfahren">

Wenn die grüne LED nicht mehr leuchtet sind alle Schreibvorgänge abgeschlossen und wir können das Netzteil aus der Steckdose ziehen.


***


# ➡️ Nächster Schritt

👏 Gute Arbeit — ab jetzt steuerst du deinen Pi wie ein echter Hacker 😉 !

🚀 Weiter geht’s mit Kapitel 5: [⚡**System aktualisieren (Updates)**](05_updates.md)  


***


# 🛠️ Troubleshooting (häufige Probleme)

## 🚧 Problem 1: „Connection timed out“ / „No route to host“

**Ursache:** Pi ist nicht erreichbar (WLAN fehlt, falsche IP, Pi bootet noch).

**Lösung:**

1.  Warte 1–2 Minuten und versuche erneut.
2.  Prüfe, ob PC und Pi im **gleichen WLAN** sind.
3.  Suche die IP nochmal mit `arp -a`.
4.  Pi einmal neu starten (Strom kurz abziehen - bis 10 Zählen - und wieder anschließen).

***

## 🚧 Problem 2: „Could not resolve hostname …“

**Ursache:** `.local` Namensauflösung klappt nicht oder Hostname falsch.

**Lösung:**

*   Nutze die IP-Adresse statt Hostname:

```bash
ssh BENUTZERNAME@192.168.x.y
```

*   Oder prüfe den Hostnamen (Imager-Einstellungen).

***

## 🚧 Problem 3: „Permission denied (publickey,password)“

**Ursache:** Benutzername/Passwort falsch oder SSH-Login nicht korrekt eingerichtet.

**Lösung:**

1.  Prüfe Benutzername & Passwort aus dem Imager.
2.  Achte auf Groß-/Kleinschreibung.
3.  Falls ihr einen anderen Benutzernamen gesetzt habt: nicht `pi` verwenden.
4.  Lasst den ersten Buchstaben vom Passwort weg ([Bug](https://github.com/raspberrypi/rpi-imager/issues/754) im RPI Imager)
5.  Notfalls: SD-Karte neu flashen und User/SSH sauber setzen.

***

## 🚧 Problem 4: „REMOTE HOST IDENTIFICATION HAS CHANGED!“

**Ursache:** Du hast die SD-Karte neu geflasht oder der Pi ist „ein anderer“ als zuvor, aber dein PC merkt sich noch den alten Schlüssel.

**Lösung:**  
Führe aus (Windows/macOS/Linux):

```bash
ssh-keygen -R raspberrypi.local
```

Oder mit IP:

```bash
ssh-keygen -R 192.168.1.42
```

Danach erneut verbinden:

```bash
ssh BENUTZERNAME@raspberrypi.local
```

***

## 🚧 Problem 5: Passwort-Eingabe „geht nicht“

**Info:** Beim Passwort tippen siehst du **keine Zeichen** (keine Sterne). Das ist normal.

**Lösung:** Einfach korrekt tippen und Enter drücken.







