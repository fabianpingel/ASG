# Raspberry Pi Imager – Betriebssystem auf einen Raspberry Pi Zero 2 W flashen

Diese Anleitung erklärt dir Schritt für Schritt, wie du mit dem **Raspberry Pi Imager** ein Betriebssystem (OS) auf eine **microSD-Karte** schreibst, damit dein **Raspberry Pi Zero 2 W** damit starten kann.

***

## ✅ Was du brauchst

- Raspberry Pi **Zero 2 W**
- **microSD-Karte** (mind. 8 GB, empfohlen: 16–32 GB)
- **Kartenleser** (USB microSD-Reader) oder SD-Slot am Laptop
- PC/Laptop mit installiertem **Raspberry Pi Imager**
- (Optional, aber empfohlen) WLAN-Zugangsdaten, wenn du direkt WLAN einrichten möchtest

> ⚠️ **Wichtig:** Beim Schreiben (Flashen) werden **alle Daten auf der ausgewählten microSD-Karte gelöscht**.

***

## Flashen des OS (Betriebssystem auf die SD-Karte schreiben)

### 0. microSD-Karte einstecken
Stecke die microSD-Karte in den Kartenleser und verbinde ihn mit deinem PC.  
Wenn Windows nach einem Datenträger fragt: **einfach schließen / abbrechen**.

<img src="../images/RPIImager/12_RPIImager_Win.png" style="width:700px;" alt="Windows Hinweis Datenträger einlegen">

> ✅ Tipp: Falls mehrere Laufwerke angeschlossen sind (USB-Stick, externe Festplatte), entferne sie kurz, damit du später **nicht aus Versehen** das falsche Laufwerk auswählst.

***

### 1. Raspberry-Pi-Modell auswählen
Öffne den **Raspberry Pi Imager**. Klicke auf **„Modell“** und wähle dein Gerät aus:

- **Raspberry Pi Zero 2 W**

<img src="../images/RPIImager/1_RPIImager_Modell.png" style="width:700px;" alt="Raspberry Pi Modell auswählen">

> 💡 Warum das wichtig ist: Der Imager kann je nach Modell passende Empfehlungen anzeigen.

***

### 2. Betriebssystem (OS) auswählen
Klicke im Raspberry Pi Imager auf **„Betriebssystem“**. Dort legst du fest, welches System später auf dem Raspberry Pi läuft.

#### 2.0 OS-Kategorie auswählen (falls nötig)
Falls du nicht sofort die passende Auswahl siehst, kannst du zunächst eine Kategorie öffnen – zum Beispiel **„Raspberry Pi OS (other)“** – um weitere Varianten angezeigt zu bekommen.

<img src="../images/RPIImager/2.0_RPIImager_OS.png" style="width:700px;" alt="Betriebssystem Kategorien">

#### 2.1 Betriebssystem auswählen (für unsere Versuche)
Für unsere Versuche reicht **Raspberry Pi OS Lite (64-bit)** völlig aus. Diese Version ist schlank, schnell installiert und läuft **ohne grafische Oberfläche** (Desktop).

- **Raspberry Pi OS Lite (64-bit)** → ohne Desktop

<img src="../images/RPIImager/2.1_RPIImager_OS.png" style="width:700px;" alt="Betriebssystem auswählen">

> 💡 **Hinweis:** Später könnt ihr natürlich auch ein anderes Betriebssystem ausprobieren, wenn ihr mehr Funktionen oder eine grafische Oberfläche nutzen möchtet.

***

### 3. Speicher (microSD-Karte) auswählen
Klicke auf **„Speicher“** und wähle die **richtige microSD-Karte** aus.

<img src="../images/RPIImager/3_RPIImager_SD.png" style="width:700px;" alt="Speichermedium auswählen">

> ⚠️ **Achtung:** Wähle wirklich nur die microSD-Karte aus – sonst könnten Daten auf einem anderen Laufwerk gelöscht werden.  
> ✅ Tipp: Oft erkennt man die SD-Karte an der **Größe** (z. B. 32 GB).

