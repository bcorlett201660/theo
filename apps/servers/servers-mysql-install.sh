#!/usr/bin/env bash

read -p "
Would you like to install MySQL? <y/n>
|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
|_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_|
|_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_|
|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
:" prompt
if [ "$prompt" = "y" ]; 
then
apt-get -t stretch -y install mysql-server

#read -s -p "Type the password you just entered (MySQL): " mysqlPass

#mysql --user="root" --password="$mysqlPass" --database="mysql" --execute="GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '$mysqlPass'; FLUSH PRIVILEGES;"

service mysql restart
systemctl daemon-reload
echo "
The systemctl daemon has been reloaded
"
echo "
MySQL install complete!
"
fi