#!/bin/bash
sudo apt-get install -y nagios-nrpe-server
sudo rm -rf /etc/nagios
cd /etc && sudo git clone https://github.com/nowthatsamatt/nagios.git
sudo service nagios-nrpe-server restart
