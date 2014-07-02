#!/bin/bash -eux

# npm has issues if you don't reset eth0
sudo ifdown eth0
sudo ifup eth0

# Install yeoman, grunt and bower
npm install yo -g --no-insight
