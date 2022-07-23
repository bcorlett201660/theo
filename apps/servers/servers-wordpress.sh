#!/usr/bin/env bash

# Wordpress
echo "
██╗    ██╗ ██████╗ ██████╗ ██████╗ ██████╗ ██████╗ ███████╗███████╗███████╗
██║    ██║██╔═══██╗██╔══██╗██╔══██╗██╔══██╗██╔══██╗██╔════╝██╔════╝██╔════╝
██║ █╗ ██║██║   ██║██████╔╝██║  ██║██████╔╝██████╔╝█████╗  ███████╗███████╗
██║███╗██║██║   ██║██╔══██╗██║  ██║██╔═══╝ ██╔══██╗██╔══╝  ╚════██║╚════██║
╚███╔███╔╝╚██████╔╝██║  ██║██████╔╝██║     ██║  ██║███████╗███████║███████║
 ╚══╝╚══╝  ╚═════╝ ╚═╝  ╚═╝╚═════╝ ╚═╝     ╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝                                                                           
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
|  2 - Launch Chromium           |
|  3 - MySQL - New User          |
|  4 - MySQL - New Database      |
|  5 - MySQL - Grant Privileges  |
|  b - Back to Servers Menu      |
|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
   "                                                
read -p "
What would you like to do?
:" prompt

while [[ $prompt != 'h' ]] && [[ $prompt != 'm' ]] && [[ $prompt != '1' ]] && [[ $prompt != '2' ]] && [[ $prompt != '3' ]] && [[ $prompt != '4' ]] && [[ $prompt != '5' ]] && [[ $prompt != 'b' ]] || [[ $prompt == '' ]]
do
    read -p "Please enter a valid option: " prompt
done 

if [ "$prompt" = "h" ]
then
eval "$_HELP_SERVERS_WORDPRESS"
fi

if [ "$prompt" = "m" ]
then
eval "$_MENU_MAIN_RETURN"
fi

if [ "$prompt" = "b" ]
then
eval "$_MENU_SERVERS"
fi

if [ "$prompt" = "1" ]
then
read -p "
Do you want to download the latest version of Wordpress? <y/n>
|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
|_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_|
|_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_|
|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
:" prompt
if [ "$prompt" = "y" ]; 
then
	
echo "
What would you like to name the root directory for your site? (i.e piRadio)
|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
|_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_|
|_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_|
|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
:"

read DOC_ROOT

echo "
What port would you like you WordPress site to be accesible throug?
|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
|_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_|
|_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_|
|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
:"

read DOC_PORT

	mkdir /var/www/$DOC_ROOT
	wget http://wordpress.org/latest.tar.gz
	#mv latest.tar.gz /var/www/$DOC_ROOT
	#tar xzf /var/www/$DOC_ROOT/latest.tar.gz
	tar xzf latest.tar.gz
	mv wordpress/* /var/www/$DOC_ROOT
	rm -rf wordpress latest.tar.gz
	chown -R www-data:www-data /var/www
        adduser pi www-data
	rm /var/www/$DOC_ROOT/index.html
	touch /etc/apache2/sites-enabled/$DOC_ROOT.conf
	echo "Listen $DOC_PORT
<VirtualHost *:$DOC_PORT>
    DocumentRoot "/var/www/$DOC_ROOT"
    # Other directives here
</VirtualHost>" | sudo tee -a /etc/apache2/sites-enabled/$DOC_ROOT.conf

set -e
fi
fi

if [ "$prompt" = "2" ];
then

chromium-browser -no-sandbox 127.0.0.1 &

sleep 2
echo "Returning to the Wordpress Menu in:"
eval "$_COUNTDOWN"
eval "$_SERVERS_WORDPRESS"
fi


if [ "$prompt" = "3" ];
then
eval "$_SERVERS_MYSQL_NEW_USER"
sleep 2
echo "
Returning to the Wordpress Menu in:"
eval "$_COUNTDOWN"
eval "$_SERVERS_WORDPRESS"
fi

if [ "$prompt" = "4" ];
then

eval "$_SERVERS_MYSQL_NEW_DATABASE"

sleep 2
echo "
Returning to the Wordpress Menu in:"
eval "$_COUNTDOWN"
eval "$_SERVERS_WORDPRESS"
fi

if [ "$prompt" = "5" ];
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
fi