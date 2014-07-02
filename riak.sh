#!/bin/bash -eux

# TODO: WORK IN PROGRESS

sudo apt-get install libssl1.0.0

cd /tmp
wget http://s3.amazonaws.com/downloads.basho.com/riak/2.0/2.0.0beta1/ubuntu/precise/riak_2.0.0beta1-1_amd64.deb
sudo dpkg -i riak_2.0.0beta1-1_amd64.deb

cat << EOF | sudo tee /etc/security/limits.conf
*               soft     nofile          65536
*               hard     nofile          65536riak soft nofile 4096
riak hard nofile 65536
EOF

# Once Riak 2 comes out of beta, use the following instead of the above code:

# # Add the Riak signing key
# curl http://apt.basho.com/gpg/basho.apt.key | sudo apt-key add -

# # Add the Basho (creator of Riak) repo to the apt sources list
# sudo bash -c "echo deb http://apt.basho.com $(lsb_release -sc) main > /etc/apt/sources.list.d/basho.list"
# sudo apt-get update

# # Install Riak
# sudo apt-get install riak