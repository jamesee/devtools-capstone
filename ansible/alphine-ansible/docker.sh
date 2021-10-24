#!/bin/bash

docker run --entrypoint entrypoint.sh -it --rm --volume ${PWD}:/ansible -w /ansible  ansible-in-containers