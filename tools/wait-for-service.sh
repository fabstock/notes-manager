#!/bin/bash

# entrypoint: ["./wait-for-service.sh", "job_service", "&&", "./run-dependent.sh"]




SERVICE_NAME=$1

echo "Waiting for service $SERVICE_NAME to stop..."

while docker inspect -f '{{.State.Running}}' $SERVICE_NAME | grep true > /dev/null; do
  sleep 2
done

echo "Service $SERVICE_NAME has stopped. Continuing..."

