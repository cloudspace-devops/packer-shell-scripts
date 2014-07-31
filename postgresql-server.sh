#!/bin/bash -eux

# Install postgresql
sudo apt-get install -y postgresql-9.3 postgresql-contrib-9.3 postgresql-client-9.3

# Set password for postgres database user
sudo -u postgres psql postgres postgres -c "ALTER USER postgres WITH PASSWORD 'postgres'"

# allow all users to access postgres locally from any user
echo "local   all             all                                     md5"|sudo tee --append /etc/postgresql/9.3/main/pg_hba.conf
