#!/bin/sh

echo "Listing all environment variables:"
printenv

echo "Starting integration test..."

# echo "Currently running containers:"
# docker ps -a
# docker inspect $(docker ps -q)

echo "Starting docker-compose configuration"
docker run --rm -v $PWD/work:$PWD/work -v /var/run/docker.sock:/var/run/docker.sock -w $PWD/work docker/compose -f docker-compose.yml up --abort-on-container-exit --exit-code-from node
echo "Removing docker-compose configuration resources"
docker run --rm -v $PWD/work:$PWD/work -v /var/run/docker.sock:/var/run/docker.sock -w $PWD/work docker/compose -f docker-compose.yml rm -fsv

echo "Integration test finished!"
