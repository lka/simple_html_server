#!/usr/bin/env pwsh
<#
.SYNOPSIS
    Startet den Simple HTML Server

.DESCRIPTION
    Dieses Skript startet den simple-server mit konfigurierbaren Optionen.
    Es prüft, ob der Befehl verfügbar ist und startet ihn mit den angegebenen Parametern.

.PARAMETER Port
    Die Port-Nummer für den Server (Standard: 8000)

.PARAMETER Directory
    Das zu servierende Verzeichnis (Standard: aktuelles Verzeichnis)

.EXAMPLE
    .\start-server.ps1
    Startet den Server auf Port 8000 im aktuellen Verzeichnis

.EXAMPLE
    .\start-server.ps1 -Port 3000
    Startet den Server auf Port 3000

.EXAMPLE
    .\start-server.ps1 -Port 8080 -Directory "C:\www"
    Startet den Server auf Port 8080 und serviert C:\www
#>

param(
    [int]$Port = 8000,
    [string]$Directory = "."
)

# Farben für die Ausgabe
$ErrorColor = "Red"
$SuccessColor = "Green"
$InfoColor = "Cyan"

Write-Host "`n-----------------------------" -ForegroundColor $InfoColor
Write-Host "  Simple HTML Server Starter" -ForegroundColor $InfoColor
Write-Host "-----------------------------`n" -ForegroundColor $InfoColor

# Prüfen, ob simple-server verfügbar ist
$simpleServerCmd = Get-Command .\venv\scripts\simple-server -ErrorAction SilentlyContinue

if ($simpleServerCmd) {
    Write-Host "[OK] simple-server gefunden: $($simpleServerCmd.Source)" -ForegroundColor $SuccessColor
    Write-Host "  Port:        $Port" -ForegroundColor $InfoColor
    Write-Host "  Verzeichnis: $Directory`n" -ForegroundColor $InfoColor

    # Server starten
    & $simpleServerCmd $Port $Directory
}
else {
    Write-Host "[FEHLER] simple-server wurde nicht gefunden!" -ForegroundColor $ErrorColor
    Write-Host "`nBitte installieren Sie das Paket zuerst:" -ForegroundColor $InfoColor
    Write-Host "  pip install -e .`n" -ForegroundColor $InfoColor

    # Alternative: Python-Skript direkt ausfuehren
    if (Test-Path "simple_server.py") {
        Write-Host "Alternativ: Starte mit Python-Skript..." -ForegroundColor $InfoColor
        python simple_server.py $Port $Directory
    }
    else {
        Write-Host "[FEHLER] simple_server.py nicht gefunden!" -ForegroundColor $ErrorColor
        exit 1
    }
}
Pause