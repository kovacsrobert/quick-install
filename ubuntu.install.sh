#!/bin/bash

# Keys
wget -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - 
sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'

# Repos
add-apt-repository -y ppa:webupd8team/java

# Upgrade/upgrade
apt-get update -y && apt-get dist-upgrade -y

# Java8-licence
echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections
echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections

# Package-install
apt-get install -y unzip wget git vim ufw google-chrome-stable maven dkms build-essential unity-tweak-tool virtualbox oracle-java8-jdk oracle-java8-installer oracle-java8-set-default

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

# Ufw-config
ufw default deny incoming
ufw default allow outgoing
ufw allow ssh
sed -i.bak 's/ENABLED=no/ENABLED=yes/g' /etc/ufw/ufw.conf
chmod 0644 /etc/ufw/ufw.conf

# Tomcat
useradd -m -U -d /opt/tomcat -s /bin/false tomcat
wget --directory-prefix=/tmp/ http://www-us.apache.org/dist/tomcat/tomcat-8/v8.5.32/bin/apache-tomcat-8.5.32.zip
unzip /tmp/apache-tomcat-8.5.32.zip
mv /tmp/apache-tomcat-8.5.32/ /opt/tomcat/
ln -s /opt/tomcat/apache-tomcat-8.5.32 /opt/tomcat/latest
chown -R tomcat: /opt/tomcat
chmod +x /opt/tomcat/latest/bin/*.sh
cp ./tomcat.service /etc/systemd/system/
systemctl daemon-reload
systemctl start tomcat
systemctl enable tomcat
