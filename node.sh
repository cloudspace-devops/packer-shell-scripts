#!/bin/bash -eux

# node
cd /usr/local/src/
sudo wget http://nodejs.org/dist/v0.10.28/node-v0.10.28-linux-x64.tar.gz
sudo tar -xzf node-v0.10.28-linux-x64.tar.gz

# this gets the source for npm on some packages
sudo wget http://nodejs.org/dist/v0.10.28/node-v0.10.28.tar.gz
sudo tar -xzf node-v0.10.28.tar.gz

# link node and npm to /usr/local/bin
sudo mkdir -p /usr/local/bin
sudo chown -R `eval whoami`:`eval whoami` /usr/local/bin
sudo ln -s /usr/local/src/node-v0.10.28-linux-x64/bin/node /usr/local/bin/
sudo ln -s /usr/local/src/node-v0.10.28-linux-x64/bin/npm /usr/local/bin/

# Set /usr/local/lib to current user
sudo mkdir -p /usr/local/lib/node_modules
sudo chown -R `eval whoami`:`eval whoami` /usr/local/lib

# Set Node path
echo -e "export PATH=/usr/local/bin:$PATH" | tee ~/.bash_profile ~/.bashrc
. ~/.bash_profile
