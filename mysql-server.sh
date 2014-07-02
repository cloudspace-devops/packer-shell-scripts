#!/bin/bash -eux

# Set root password
# sudo debconf-set-selections <<< 'mysql-server-5.6 mysql-server/root_password password passwd'
# sudo debconf-set-selections <<< 'mysql-server-5.6 mysql-server/root_password_again password passwd'

# Install MySQL Server
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y mysql-server-5.6