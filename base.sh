#!/bin/bash -eux

sudo apt-get update
sudo apt-get install -y build-essential
sudo apt-get install -y linux-headers-$(uname -r) dkms nfs-common git-core whois traceroute htop unzip sysstat vim libmysqlclient-dev postgresql-server-dev-9.3 wget screen
sudo apt-mark hold grub grub-common grub-pc grub-pc-bin grub2-common grub-legacy-ec2
sudo apt-get -y upgrade


