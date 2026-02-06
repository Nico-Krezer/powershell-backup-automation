# --- Backup Script (Robocopy Version) ---

# 1. Variablen definieren
$Quelle = "C:\Backup-Quelle"
$Ziel = "C:\Backup-Ziel"
$LogDatei = "C:\Backup-Ziel\robocopy_log.txt" # Eigene Log-Datei für Robocopy

# 2. Zeitstempel für den Backup-Ordner erstellen
$Timestamp = Get-Date -Format "yyyy-MM-dd_HH-mm"
$ZielOrdner = Join-Path -Path $Ziel -ChildPath "Backup_$Timestamp"

# 3. Bildschirmausgabe
Write-Host "Starte Robocopy-Backup..."
Write-Host "Quelle: $Quelle"
Write-Host "Ziel:   $ZielOrdner"

# 4. Robocopy-Befehl ausführen
# Wir rufen das externe Programm robocopy.exe mit unseren Variablen und Parametern auf.
robocopy.exe $Quelle $ZielOrdner /MIR /Z /R:1 /W:1 /TEE /LOG+:$LogDatei

# 5. Erfolgsprüfung (Robocopy-spezifisch)
# Robocopy gibt einen Code zurück. 0 oder 1 bedeuten Erfolg. Größer als 1 ist ein Fehler.
if ($LASTEXITCODE -le 1) {
    Write-Host "Robocopy-Backup erfolgreich abgeschlossen!"
    Add-Content -Path $LogDatei -Value "`n----- Robocopy erfolgreich beendet am $(Get-Date) -----`n"
}
else {
    Write-Host "FEHLER bei Robocopy! Details siehe Log-Datei."
    Add-Content -Path $LogDatei -Value "`n----- Robocopy mit FEHLER beendet am $(Get-Date) -----`n"
}
