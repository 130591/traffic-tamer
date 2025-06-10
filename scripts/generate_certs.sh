#!/bin/bash

CERT_DIR="./nginx/certs"

echo "Checking/Creating certificates directory: $CERT_DIR"
mkdir -p "$CERT_DIR"

if [ -f "$CERT_DIR/example.com.crt" ] && [ -f "$CERT_DIR/example.com.key" ]; then
	echo "Certificates already exist in $CERT_DIR. Skipping generation."
	echo "To generate new certificates, remove existing ones first (rm $CERT_DIR/*)."
	exit 0
fi

echo "Generating new certificate and private key..."
openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
	-keyout "$CERT_DIR/example.com.key" \
	-out "$CERT_DIR/example.com.crt" \
	-subj "/C=BR/ST=RJ/L=Rio de Janeiro/O=TrafficTamer/OU=Dev/CN=localhost" \
	-addext "subjectAltName = DNS:localhost,IP:127.0.0.1"

if [ $? -eq 0 ]; then
	echo "Certificates generated successfully in $CERT_DIR"
else
	echo "ERROR: Failed to generate SSL certificates."
	exit 1
fi