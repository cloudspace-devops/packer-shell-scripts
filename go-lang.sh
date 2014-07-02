#!/bin/bash -eux

# Install Go
sudo apt-get install -y golang

# Setup Go Path
echo -e "export GOPATH=/home/vagrant/go\nexport PATH=$PATH:/home/vagrant/go/bin" | tee ~/.bash_profile ~/.bashrc
. ~/.bash_profile

# Create workspace directories
mkdir -p $GOPATH/bin
mkdir -p $GOPATH/pkg
mkdir -p $GOPATH/src
mkdir -p $GOPATH/src/github.com
