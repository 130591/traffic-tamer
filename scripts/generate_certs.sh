#!/bin/bash
CERT_DIR="./nginx/certs"
mkdir -p "$CERT_DIR"
openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout "$CERT_DIR/example.com.key" \
    -out "$CERT_DIR/example.com.crt" \
    -subj "/C=BR/ST=RJ/L=Rio de Janeiro/O=TrafficTamer/OU=Dev/CN=localhost"
echo "Certificates generated in $CERT_DIR"