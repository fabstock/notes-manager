#!/bin/bash



#entrypoint: ["./wait-for-service.sh", "job_service", "&&", "./run-dependent.sh"]


# Vérifier que le nom du service a été fourni
if [ -z "$1" ]; then
  echo "Usage: $0 <service_name>"
  exit 1
fi

SERVICE_NAME=$1

echo "Waiting for service $SERVICE_NAME to finish and stop running..."

# Boucle jusqu'à ce que le service ne soit plus en état 'running'
while [ "$(docker inspect -f '{{.State.Running}}' $SERVICE_NAME)" == "true" ]; do
  sleep 2
done

# Vérification de l'état final du service
FINAL_STATE=$(docker inspect -f '{{.State.Status}}' $SERVICE_NAME)

# Si le service est arrêté ('exited'), continuer
if [ "$FINAL_STATE" == "exited" ]; then
  echo "Service $SERVICE_NAME has stopped running."
  exit 0
else
  echo "Service $SERVICE_NAME did not stop as expected. Final state: $FINAL_STATE"
  exit 1
fi

