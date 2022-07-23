#!/usr/bin/env bash

echo " 
 █████╗ ██████╗  █████╗  ██████╗██╗  ██╗███████╗██████╗ 
██╔══██╗██╔══██╗██╔══██╗██╔════╝██║  ██║██╔════╝╚════██╗
███████║██████╔╝███████║██║     ███████║█████╗   █████╔╝
██╔══██║██╔═══╝ ██╔══██║██║     ██╔══██║██╔══╝  ██╔═══╝ 
██║  ██║██║     ██║  ██║╚██████╗██║  ██║███████╗███████╗
╚═╝  ╚═╝╚═╝     ╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝╚══════╝╚══════╝                                                        

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
"

read -p "
Would you like to install Apache2? <y/n>
|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
|_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_|
|_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_|
|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|

:" prompt
if [ "$prompt" = "y" ]; 
then
if [ ! -f /var/log/pinomite.log ]; then
 echo "deb http://mirrordirector.raspbian.org/raspbian/ stretch main contrib non-free rpi" > /etc/apt/sources.list.d/stretch.list
	echo "APT::Default-Release \"jessie\";" > /etc/apt/apt.conf.d/99-default-release
 touch /var/log/pinomite.log
 echo "stretch-sources-added" | sudo tee -a /var/log/pinomite.log
 apt-get update
 apt-get upgrade
else
 if grep -Fxq "stretch-sources-added" /var/log/pinomite.log
  then
echo "stretch sources already configured"  
else
    echo "deb http://mirrordirector.raspbian.org/raspbian/ stretch main contrib non-free rpi" > /etc/apt/sources.list.d/stretch.list
	echo "APT::Default-Release \"jessie\";" > /etc/apt/apt.conf.d/99-default-release
 touch /var/log/pinomite.log
 echo "stretch-sources-added" | sudo tee -a /var/log/pinomite.log
 apt-get update
 apt-get upgrade
 fi
fi
apt-get install -t stretch apache2 -y
echo "apache2-installed" | sudo tee -a /var/log/pinomite.log
a2enmod proxy_fcgi setenvif
a2enconf php7.0-fpm
a2enmod ssl
a2ensite default-ssl
a2enmod rewrite
a2enmod headers
a2enmod env
a2enmod dir
a2enmod mime
systemctl restart apache2

mkdir -p /var/www/{public,private,logs,backup,vhosts}
chown -R www-data:www-data /var/www
chmod -R 775 /var/www

usermod -aG www-data pi
fi