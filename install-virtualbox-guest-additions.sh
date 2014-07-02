#!/bin/bash -eux

# Install Module Assistant
sudo apt-get install -y build-essential
sudo apt-get install -y module-assistant
sudo apt-get install -y linux-headers-generic
sudo m-a prepare

# Install guest additions
sudo apt-get install -y virtualbox-guest-utils


