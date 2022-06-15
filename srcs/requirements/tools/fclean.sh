#!/bin/bash
sudo docker ps -as | awk '{print $1}' | xargs docker stop;
docker ps -as | awk '{print $1}' | xargs docker rm;
docker image ls | awk '{print $3}' | xargs docker stop;
docker volume ls | awk '{print $2}' | xargs docker volume rm;
