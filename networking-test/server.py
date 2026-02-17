from http.server import HTTPServer, BaseHTTPRequestHandler
import logging

HOST = "0.0.0.0"
PORT = 8000

logging.basicConfig(
    filename="server.log",
    level=logging.INFO,
    format="%(asctime)s - %(message)s"
)

class SimpleHandler(BaseHTTPRequestHandler):

    def do_GET(self):
        logging.info(f"GET {self.path} from {self.client_address[0]}")
        self.send_response(200)
        self.send_header("Content-Type", "text/plain")
        self.end_headers()
        self.wfile.write(b"Hello from WSL Python server\n")

    def do_POST(self):
        content_length = int(self.headers.get("Content-Length", 0))
        body = self.rfile.read(content_length)
        logging.info(
            f"POST {self.path} from {self.client_address[0]} body={body.decode(errors='ignore')}"
        )
        self.send_response(200)
        self.end_headers()
        self.wfile.write(b"POST received\n")

    def log_message(self, format, *args):
        return  # disabilita log standard a stdout


if __name__ == "__main__":
    server = HTTPServer((HOST, PORT), SimpleHandler)
    print(f"Server running on http://{HOST}:{PORT}")
    server.serve_forever()
