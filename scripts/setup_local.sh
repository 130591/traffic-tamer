#!/bin/bash

echo "Starting Traffic Tamer local environment setup..."
echo "--------------------------------------------------------"

echo "Generating self-signed SSL certificates for HTTPS..."
chmod +x ./scripts/generate_certs.sh
./scripts/generate_certs.sh

if [ $? -ne 0 ]; then
	echo "Error: Failed to generate SSL certificates. Exiting."
	exit 1
fi
echo "SSL certificates generated successfully."
echo "--------------------------------------------------------"

echo "Building and starting Docker containers..."
docker-compose up --build -d

if [ $? -ne 0 ]; then
	echo "Error: Failed to start Docker containers. Check logs."
	exit 1
fi
echo "Docker containers started in background."
echo "--------------------------------------------------------"

echo "Traffic Tamer environment configured and running!"
echo "You can access NGINX at: http://localhost or https://localhost"
echo "To check logs: docker-compose logs -f"
echo "To stop the environment: ./scripts/cleanup.sh"