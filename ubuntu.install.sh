#!/bin/bash

apt-get install -y mc unzip wget p7zip-full p7zip-rar virtualbox

bash ./chrome.install.sh
bash ./git.install.sh
bash ./java.8.install.sh
bash ./sts.install.sh
bash ./sublime.install.sh
bash ./tomcat.install.sh
bash ./uwf.install.sh

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