#!/bin/bash
# if [ "$(docker ps -aq -f status=exited -f name=$1*)" ]; then
#     docker rm -f $(docker ps -q -f name="$1*") \
# fi

if [ "$(docker ps -q -f name={{ default_container_name }}*" ]; then 
    echo "$(docker ps -q -f name={{ default_container_name }}*"
    docker rm -f $(docker ps -q -f name="{{ default_container_name }}*") 
fi