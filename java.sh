#!/bin/bash -eux

# # Install Java 7
# sudo apt-get install -y openjdk-7-jdk
# echo -e "export JAVA_HOME=/usr/lib/jvm/java-7-openjdk/" | tee ~/.bash_profile ~/.bashrc
# . ~/.bash_profile

# Install Java 8
sudo apt-get install -y software-properties-common
sudo add-apt-repository -y ppa:webupd8team/java
sudo apt-get update
echo debconf shared/accepted-oracle-license-v1-1 select true | sudo debconf-set-selections
echo debconf shared/accepted-oracle-license-v1-1 seen true | sudo debconf-set-selections
sudo apt-get install -y oracle-java8-installer
# Set default java
sudo apt-get install oracle-java8-set-default

