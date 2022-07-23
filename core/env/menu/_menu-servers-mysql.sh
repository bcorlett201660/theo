#!/usr/bin/env bash

# MySQL
echo "
███╗   ███╗██╗   ██╗███████╗ ██████╗ ██╗     
████╗ ████║╚██╗ ██╔╝██╔════╝██╔═══██╗██║     
██╔████╔██║ ╚████╔╝ ███████╗██║   ██║██║     
██║╚██╔╝██║  ╚██╔╝  ╚════██║██║▄▄ ██║██║     
██║ ╚═╝ ██║   ██║   ███████║╚██████╔╝███████╗
╚═╝     ╚═╝   ╚═╝   ╚══════╝ ╚══▀▀═╝ ╚══════╝                                         

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
|  1 - Install         |
|  2 - New User        |
|  3 - New Database    |
|  4 - Grant Access    |
|  b - Servers Menu    |
|~~~~~~~~~~~~~~~~~~~~~~|
   "                                                
read -p "
What would you like to do?

:" prompt

while [[ $prompt != 'h' ]] && [[ $prompt != 'm' ]] && [[ $prompt != '1' ]] && [[ $prompt != '2' ]] && [[ $prompt != '3' ]] && [[ $prompt != '4' ]] && [[ $prompt != 'b' ]] || [[ $prompt == '' ]]
do
    read -p "Please enter a valid option: " prompt
done 

if [ "$prompt" = "h" ]
then
eval "$_HELP_SERVERS"
fi

if [ "$prompt" = "m" ]
then
eval "$_MENU_MAIN_RETURN"
fi


if [ "$prompt" = "1" ]
then

eval "$_SERVERS_MYSQL_INSTALL"

sleep 2
echo "Returning to the MySQL Menu in:"
eval "$_COUNTDOWN"
eval "$_MENU_SERVERS_MYSQL"
fi

if [ "$prompt" = "2" ]
then

eval "$_SERVERS_MYSQL_NEW_USER"

sleep 2
echo "
Returning to the MySQL Menu in:"
eval "$_COUNTDOWN"
eval "$_MENU_SERVERS_MYSQL"
fi

if [ "$prompt" = "3" ]
then

eval "$_SERVERS_MYSQL_NEW_DATABASE"

sleep 2
echo "
Returning to the MySQL Menu in:"
eval "$_COUNTDOWN"
eval "$_MENU_SERVERS_MYSQL"

fi

if [ "$prompt" = "4" ]
then

eval "$_SERVERS_MYSQL_GRANT_PRIVILEGES"

sleep 2
echo "
Returning to the MySQL Menu in:"
eval "$_COUNTDOWN"
eval "$_MENU_SERVERS_MYSQL"
fi

if [ "$prompt" = "b" ]
then
eval "$_MENU_SERVERS"
fi