#!/bin/bash

# Uninstall old versions
apt remove docker docker-engine docker.io containerd runc

# Install packages to allow apt to use a repository over HTTPS
apt install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

# Add Docker’s official GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Install the latest version of Docker CE and containerd
apt update && apt install docker-ce docker-ce-cli containerd.io

# Add user to docker group
# usermod -aG docker pi

# printf '\n' >> ~/.bashrc
# printf 'DOCKER_HOST="https://hub.docker.com/"' >> ~/.bashrc
# printf '\n' >> ~/.bashrc