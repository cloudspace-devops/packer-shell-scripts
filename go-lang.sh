#!/bin/bash -eux

# Install Go
sudo apt-get install -y golang

# Setup Go Path
echo -e "export GOPATH=/srv/go\nexport PATH=$PATH:/srv/go/bin" | tee ~/.bash_profile ~/.bashrc
. ~/.bash_profile

# Uncomment below to create local workspace directories
# I prefer to launch the devops box with vagrant at /srv/devops
# and mount a separate go directory structure at /srv/go
# mkdir -p $GOPATH/bin
# mkdir -p $GOPATH/pkg
# mkdir -p $GOPATH/src
# mkdir -p $GOPATH/src/github.com
