#!/bin/bash

apt-get install -y mc unzip wget p7zip-full p7zip-rar virtualbox

# chrome
wget -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - 
sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
apt update && apt install -y google-chrome-stable

# git
apt-get install -y git vim
git config --global push.default simple
git config --global user.name "Robert Kovacs"
git config --global user.email robert.kovacs.centacc@gmail.com
git config --global core.editor vim
git config --global alias.co checkout
git config --global alias.ci commit
git config --global alias.st status
git config --global alias.br branch
git config --global alias.hist "log --pretty=format:'%h %ad | %s%d [%an]' --graph --date=short"
git config --global alias.type 'cat-file -t'
git config --global alias.dump 'cat-file -p'

# java 8
add-apt-repository -y ppa:webupd8team/java
apt-get update
echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections
echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections
apt-get install -y maven oracle-java8-jdk oracle-java8-installer oracle-java8-set-default

# sublime 3
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
apt-get update && apt-get install -y apt-transport-https sublime-text

# uwf
apt-get install -y ufw
ufw default deny incoming
ufw default allow outgoing
ufw allow ssh
sed -i.bak 's/ENABLED=no/ENABLED=yes/g' /etc/ufw/ufw.conf
chmod 0644 /etc/ufw/ufw.conf

# ubuntu
gsettings set org.gnome.nautilus.preferences default-folder-viewer "list-view"
gsettings set org.gnome.nautilus.list-view default-zoom-level "small"
# gsettings set org.gnome.nautilus.preferences show-hidden-files true
# gsettings set org.gnome.nautilus.list-view default-visible-columns ['name', 'type', 'size', 'date_modified']

# remove shortcuts for IDEA navigation
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-left "[]"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-right "[]"
# restore shortcuts from IDEA navigation
#gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-left "['<Control><Alt>Left']"
#gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-right "['<Control><Alt>Right']"
