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

## Anforderungen

- Python 3.x (keine zusätzlichen Pakete nötig)