***

## (Optional, aber empfohlen) Anpassungen / Einstellungen setzen

Im Imager kannst du vor dem Schreiben wichtige Einstellungen speichern (z. B. WLAN/SSH).  
Das ist sehr hilfreich, wenn dein Raspberry Pi später **ohne Monitor/Tastatur** genutzt wird („headless“).

> ✅ Empfehlung für den Workshop: **Hostname + Benutzer + WLAN + SSH** setzen.

***

### 4. Hostname setzen
Der Hostname ist der Name deines Raspberry Pi im Netzwerk (z. B. `rpi0-<NAME>`).

<img src="../images/RPIImager/4_RPIImager_Hostname.png" style="width:700px;" alt="Hostname einstellen">

> 💡 Tipp: Nutze einen eindeutigen Namen (z. B. Gruppe1, Tisch2, deine Initialen), damit man den Pi später leichter findet.

***

### 5. Lokalisierung einstellen
Wähle Land/Zeitzone/Tastaturlayout passend (z. B. **Germany**, **Europe/Berlin**, **de**).

<img src="../images/RPIImager/5_RPIImager_loc.png" style="width:700px;" alt="Lokalisierung einstellen">

> ✅ Dadurch stimmen Uhrzeit und Tastaturbelegung (z. B. Y/Z) im Terminal.

***

### 6. Benutzername und Passwort festlegen
Lege einen Benutzernamen und ein Passwort fest.  
**Merke dir beides!** Du brauchst es später zum Login.

<img src="../images/RPIImager/6_RPIImager_user.png" style="width:700px;" alt="Benutzerkonto einstellen">

> 🔐 Sicherheit: Nutze ein Passwort, das du dir merken kannst – und teile es nur mit deiner Lehrkraft, wenn nötig.

***

### 7. WLAN einrichten
Trage SSID (WLAN-Name) und Passwort ein, damit sich der Raspberry Pi beim ersten Start verbinden kann.

<img src="../images/RPIImager/7_RPIImager_WLAN.png" style="width:700px;" alt="WLAN einstellen">

> ⚠️ Achte auf Groß-/Kleinschreibung beim Passwort.  
> ✅ Tipp: Der Pi Zero 2 W nutzt häufig **2.4 GHz WLAN** – falls es Probleme gibt, prüft das im Schulnetz.

***

### 8. SSH aktivieren (für Fernzugriff)
Aktiviere **SSH**, wenn du später per Terminal von deinem PC aus auf den Raspberry Pi zugreifen willst.

<img src="../images/RPIImager/8_RPIImager_SSH.png" style="width:700px;" alt="SSH aktivieren">

#### Was ist SSH?
**SSH** steht für **Secure Shell**.  
Damit kannst du dich von deinem PC aus per *Terminal* mit dem Raspberry Pi verbinden – sicher und verschlüsselt. Du steuerst den Raspberry Pi dann über Textbefehle, ohne dass ein Bildschirm oder eine Maus am Pi angeschlossen sein müssen.

#### Warum brauchen wir SSH?
Bei unseren Versuchen ist der Raspberry Pi „headless“ unterwegs – also ohne Monitor, Tastatur und Maus. SSH ist dann wie eine Fernbedienung:
✅ Du kannst dich einloggen, obwohl am Pi kein Bildschirm hängt  
✅ Du kannst Programme starten, Dateien kopieren und Einstellungen ändern  
✅ Du kannst Fehler schnell finden (z. B. Netzwerk prüfen, Updates machen)  
✅ Du kannst den Pi im Netzwerk erreichen (z. B. im Klassenraum-WLAN)

> ✅ Empfehlung: Nutzt „Passwort-Authentifizierung“ (einfacher für den Einstieg).  
> (Später kann man auch Schlüssel benutzen – das ist aber fortgeschrittener.)

