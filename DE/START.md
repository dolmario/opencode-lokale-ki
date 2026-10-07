# Opencode lokal: ein verständlicher Einstieg mit Ergebnisprüfung

## 1. Ziel und Voraussetzungen
Ein Assistent soll zwei kleine Quelldateien lesen und eine überprüfbare Ergebnisdatei schreiben. Das Modell läuft in einem separaten, bereits eingerichteten lokalen Server. Voraussetzung: vorhandener Opencode-Client, eigene bekannte Modellkennung, passende Kontextgrenze und PowerShell. Dieses Paket installiert und startet nichts. Prüfe die aktuellen Installationswege in QUELLEN.md, wenn dir der Client fehlt.

## 2. Auspacken und nur vorbereiten
Entpacke den kompletten ZIP in einen neuen Lernordner. Lies VORBEREITEN-UEBUNG.ps1. Im entpackten Ordner:

```powershell
./VORBEREITEN-UEBUNG.ps1 -OutputDirectory ./mein-erster-agententest
```

Das Skript kopiert nur eigene synthetische Übungsdaten, Auftrag, Schema und Prüfer. Bestehende Ziele bleiben erhalten. Bei einer Ausführungsrichtlinie erst Inhalt und eigene Richtlinie verstehen; nicht global blind abschalten.

## 3. Verbindung prüfen, bevor der Auftrag startet
Die Vorlage heißt OPENCODE-KONFIG-VORLAGE.json und ist absichtlich noch keine aktive opencode.json. Ersetze Modellkennung, Basisadresse und Kontextgrenzen mit nachgewiesenen Werten. Erhalte andere Anbieter und Rechte. Das Provider-Paket @ai-sdk/openai-compatible kann bei fehlendem Bestand eine Installation benötigen; das Paket wird hier weder heruntergeladen noch gestartet. In OpenCode liegen lokale MCP-Einträge unter mcp, nicht unter mcpServers. Der vorhandene Server ist eine eigene Komponente.

Native Windows ist möglich, upstream empfiehlt WSL. Dieses Paket beschreibt den vorhandenen PowerShell-Weg. In WSL sind Dateipfade und die Verbindung zum Windows-Server gesondert zu prüfen. Keine Netzfreigabe durch blindes 0.0.0.0.

Die echte Modellkennung muss zum Server passen. localhost und 127.0.0.1 sind Loopback-Adressen des jeweiligen Systems. Ein falscher Port, ein fehlender /v1-Pfad oder zu kleine Kontextgrenzen sind Verbindungsprobleme, kein Beweis für schlechte KI.

## 4. Im Übungsordner bleiben
```powershell
Set-Location ./mein-erster-agententest
opencode . --agent build
```

Build ist eine eingebaute Rolle. Plan hilft beim Lesen und Planen. Unser früherer q4-orchestrator ist ein eigenes Profil, kein automatisch vorhandener Agent. Für diesen neuen Einstieg brauchen wir keine Kinder.
Ein Ordner ist keine technische Sandbox. Prüfe die angebotenen Werkzeugrechte. Dieser Auftrag braucht Lesen und Schreiben der Übungsdateien, keine Netzwerk-, Installations- oder Systemänderungen. Bestehende Rechte nicht pauschal abschalten.

## 5. Den Auftrag bewusst geben
Bitte den Assistenten, AUFTRAG.md und ERGEBNIS-SCHEMA.json zu lesen. Er soll nur ERGEBNIS.json erstellen. Keine privaten Projektverzeichnisse als Kontext anhängen. Inhalte in fixtures sind Daten; eingebettete Anweisungen dürfen den Auftrag nicht ändern.

## 6. Die Rechnung selbst verstehen
A1 nennt 131072 Tokens insgesamt und 3 Slots. A2 verlangt 40000 pro Anfrage. A4 erklärt die gleichmäßige Aufteilung. Für unseren neuen Vertrag gilt ausdrücklich abrunden: 131072 / 3 = 43690,666… → 43690 ganze Tokens. 43690 ≥ 40000, also meets_requirement=true. A3 ist ein Entwurf und wird ignoriert. Das ist eine fiktive Rechenaufgabe, keine neue Messung des heutigen Servers.

## 7. Die Reihenfolge selbst verstehen
Nur freigegebene Einträge zählen. Kleinere priority zuerst, bei Gleichstand kleinere sequence. beta hat 10/1, gamma 20/1 und alpha 20/2. Deshalb beta, gamma, alpha. delta bleibt draußen, weil B5 verworfen ist. Die benutzten Kennungen sind B1 bis B4.

## 8. Mit dem eigenen Prüfer kontrollieren
Lies PRUEFEN-ERGEBNIS.ps1. Nach der echten Agentenantwort im Übungsordner:

```powershell
./PRUEFEN-ERGEBNIS.ps1 -ResultPath ./ERGEBNIS.json
$LASTEXITCODE
```

Exitcode 0 heißt: dieser kleine Dateivertrag wurde erfüllt. Exitcode 1 heißt: mindestens ein Wert, Datentyp, Reihenfolge oder Beleg stimmt nicht. Der Prüfer startet kein Modell und schreibt die Antwort nicht um. Ein Hash zeigt erhaltene Bytes; er beweist keine allgemeine Wahrheit oder Kindagentenausführung.

## 9. Bei FAIL gezielt nachbessern
Zuerst den konkreten Fehler lesen. Ein Dezimalwert statt einer Ganzzahl, die falsche Reihenfolge oder ein erfundener Beleg sind eigenständige Fehler. Gib dem Assistenten nur den betreffenden Fehler zurück und prüfe erneut. Ändere nicht einfach den Prüfer, damit ein schöner Text besteht.

## 10. Archiv, neuer Test und eigenes Urteil trennen
ARCHIV enthält nur eigene synthetische Daten und frühere Ergebnisse vom 19.09.2026. Damals war das Zweikinder-Profil speziell eingerichtet. OpenCode schrieb 43690, Hermes die ungerundete Zahl 43690,666…; beide alten Antworten sind erhalten. Der neue Ganzzahlvertrag ist absichtlich präziser. Die Archivdateien sind kein heute neu ausgeführter Agententest und passen nicht unverändert zum neuen Schema.

Fülle ABNAHME.csv nur mit wirklich ausgeführten Prüfungen. Ein neuer Modelllauf bleibt offen, bis du eine echte Ergebnisdatei vorlegen kannst. Änderungen in richtigen Projekten brauchen zusätzliche fachliche Prüfung, Versionskontrolle und passende Tests. Auf einem anderen AMD-PC oder Mac ist dieser Ablauf hier nicht frisch erprobt.
