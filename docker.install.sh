#!/bin/bash

curl -sSL https://get.docker.com | sh
usermod -aG docker pi

printf '\n' >> ~/.bashrc
printf 'DOCKER_HOST="https://hub.docker.com/"' >> ~/.bashrc
printf '\n' >> ~/.bashrc