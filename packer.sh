#!/bin/bash -eux

# Install unzip
sudo apt-get install -y unzip

# Install packer
cd /usr/local/src/
sudo mkdir packer
sudo chown `eval whoami`:`eval whoami` packer
cd packer
wget https://dl.bintray.com/mitchellh/packer/0.6.0_linux_amd64.zip
unzip 0.6.0_linux_amd64.zip
sudo ln -s /usr/local/src/packer/packer /usr/local/bin/



