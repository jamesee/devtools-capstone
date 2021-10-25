#!/bin/bash

docker run --entrypoint bash -it --rm --volume ${PWD}:/ansible -w /ansible  james1122/ansible-in-containers

docker run -it --rm --volume ~/.ssh:/root/.ssh --volume ${PWD}:/ansible -w /ansible james1122/ansible-in-containers 