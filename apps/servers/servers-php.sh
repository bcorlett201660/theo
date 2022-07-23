#!/usr/bin/env bash

echo "
                ██████╗ ██╗  ██╗██████╗                 
                ██╔══██╗██║  ██║██╔══██╗                
                ██████╔╝███████║██████╔╝                
                ██╔═══╝ ██╔══██║██╔═══╝                 
                ██║     ██║  ██║██║                     
                ╚═╝     ╚═╝  ╚═╝╚═╝                     

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#            
"       

read -p "
Would you like to install PHP7.0? <y/n>
|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
|_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_|
|_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_|
|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|

:" prompt

if [ "$prompt" = "y" ]; 
then
apt-get install -t stretch -y php7.0 php7.0-fpm php7.0-cli php7.0-opcache php7.0-mbstring php7.0-curl php7.0-zip php7.0-xml php7.0-gd php7.0-mysql libapache2-mod-php7.0

if [ ! -e /var/www/{public,private,logs,backup,vhosts} ]
then
mkdir -p /var/www/{public,private,logs,backup,vhosts}
#echo "<?php phpinfo();" > /var/www/public/index.php
fi
echo "

PHP7.0 has been installed!"
sleep 2
fi