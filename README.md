Automated PowerShell Backup (Robocopy Wrapper)
Dieses Projekt ist eine vollautomatische und zuverlässige Lösung zur Sicherung wichtiger Dateien unter Windows. 
Es kombiniert die logische Flexibilität von PowerShell mit der bewährten Performance des Kommandozeilen-Tools Robocopy.

Zielsetzung:
Das Ziel war die Entwicklung eines Systems, das selbstständig versionierte Spiegel-Backups erstellt. 
Jede Ausführung erzeugt einen neuen, zeitgestempelten Ordner, um verschiedene Sicherungsstände vorzuhalten.

🛠️ Technische Highlights
1. Dynamische Pfadverwaltung
Das Skript nutzt Get-Date und Join-Path, um bei jedem Start einen einzigartigen Zielordner basierend auf dem aktuellen Datum und der Uhrzeit zu generieren.
2. Robocopy-Integration
Für den eigentlichen Kopierprozess wird robocopy.exe mit spezifischen Parametern angesteuert:
/MIR: Spiegelt das Quellverzeichnis (Mirroring).
/Z: Ermöglicht das Fortsetzen von Kopiervorgängen nach Verbindungsabbrüchen (Restartable Mode).
/LOG+: Schreibt alle Operationen in eine fortlaufende Log-Datei zur späteren Analyse.
4. Intelligente Erfolgsprüfung
Anstatt nur blind Befehle auszuführen, wertet das Skript den Exit Code von Robocopy aus. Da Robocopy eigene Rückgabewerte nutzt (0 und 1 für Erfolg), wird so sichergestellt, dass der Nutzer bei Fehlern sofort informiert wird.

🤖 Automatisierung
Das System ist für den komplett wartungsfreien Betrieb ausgelegt:
Windows Aufgabenplanung: Das Skript wird täglich zu einer festen Zeit automatisch gestartet.
Berechtigungen: Die Ausführung erfolgt mit "höchsten Privilegien", um auch geschützte Verzeichnisse sicher spiegeln zu können.
📑 Verwendete Komponenten
Betriebssystem: Windows 11.
Entwicklung: Windows PowerShell ISE.
Werkzeuge: Robocopy, Windows Aufgabenplanung.
💡 Learnings
Durch dieses Projekt konnte ich mein Verständnis für die Automatisierung von Systemaufgaben vertiefen. 
Ich habe gelernt, wie man verschiedene Windows-Bordmittel (PowerShell & Robocopy) effizient kombiniert, um eine robuste Infrastruktur-Lösung zu schaffen.
