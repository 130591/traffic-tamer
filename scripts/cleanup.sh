#!/bin/bash

echo "Stopping and removing Traffic Tamer Docker containers..."
echo "--------------------------------------------------------"

docker-compose down -v

if [ $? -eq 0 ]; then
	echo "Docker environment cleaned up successfully."
else
	echo "Error: Failed to stop/remove Docker environment. Check if Docker is running."
	exit 1
fi
echo "--------------------------------------------------------"
echo "You can manually remove self-signed SSL certificates if desired:"
echo "rm -rf ./nginx/certs/"