#!/bin/bash -eux

# Install postgresql
sudo apt-get install -y postgresql-9.3 postgresql-contrib-9.3 postgresql-client-9.3

# Set password for postgres database user
sudo -u postgres psql postgres postgres -c "ALTER USER postgres WITH ENCRYTPED PASSWORD 'postgres'"
sudo -u postgres psql postgres postgres -c "ALTER USER nagios WITH ENCRYPTED PASSWORD ''"

# allow all users to access postgres locally from any user
sudo rm /etc/postgresql/9.3/main/pg_hba.conf 
echo "host    all             nagios          174.129.219.71/32       md5"|sudo tee --append /etc/postgresql/9.3/main/pg_hba.conf
echo "local   all             all                                     md5"|sudo tee --append /etc/postgresql/9.3/main/pg_hba.conf
echo "local   all             postgres                                peer"|sudo tee --append /etc/postgresql/9.3/main/pg_hba.conf
echo "local   all             all                                     peer"|sudo tee --append /etc/postgresql/9.3/main/pg_hba.conf
echo "host    all             all             127.0.0.1/32            md5"|sudo tee --append /etc/postgresql/9.3/main/pg_hba.conf
echo "host    all             all             ::1/128                 md5"|sudo tee --append /etc/postgresql/9.3/main/pg_hba.conf
sudo service postgresql restart
