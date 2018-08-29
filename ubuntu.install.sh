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
git config --global alias.co checkout
git config --global alias.ci commit
git config --global alias.st status
git config --global alias.br branch
git config --global alias.hist "log --pretty=format:'%h %ad | %s%d [%an]' --graph --date=short"
git config --global alias.type 'cat-file -t'
git config --global alias.dump 'cat-file -p'

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

# STS
wget --directory-prefix=/tmp/ http://download.springsource.com/release/STS/3.9.5.RELEASE/dist/e4.8/spring-tool-suite-3.9.5.RELEASE-e4.8.0-linux-gtk-x86_64.tar.gz
tar -xvf /tmp/spring-tool-suite-3.9.5.RELEASE-e4.8.0-linux-gtk-x86_64.tar.gz
mv /tmp/sts /opt/

# Add alias-es to .bashrc
printf '\n' >> ~/.bashrc
printf '\n' >> ~/.bashrc
printf 'PATH="$PATH:/opt/sublime_text"' >> ~/.bashrc
printf '\n' >> ~/.bashrc
printf 'PATH="$PATH:/opt/sts/sts-bundle/sts-3.9.5.RELEASE"' >> ~/.bashrc
printf '\n' >> ~/.bashrc
printf '\n' >> ~/.bashrc
printf 'DOCKER_HOST="https://hub.docker.com/"' >> ~/.bashrc
printf '\n' >> ~/.bashrc
printf '\n' >> ~/.bashrc
printf 'alias gs="git status "' >> ~/.bashrc
printf '\n' >> ~/.bashrc
printf 'alias ga="git add "' >> ~/.bashrc
printf '\n' >> ~/.bashrc
printf 'alias gb="git branch "' >> ~/.bashrc
printf '\n' >> ~/.bashrc
printf 'alias gc="git commit"' >> ~/.bashrc
printf '\n' >> ~/.bashrc
printf 'alias gd="git diff"' >> ~/.bashrc
printf '\n' >> ~/.bashrc
printf 'alias go="git checkout "' >> ~/.bashrc
printf '\n' >> ~/.bashrc
printf 'alias gk="gitk --all&"' >> ~/.bashrc
printf '\n' >> ~/.bashrc
printf 'alias gx="gitx --all"' >> ~/.bashrc
printf '\n' >> ~/.bashrc
printf 'alias got="git "' >> ~/.bashrc
printf '\n' >> ~/.bashrc
printf 'alias get="git "' >> ~/.bashrc
printf '\n' >> ~/.bashrc
printf '\n' >> ~/.bashrc
