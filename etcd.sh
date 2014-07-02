#!/bin/bash -eux

# Set etcd version
ETCD="v0.4.2"

# Install etcd
cd /usr/local/src/
sudo wget https://github.com/coreos/etcd/releases/download/$ETCD/etcd-$ETCD-linux-amd64.tar.gz
sudo tar -xzf etcd-$ETCD-linux-amd64.tar.gz && cd etcd-$ETCD-linux-amd64/ && sudo cp etc* /usr/bin

# Setup user-data config
RES=$(curl https://discovery.etcd.io/new) && TOKEN=${RES##*/}
cat > /home/vagrant/user-data << "EOF"
#cloud-config
coreos:
  etcd:
      #generate a new token for each unique cluster from https://discovery.etcd.io/new
      discovery: https://discovery.etcd.io/$TOKEN
      addr: $public_ipv4:4001
      peer-addr: $public_ipv4:7001
  units:
    - name: etcd.service
      command: start
    - name: fleet.service
      command: start
      runtime: no
      content: |
        [Unit]
        Description=fleet

        [Service]
        Environment=FLEET_PUBLIC_IP=$public_ipv4
        ExecStart=/usr/bin/fleet
    - name: docker-tcp.socket
      command: start
      enable: true
      content: |
        [Unit]
        Description=Docker Socket for the API

        [Socket]
        ListenStream=4243
        Service=docker.service
        BindIPv6Only=both

        [Install]
        WantedBy=sockets.target
EOF

# Setup vagrant ssh config
cat > /home/vagrant/.ssh/config << "EOF"
StrictHostKeyChecking no
UserKnownHostsFile=/dev/null
EOF

# Setup root ssh config
sudo mkdir -p /home/root/.ssh
sudo cp /home/vagrant/.ssh/config /home/root/.ssh/
