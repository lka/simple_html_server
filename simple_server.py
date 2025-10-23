#!/usr/bin/env python3
"""
Einfacher HTML Server
Startet einen HTTP-Server, der HTML-Dateien aus dem aktuellen Verzeichnis serviert.
"""

from http.server import HTTPServer, SimpleHTTPRequestHandler
import sys
import os


class CustomHTMLHandler(SimpleHTTPRequestHandler):
    """Erweiterter Handler mit besseren Fehlermeldungen"""

    def log_message(self, format, *args):
        """Überschreibt die Standard-Log-Ausgabe für bessere Lesbarkeit"""
        print(f"[{self.log_date_time_string()}] {format % args}")

    def end_headers(self):
        """Fügt CORS-Header hinzu für lokale Entwicklung"""
        self.send_header("Access-Control-Allow-Origin", "*")
        super().end_headers()


def run_server(port=8000, directory="."):
    """
    Startet den HTTP-Server

    Args:
        port: Port-Nummer (Standard: 8000)
        directory: Verzeichnis zum Servieren (Standard: aktuelles Verzeichnis)
    """
    # Wechsel ins gewünschte Verzeichnis
    os.chdir(directory)

    # Server-Adresse konfigurieren
    server_address = ("", port)
    httpd = HTTPServer(server_address, CustomHTMLHandler)

    print(f"\n{'=' * 60}")
    print("  HTML Server gestartet")
    print(f"{'=' * 60}")
    print(f"  Verzeichnis: {os.getcwd()}")
    print(f"  URL:         http://localhost:{port}")
    print("  Zum Beenden: Strg+C drücken")
    print(f"{'=' * 60}\n")

    try:
        httpd.serve_forever()
    except KeyboardInterrupt:
        print("\n\nServer wird beendet...")
        httpd.shutdown()
        print("Server beendet.")


def main():
    """Haupteinstiegspunkt für das Kommandozeilen-Tool"""
    # Port aus Kommandozeilen-Argumenten oder Standard verwenden
    port = int(sys.argv[1]) if len(sys.argv) > 1 else 8000

    # Optionales Verzeichnis aus Argumenten
    directory = sys.argv[2] if len(sys.argv) > 2 else "."

    run_server(port, directory)


if __name__ == "__main__":
    main()
