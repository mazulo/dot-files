#!/usr/bin/env zsh

# Check for docker compose file inside a misc folder
docker_compose_file=$(dirname "$PWD")/misc/docker-compose.yml

if [ ! -f "$docker_compose_file" ]; then
    export COMPOSE_FILE="misc/docker-compose.yml"
else
    export COMPOSE_FILE="docker-compose.yml"
fi
