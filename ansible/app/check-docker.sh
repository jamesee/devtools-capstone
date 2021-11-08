#!/bin/bash

if [ ! "$(docker ps -q -f name=<name>)" ]; then
    if [ "$(docker ps -aq -f status=exited -f name=<name>)" ]; then
        # cleanup
        docker rm <name>
    fi
    # run your container
    docker run -d --name <name> my-docker-image
fi