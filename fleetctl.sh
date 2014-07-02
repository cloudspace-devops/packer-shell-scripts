#!/bin/bash -eux

# Set fleet version
FLEET="v0.3.3"

# Install fleet
sudo wget https://github.com/coreos/fleet/releases/download/$FLEET/fleet-$FLEET-linux-amd64.tar.gz
tar -xf fleet-$FLEET-linux-amd64.tar.gz && cd fleet-$FLEET-linux-amd64/ && sudo cp flee* /usr/bin
