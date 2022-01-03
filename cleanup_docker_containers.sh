#!/bin/bash
echo "Started"

echo "stopping docker containers"
docker stop $(docker ps -a -q)

echo "removing docker containers"
docker rm -f $(docker ps -a -q)

echo "list of all containers"
docker ps --all

echo "list of all volumes"
docker volume list

echo "Finished"