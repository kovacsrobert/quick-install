#!/bin/bash

useradd -m -U -d /opt/tomcat -s /bin/false tomcat
wget --directory-prefix=/tmp/ http://www-us.apache.org/dist/tomcat/tomcat-8/v8.5.32/bin/apache-tomcat-8.5.32.zip
unzip /tmp/apache-tomcat-8.5.32.zip
mv /tmp/apache-tomcat-8.5.32/ /opt/tomcat/
ln -s /opt/tomcat/apache-tomcat-8.5.32 /opt/tomcat/latest
chown -R tomcat: /opt/tomcat
chmod +x /opt/tomcat/latest/bin/*.sh
cp ./tomcat/tomcat.service /etc/systemd/system/
systemctl daemon-reload
systemctl start tomcat
systemctl enable tomcat

printf '\n' >> ~/.bashrc
printf 'alias tomcat.start="startup.bat"' >> ~/.bashrc
printf 'alias tomcat.stop="shutdown.bat"' >> ~/.bashrc
printf '\n' >> ~/.bashrc
