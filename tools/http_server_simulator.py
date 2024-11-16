import json
from http.server import BaseHTTPRequestHandler, HTTPServer

class SimpleHTTPRequestHandler(BaseHTTPRequestHandler):
    def do_GET(self):
        # Créer une réponse JSON simple
        response = {
    "power": 123,
    "reactive": 56,
    "voltage": 230,
    "is_valid": True,
    "total": 1526,
    "total_returned": 2635
}
        response_text = json.dumps(response)
        response_bytes = response_text.encode()
        # Définir le type de réponse comme JSON
        self.send_response(200)
        self.send_header('Content-type', 'application/json')
        self.send_header('Content-Length', str(len(response_bytes)))
        self.end_headers()
        

        
        # Envoyer la réponse JSON
        self.wfile.write(response_bytes)

def run(server_class=HTTPServer, handler_class=SimpleHTTPRequestHandler, ip='0.0.0.0', port=8000):
    server_address = (ip, port)
    httpd = server_class(server_address, handler_class)
    print(f'Starting httpd server on {ip}:{port}')
    httpd.serve_forever()

if __name__ == '__main__':
    run()
