#!/bin/bash -eux

echo 'vagrant' | sudo -S sed -i 's/^%sudo\s\+ALL=(ALL:ALL)\s\+ALL/%sudo ALL=(ALL:ALL) NOPASSWD:ALL/' /etc/sudoers
