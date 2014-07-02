#!/bin/bash -eux

# Install Java
sudo apt-get install -y openjdk-7-jdk
echo -e "export JAVA_HOME=/usr/lib/jvm/java-7-openjdk/" | tee ~/.bash_profile ~/.bashrc
. ~/.bash_profile

# Install EC2 API Tools
sudo apt-get install -y ec2-api-tools
