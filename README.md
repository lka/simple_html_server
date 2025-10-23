# HTML Server

Ein einfacher HTTP-Server in Python zum Servieren von HTML-Dateien.

## Features

- ✨ Einfach zu verwenden
- 🚀 Schneller Start
- 🔧 Konfigurierbare Port-Nummer
- 📁 Beliebiges Verzeichnis servierbar
- 🌐 CORS-Header für lokale Entwicklung

## Verwendung

### Einfacher Start (Port 8000)
```bash
python simple_server.py
```

### Mit eigenem Port
```bash
python simple_server.py 3000
```

### Bestimmtes Verzeichnis servieren
```bash
python simple_server.py 8000 ./mein-verzeichnis
```

## Zugriff

Nach dem Start ist der Server erreichbar unter:
- http://localhost:8000 (oder dem gewählten Port)

## Beenden

Server mit `Strg+C` beenden.

## Beispiel

1. Server starten:
   ```bash
   python simple_server.py
   ```

2. Browser öffnen und zu `http://localhost:8000` navigieren

3. Deine HTML-Dateien werden angezeigt

## Installation

### Option 1: Direkte Verwendung
Einfach die `simple_server.py` ausführen (siehe Verwendung unten).

### Option 2: Als Paket installieren
Das Projekt kann als Python-Paket installiert werden:

```bash
# Installation im Development-Modus
pip install -e .

# Oder reguläre Installation
pip install .
```

Nach der Installation ist der Befehl `simple-server` global verfügbar:

```bash
simple-server              # Startet auf Port 8000
simple-server 3000         # Startet auf Port 3000
simple-server 8000 ./docs  # Serviert ./docs auf Port 8000
```

## Anforderungen

- Python 3.7+ (keine zusätzlichen Pakete nötig)
