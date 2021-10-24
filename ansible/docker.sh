#!/bin/bash

docker run --rm \
--volume ~/.ssh:/root/.ssh \
--volume "$(pwd)":/ansible \
-w /ansible \
james1122/ansible-in-containers docker.yml inventory