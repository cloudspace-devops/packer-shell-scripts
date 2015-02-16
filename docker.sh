#!/bin/bash -eux

curl -sSL https://get.docker.com/ubuntu/ | sudo sh

# Add user to docker group
sudo usermod -a -G docker `eval whoami`

# Setup access for the docker group
sudo chgrp docker /usr/bin/docker
sudo rm -f /usr/local/bin/docker
sudo ln -s /usr/bin/docker /usr/local/bin/docker

# Confirm install worked
docker -v



