#!/bin/bash

echo "Starting Load Balancing tests..."
echo "-------------------------------------"

NGINX_URL="http://localhost"
NUM_REQUESTS=15

echo "Making $NUM_REQUESTS requests to $NGINX_URL..."
echo "Observing each microservice's response:"

declare -A service_hits

for i in $(seq 1 $NUM_REQUESTS); do
	RESPONSE=$(curl -s $NGINX_URL)
	SERVICE_IDENTIFIER=$(echo "$RESPONSE" | grep -oE "Service [0-9]+" | head -1)
	HOST_IDENTIFIER=$(echo "$RESPONSE" | grep -oE "Host: [a-zA-Z0-9.-]+" | head -1)

	echo "Request $i: $SERVICE_IDENTIFIER ($HOST_IDENTIFIER)"

	if [ -n "$SERVICE_IDENTIFIER" ]; then
		service_hits["$SERVICE_IDENTIFIER"]=$((service_hits["$SERVICE_IDENTIFIER"] + 1))
	fi
done

echo ""
echo "-------------------------------------"
echo "Request Distribution Summary:"
echo "-------------------------------------"
for service in "${!service_hits[@]}"; do
	echo "$service: ${service_hits[$service]} hits"
done
echo "-------------------------------------"

echo "Tip: Change the load balancing algorithm in nginx/conf/upstream_backends.conf and re-execute 'docker-compose up -d --build' to test different distributions."
echo "To test 'least_conn', try stopping a service (docker stop <container_id>) and re-run the test."