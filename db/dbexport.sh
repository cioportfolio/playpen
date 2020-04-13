#!/usr/bin/env bash

echo "Backing up to dbexport.pgsql"
sudo su - postgres -c "pg_dump -U postgres myapp" > /vagrant/db/datafiles/dbexport.pgsql