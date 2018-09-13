#!/bin/bash

wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list

apt-get update

apt-get install -y apt-transport-https sublime-text

printf '\n' >> ~/.bashrc
printf 'PATH="$PATH:/opt/sublime_text"' >> ~/.bashrc
printf '\n' >> ~/.bashrc