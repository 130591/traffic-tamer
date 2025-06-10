from flask import Flask, request
import os

app = Flask(__name__)

@app.route('/')
def hello():
  hostname = os.uname().nodename
  return f"Hello from **Service 2** (Port 8082)! Host: {hostname}\n"

@app.route('/health')
def health():
  return "OK", 200

if __name__ == '__main__':
  app.run(host='0.0.0.0', port=8082)