#!/bin/bash

# Upgrade/upgrade
apt-get update -y && apt-get dist-upgrade -y

# Package-install
apt-get install -y git
apt-get install -y vim
apt-get install -y ufw
apt-get install -y maven
apt-get install -y oracle-java8-jdk

# Ufw-config
ufw default deny incoming
ufw default allow outgoing
ufw allow ssh
sed -i.bak 's/ENABLED=no/ENABLED=yes/g' /etc/ufw/ufw.conf
chmod 0644 /etc/ufw/ufw.conf

# Git-config
git config --global push.default simple
git config --global user.name "Robert Kovacs"
git config --global user.email robert.kovacs.centacc@gmail.com

# Github-ssh-key
mkdir ~/.ssh
chmod 700 ~/.ssh
ssh-keygen -qq -t rsa -b 4096 -C "robert.kovacs.centacc@gmail.com" -P "" -f ~/.ssh/id_rsa
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa

# Install docker
curl -sSL https://get.docker.com | sh
