#!/bin/bash -eux

# Install Redis
sudo apt-get install -y redis-server

cat <<EOF | sudo tee /etc/redis/redis.conf
daemonize yes
pidfile /var/run/redis.pid
logfile /var/log/redis/redis.log

port 6379
bind 127.0.0.1
timeout 300

loglevel notice

## Default configuration options
databases 16

save 900 1
save 300 10
save 60 10000

rdbcompression yes
dbfilename dump.rdb

appendonly no
EOF

# Restart Redis
sudo service redis-server restart