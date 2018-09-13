#!/bin/bash

add-apt-repository -y ppa:webupd8team/java

apt-get update

echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections
echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections

apt-get install -y maven oracle-java8-jdk oracle-java8-installer oracle-java8-set-default
