#!/bin/bash
echo "Started"

echo "stopping dosker containers"
docker stop $(docker ps -a -q)

echo "removing dosker containers"
docker rm -f $(docker ps -a -q)

echo "removing volumes"
docker volume rm $(docker volume ls -q)

echo "list of all containers"
docker ps --all

echo "list of all volumes"
docker volume list

echo "Finished"