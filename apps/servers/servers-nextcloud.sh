#!/usr/bin/env bash

echo "
███╗   ██╗███████╗██╗  ██╗████████╗ ██████╗██╗      ██████╗ ██╗   ██╗██████╗ 
████╗  ██║██╔════╝╚██╗██╔╝╚══██╔══╝██╔════╝██║     ██╔═══██╗██║   ██║██╔══██╗
██╔██╗ ██║█████╗   ╚███╔╝    ██║   ██║     ██║     ██║   ██║██║   ██║██║  ██║
██║╚██╗██║██╔══╝   ██╔██╗    ██║   ██║     ██║     ██║   ██║██║   ██║██║  ██║
██║ ╚████║███████╗██╔╝ ██╗   ██║   ╚██████╗███████╗╚██████╔╝╚██████╔╝██████╔╝
╚═╝  ╚═══╝╚══════╝╚═╝  ╚═╝   ╚═╝    ╚═════╝╚══════╝ ╚═════╝  ╚═════╝ ╚═════╝ 
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
"
echo "
  __  __                     
 |  \/  |                    
 | \  / |  ___  _ __   _   _ 
 | |\/| | / _ \| '_ \ | | | |
 | |  | ||  __/| | | || |_| |
 |_|  |_| \___||_| |_| \__,_|  
|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
|  h - Help                      |
|  m - Main Menu                 |       
|  1 - Install                   |
|  2 - MySQL - New User          |
|  3 - MySQL - New Database      |
|  4 - MySQL - Grant Privileges  |
|  b - Servers Menu              |
|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
   "                                                
read -p "
What would you like to do?
:" prompt

while [[ $prompt != 'h' ]] && [[ $prompt != 'm' ]] && [[ $prompt != '1' ]] && [[ $prompt != '2' ]] && [[ $prompt != '3' ]] && [[ $prompt != '4' ]] || [[ $prompt == '' ]]
do
    read -p "Please enter a valid option: " prompt
done 

if [ "$prompt" = "h" ]
then
eval "$_HELP_NEXTCLOUD"
fi

if [ "$prompt" = "m" ]
then
eval "$_MENU_MAIN_RETURN"
fi

if [ "$prompt" = "1" ]
then
wget https://download.nextcloud.com/server/releases/latest-12.zip
unzip -q latest-12.zip
mv nextcloud /var/www/html
rm latest-12.zip
sudo mkdir -p /var/www/html/nextcloud/data
chown -R www-data:www-data /var/www/html/nextcloud
sed -i 's/;opcache.enable=0/opcache.enable=1/g' /etc/php/7.0/apache2/php.ini
sed -i 's/;opcache.enable_cli=0/opcache.enable_cli=1/g' /etc/php/7.0/apache2/php.ini
sed -i 's/;opcache.interned_strings_buffer=4/opcache.interned_strings_buffer=8/g' /etc/php/7.0/apache2/php.ini
sed -i 's/;opcache.max_accelerated_files=2000/opcache.max_accelerated_files=10000/g' /etc/php/7.0/apache2/php.ini
sed -i 's/;opcache.memory_consumption=64/opcache.memory_consumption=128/g' /etc/php/7.0/apache2/php.ini
sed -i 's/;opcache.save_comments=1/opcache.save_comments=1/g' /etc/php/7.0/apache2/php.ini
sed -i 's/;opcache.revalidate_path=0/opcache.revalidate_freq=1/g' /etc/php/7.0/apache2/php.ini
sed -i 's/post_max_size = 8M/post_max_size = 2000M/g' /etc/php/7.0/apache2/php.ini
sed -i 's/upload_max_filesize = 2M/upload_max_filesize = 2000M/g' /etc/php/7.0/apache2/php.ini
sed -i 's/max_file_uploads = 20/max_file_uploads = 200/g' /etc/php/7.0/apache2/php.ini
echo "<IfModule mod_headers.c>
          Header always set Strict-Transport-Security 'max-age=15768000; preload'
     </IfModule>" | sudo tee -a /etc/apache2/sites-available/000-default.conf
sudo mkdir -p /var/nextcloud
sudo mv -v /var/www/html/nextcloud/data /var/nextcloud/data
sudo cp -p /var/www/html/nextcloud/config/config.php /var/www/html/nextcloud/config/config.php.bk
sed -i 's/www\/html\///g' /var/www/html/nextcloud/config/config.php
sudo service apache2 restart
sed -i 's/AllowOverride None/AllowOverride All/g' /etc/apache2/apache2.conf
sudo mkdir -p /etc/apache2/ssl
sudo openssl req -x509 -nodes -days 365 -newkey rsa:4096 -keyout /etc/apache2/ssl/apache.key -out /etc/apache2/ssl/apache.crt
sudo a2enmod ssl
sed -i 's/\/etc/ssl\/certs\/ssl-cert-snakeoil.pem/\/etc\/apache2\/ssl\/apache.crt/g' /etc/apache2/sites-available/default-ssl.conf
sed -i 's/\/etc/ssl\/certs\/ssl-cert-snakeoil.key/\/etc\/apache2\/ssl\/apache.key/g' /etc/apache2/sites-available/default-ssl.conf
sudo a2ensite default-ssl.conf
sudo service apache2 restart
truncate -s 0 /etc/apache2/sites-available/000-default.conf
echo "<VirtualHost *:80>
   ServerAdmin example@example

   RewriteEngine On
   RewriteCond %{HTTPS} off
   RewriteRule ^(.*)$ https://%{HTTP_HOST}$1 [R=301,L]
</VirtualHost>

<IfModule mod_headers.c>
          Header always set Strict-Transport-Security 'max-age=15768000; preload'
     </IfModule>" | sudo tee -a /etc/apache2/sites-available/000-default.conf
sudo a2enmod rewrite
sudo service apache2 restart
fi


if [ "$prompt" = "2" ];
then
eval "$_SERVERS_MYSQL_NEW_USER"
sleep 2
echo "
Returning to the Nextcloud Menu in:"
eval "$_COUNTDOWN"
eval "$_SERVERS_NEXTCLOUD"
fi

if [ "$prompt" = "3" ];
then

eval "$_SERVERS_MYSQL_NEW_DATABASE"

sleep 2
echo "
Returning to the Nextcloud Menu in:"
eval "$_COUNTDOWN"
eval "$_SERVERS_NEXTCLOUD"
fi

if [ "$prompt" = "4" ];
then
read -p "
Would you like to grant a MySQL user access to a database? <y/n>
|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
|_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_|
|_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_|
|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
:" prompt
if [ "$prompt" = "y" ]; 
then

eval "$_SERVERS_MYSQL_GRANT_PRIVILEGES"
fi
sleep 2
echo "
Returning to the Nextcloud Menu in:"
eval "$_COUNTDOWN"
eval "$_SERVERS_NEXTCLOUD"
fi