#!/bin/bash

CONTAINER_NAME='my-keycloak'
HOST_PORT='8080'

run() {
  docker run -p "${HOST_PORT}:8080" \
    -d \
    --name "$CONTAINER_NAME" \
    -e KC_BOOTSTRAP_ADMIN_USERNAME=admin \
    -e KC_BOOTSTRAP_ADMIN_PASSWORD=admin \
    quay.io/keycloak/keycloak:26.0.0 \
    start-dev
}

start() {
  docker start "$CONTAINER_NAME"
}

enter() {
  docker exec -it "$CONTAINER_NAME" /bin/bash
}

stop() {
  docker stop "$CONTAINER_NAME"
}

logs () {
  docker logs -f "$CONTAINER_NAME"
}

"$*"