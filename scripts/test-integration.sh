#!/bin/sh

echo "Starting integration test..."

# echo "Currently running containers:"
# docker ps -a
# docker inspect $(docker ps -q)

echo "Starting docker-compose configuration"
docker run --rm -v $PWD:$PWD -v /var/run/docker.sock:/var/run/docker.sock -w $PWD docker/compose -f docker-compose.yml up --abort-on-container-exit
echo "Removing docker-compose configuration resources"
docker run --rm -v $PWD:$PWD -v /var/run/docker.sock:/var/run/docker.sock -w $PWD docker/compose -f docker-compose.yml rm -fsv

echo "Integration test finished!"
