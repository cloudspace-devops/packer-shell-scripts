#!/bin/bash -eux

# Install nginx
sudo apt-get install nginx -y
sudo useradd -s /sbin/nologin -r nginx

sudo groupadd web
sudo usermod -a -G web nginx
sudo usermod -a -G web `eval whoami`

