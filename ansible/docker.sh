#!/bin/bash

docker run --rm \
--volume ~/.ssh:/root/.ssh \
--volume "$(pwd)":/ansible \
-w /ansible \
ansible-in-containers docker.yml inventory