***

### 9. Raspberry Pi Connect (optional)
Dieses Feature ist optional und kann deaktiviert bleiben.

<img src="../images/RPIImager/9_RPIImager_conn.png" style="width:700px;" alt="Raspberry Pi Connect Einstellungen">

***

## Schreiben (Flashen) starten

### 10. Zusammenfassung prüfen
Kontrolliere, ob Modell, OS und Speicher korrekt sind.

<img src="../images/RPIImager/10_RPIImager_summary.png" style="width:700px;" alt="Zusammenfassung vor dem Schreiben">

Klicke dann auf **„Schreiben“**.

> ✅ Checkliste vor dem Klick:
> - Modell: **Zero 2 W**
> - OS: **Raspberry Pi OS Lite (64-bit)**
> - Speicher: **deine microSD-Karte** (richtige Größe)

***

### 11. Warnhinweis bestätigen und Schreiben
Der Imager warnt, dass alle Daten gelöscht werden.  
Wenn du sicher bist: **„Ich verstehe. Lösche und schreibe“**.

<img src="../images/RPIImager/11_RPIImager_write.png" style="width:700px;" alt="Löschwarnung bestätigen">

> ⚠️ Bestätige nur, wenn du wirklich die **richtige SD-Karte** ausgewählt hast.

#### ⚠️ Windows-Meldung „Datenträger einlegen“ (kann ignoriert werden)
Manchmal erscheint während des Schreibvorgangs in Windows ein Fenster wie „Datenträger einlegen“.  
Das passiert, weil die SD‑Karte beim Flashen kurz neu erkannt wird.

✅ **Klicke einfach auf „Abbrechen“** und lass den Raspberry Pi Imager weiterarbeiten.  
❗ **Wichtig:** SD‑Karte nicht abziehen und nichts formatieren!

<img src="../images/RPIImager/12_RPIImager_Win.png" style="width:700px;" alt="Windows Hinweis: Datenträger einlegen (ignorieren und Abbrechen klicken)">

***

### 12. Schreibvorgang abwarten
Währenddessen **nichts abziehen**. Der Imager schreibt und prüft anschließend das Image.

<img src="../images/RPIImager/13_RPIImager_progress.png" style="width:700px;" alt="Schreibfortschritt">

> ⏳ Das kann je nach SD‑Karte ein paar Minuten dauern.  
> (Langsame oder sehr alte SD‑Karten brauchen deutlich länger.)

***

## ✅ Fertig! Nächste Schritte

1. Wenn „Fertig“ angezeigt wird: **SD-Karte sicher entfernen** (Auswerfen).
2. microSD in den **Raspberry Pi Zero / Zero 2 W** stecken.
3. Raspberry Pi mit Strom verbinden (USB‑Power).
4. Beim ersten Start kann es ein paar Minuten dauern (Erst‑Setup).

> ✅ Danach geht’s weiter mit dem Kapitel **SSH-Setup**, um den Pi ohne Monitor zu steuern.

***

## Troubleshooting (wenn etwas nicht klappt)

- **SD-Karte wird nicht angezeigt:** Kartenleser neu einstecken oder anderen USB‑Port testen.
- **Schreiben bricht ab:** Andere SD‑Karte verwenden (manche sind defekt oder sehr langsam).
- **Raspberry Pi startet nicht:**
  - Prüfe, ob wirklich **Zero 2 W** gewählt wurde.
  - Flash-Vorgang wiederholen (Imager erneut ausführen).
  - Netzteil prüfen (5V/2.5A, Micro‑USB).
- **Kein WLAN:**
  - SSID/Passwort prüfen (Groß-/Kleinschreibung!)
  - Prüfen, ob **2.4 GHz** verfügbar ist.
  - Optional: später WLAN direkt auf dem Pi konfigurieren (kommt im SSH‑Kapitel).

***

Viel Erfolg! 🚀