#!/bin/bash

wget --directory-prefix=/tmp/ http://download.springsource.com/release/STS/3.9.5.RELEASE/dist/e4.8/spring-tool-suite-3.9.5.RELEASE-e4.8.0-linux-gtk-x86_64.tar.gz
tar -xvf /tmp/spring-tool-suite-3.9.5.RELEASE-e4.8.0-linux-gtk-x86_64.tar.gz
mv /tmp/sts /opt/
ln -s /opt/sts/sts-bundle/sts-3.9.5.RELEASE /opt/sts/sts-bundle/sts

printf '\n' >> ~/.bashrc
printf 'PATH="$PATH:/opt/sts/sts-bundle/sts"' >> ~/.bashrc
printf '\n' >> ~/.bashrc