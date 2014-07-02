#!/bin/bash -eux

sudo apt-get install -y docker.io
sudo ln -sf /usr/bin/docker.io /usr/local/bin/docker

# Add user to docker group
sudo usermod -a -G docker `eval whoami`

# Enable memory and swap accounting
sudo sed -i 's/GRUB_CMDLINE_LINUX=""/GRUB_CMDLINE_LINUX="cgroup_enable=memory swapaccount=1"/' /etc/default/grub
sudo update-grub
