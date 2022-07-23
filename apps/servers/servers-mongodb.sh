#!/usr/bin/env bash

echo " 
MONGO DB

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
"

read -p "
Would you like to install Mongo DB? <y/n>
|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
|_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_|
|_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_|
|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|

:" prompt
if [ "$prompt" = "y" ]; 
then
wget http://andyfelong.com/downloads/core_mongodb.tar.gz
tar -zxvf core_mongodb.tar.gz
sudo adduser --ingroup nogroup --shell /etc/false --disabled-password --gecos "" \
--no-create-home mongodb
sudo chown root:root mongo*
sudo chmod 755 mongo*
sudo strip mongo*
sudo cp -p mongo* /usr/bin
sudo mkdir /var/log/mongodb
sudo chown mongodb:nogroup /var/log/mongodb
sudo mkdir /var/lib/mongodb
sudo chown mongodb:root /var/lib/mongodb
sudo chmod 775 /var/lib/mongodb
sudo touch /etc/mongodb.conf
echo "# /etc/mongodb.con"| sudo tee -a /etc/mongodb.conf
echo "# minimal config file (old style)"| sudo tee -a /etc/mongodb.conf
echo "# Run mongod --help to see a list of options"| sudo tee -a /etc/mongodb.conf
echo ""| sudo tee -a /etc/mongodb.conf
echo "bind_ip = 127.0.0.1"| sudo tee -a /etc/mongodb.conf
echo "quiet = true"| sudo tee -a /etc/mongodb.conf
echo "dbpath = /var/lib/mongodb"| sudo tee -a /etc/mongodb.conf
echo "logpath = /var/log/mongodb/mongod.log"| sudo tee -a /etc/mongodb.conf
echo "logappend = true"| sudo tee -a /etc/mongodb.conf
echo "storageEngine = mmapv1"| sudo tee -a /etc/mongodb.conf
sudo touch /lib/systemd/system/mongodb.service
echo "[Unit]"| sudo tee -a /lib/systemd/system/mongodb.service
echo "Description=High-performance, schema-free document-oriented database"| sudo tee -a /lib/systemd/system/mongodb.service
echo "After=network.target"| sudo tee -a /lib/systemd/system/mongodb.service
echo ""| sudo tee -a /lib/systemd/system/mongodb.service
echo "[Service]"| sudo tee -a /lib/systemd/system/mongodb.service
echo "User=mongodb"| sudo tee -a /lib/systemd/system/mongodb.service
echo "ExecStart=/usr/bin/mongod --quiet --config /etc/mongodb.conf"| sudo tee -a /lib/systemd/system/mongodb.service
echo ""| sudo tee -a /lib/systemd/system/mongodb.service
echo "[Install]"| sudo tee -a /lib/systemd/system/mongodb.service
echo "WantedBy=multi-user.target"| sudo tee -a /lib/systemd/system/mongodb.service
sudo service mongodb start
sudo service mongodb status
rm core_mongodb.tar.gz
fi