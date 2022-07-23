#!/usr/bin/env bash

echo "
██████╗ ██╗    ██████╗  █████╗ ██████╗ ██╗ ██████╗ 
██╔══██╗██║    ██╔══██╗██╔══██╗██╔══██╗██║██╔═══██╗
██████╔╝██║    ██████╔╝███████║██║  ██║██║██║   ██║
██╔═══╝ ██║    ██╔══██╗██╔══██║██║  ██║██║██║   ██║
██║     ██║    ██║  ██║██║  ██║██████╔╝██║╚██████╔╝
╚═╝     ╚═╝    ╚═╝  ╚═╝╚═╝  ╚═╝╚═════╝ ╚═╝ ╚═════╝                                                                                                   

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
   
|~~~~~~~~~~~~~~~~~~~~~~|
|  h - Help            |
|  m - Main Menu       |
|  1 - Apache2         |
|  2 - PHP7.0          |
|  3 - MySQL           |
|  4 - PHPMyAdmin      |
|  5 - Wordpress       |
|  6 - NextCloud       |
|  7 - Install AMPP    |
|  8 - MongoDB         |
|~~~~~~~~~~~~~~~~~~~~~~|
"

read -p "
What would you like to do?

:" prompt

while [[ $prompt != 'h' ]] && [[ $prompt != 'm' ]] && [[ $prompt != '1' ]] && [[ $prompt != '2' ]] && [[ $prompt != '3' ]] && [[ $prompt != '4' ]] && [[ $prompt != '5' ]] && [[ $prompt != '6' ]] && [[ $prompt != '7' ]] && [[ $prompt != '8' ]] || [[ $prompt == '' ]]
do
    read -p "Please enter a valid option: " prompt
done 

if [ "$prompt" = "h" ]; 
then
eval "$_HELP_SERVERS"
fi

if [ "$prompt" = "m" ]
then
eval "$_MENU_MAIN_RETURN"
fi

if [ "$prompt" = "1" ]
then
eval "$_SERVERS_APACHE2"
echo "
Returning to Servers Menu
"
sleep 2
eval "$_COUNTDOWN"
eval "$_MENU_SERVERS"
fi

if [ "$prompt" = "2" ]
then
eval "$_SERVERS_PHP"
echo "
Returning to Servers Menu
"
sleep 2
eval "$_COUNTDOWN"
eval "$_MENU_SERVERS"
fi

if [ "$prompt" = "3" ]
then
eval "$_MENU_SERVERS_MYSQL"
echo "
Returning to Servers Menu
"
sleep 2
eval "$_COUNTDOWN"
eval $_MENU_SERVERS"
fi

if [ "$prompt" = "4" ]
then
eval "$_SERVERS_PHPMYADMIN"
echo "
Returning to Servers Menu
"
sleep 2
eval "$_COUNTDOWN"
eval "$_MENU_SERVERS"
fi

if [ "$prompt" = "5" ]
then
eval "$_SERVERS_WORDPRESS"
sleep 2
echo "
Returning to the Wordpress Menu in:"
eval "$_COUNTDOWN"
eval "$_SERVERS_WORDPRESS"
fi

if [ "$prompt" = "6" ]
then
eval "$_SERVERS_NEXTCLOUD"
echo "Returning to the Nextcloud Menu in:"
eval "$_COUNTDOWN"
eval "$_SERVERS_NEXTCLOUD"
fi

if [ "$prompt" = "7" ]
then
eval "$_UTILITY_STRETCH_SOURCES"
eval "$_UTILITY_UPDATE"
eval "$_UTILITY_UPGRADE"
eval "$_SERVERS_APACHE2"
eval "$_SERVERS_PHP"
eval "$_SERVERS_MYSQL_INSTALL"
eval "$_SERVERS_MYSQL_NEW_USER"
eval "$_SERVERS_MYSQL_NEW_DATABASE"
eval "$_SERVERS_MYSQL_GRANT_PRIVILEGES"
eval "$_SERVERS_PHPMYADMIN"

sleep 2
echo "
Returning to the Servers Menu in:"
eval "$_COUNTDOWN"
eval "$_MENU_SERVERS"
fi

if [ "$prompt" = "8" ]
then
eval "$_SERVERS_MONGODB"
echo "
Returning to Servers Menu
"
sleep 2
eval "$_COUNTDOWN"
eval "$_MENU_SERVERS"
fi
