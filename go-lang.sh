#!/bin/bash -eux

# Install Go
#sudo apt-get install -y golang

# Install Mercurial, Subversion, Git, Bzr, and CVS Version Control Systems
sudo apt-get install -y mercurial
sudo apt-get install -y subversion
sudo apt-get install -y git
sudo apt-get install -y bzr
sudo apt-get install -y cvs

curl -O https://storage.googleapis.com/golang/go1.4.1.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go1.4.1.linux-amd64.tar.gz
rm go1.4.1.linux-amd64.tar.gz

# Setup Go Path
echo -e "export GOPATH=/srv/go\nexport PATH=$PATH:/srv/go/bin:/usr/local/go/bin" | tee ~/.bash_profile ~/.bashrc
. ~/.bash_profile

# Uncomment below to create local workspace directories
# I prefer to launch the devops box with vagrant at /srv/devops
# and mount a separate go directory structure at /srv/go
# go get github.com/mattn/gom
# mkdir -p $GOPATH/bin
# mkdir -p $GOPATH/pkg
# mkdir -p $GOPATH/src
# mkdir -p $GOPATH/src/github.com
