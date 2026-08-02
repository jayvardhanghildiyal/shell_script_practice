#!/bin/bash
# restart the postgresql server
sudo service postgresql restart

# start the postgresql server
psql --username=freecodecamp --dbname=worldcup
