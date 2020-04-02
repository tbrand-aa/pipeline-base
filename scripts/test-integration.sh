#!/bin/sh

echo "Starting integration test..."

echo "Currently running containers:"
docker ps -a
docker inspect $(docker ps -q)

# echo "Starting docker-compose configuration"
# docker run --rm -v /var/run/docker.sock:/var/run/docker.sock -w $PWD docker/compose -f /docker-compose.yml up --abort-on-container-exit

echo "Integration test finished!"
