#!/usr/bin/env bash

# Mummble/Mumble-Server
echo "

███╗   ███╗██╗   ██╗███╗   ███╗██████╗ ██╗     ███████╗
████╗ ████║██║   ██║████╗ ████║██╔══██╗██║     ██╔════╝
██╔████╔██║██║   ██║██╔████╔██║██████╔╝██║     █████╗  
██║╚██╔╝██║██║   ██║██║╚██╔╝██║██╔══██╗██║     ██╔══╝  
██║ ╚═╝ ██║╚██████╔╝██║ ╚═╝ ██║██████╔╝███████╗███████╗
╚═╝     ╚═╝ ╚═════╝ ╚═╝     ╚═╝╚═════╝ ╚══════╝╚══════╝

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

|~~~~~~~~~~~~~~~~~~~~~~~~~~~|
|  h - Help                 |
|  m - Main Menu            |       
|  1 - Mumble Client        |
|  2 - Mumble Server        |
|  b - Communications Menu  |
|~~~~~~~~~~~~~~~~~~~~~~~~~~~|
   "                                                
read -p "
What would you like to do?

:" prompt

while [[ $prompt != 'h' ]] && [[ $prompt != 'm' ]] && [[ $prompt != '1' ]] && [[ $prompt != '2' ]] && [[ $prompt != 'b' ]] || [[ $prompt == '' ]]
do
    read -p "Please enter a valid option: " prompt
done 

if [ "$prompt" = "h" ]
then
eval "$_HELP_MUMBLE"
fi

if [ "$prompt" = "m" ]
then
eval "$_MENU_MAIN_RETURN"
fi



if [ "$prompt" = "1" ]; 
then

read -p "
Do you want to install the Mumble client? <y/n>
|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
|_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_|
|_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_|
|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|

:" prompt

if [ "$prompt" = "y" ]; 
then
	apt-get install mumble -y
#	echo "mumble" | sudo tee -a /etc/init.d/piRadioBoot.sh
fi
echo "Returning to the Mumble Menu in:"
eval "$_COUNTDOWN"
eval "$_MUMBLE"
fi

if [ "$prompt" = "2" ]; 
then
read -p "
Do you want to install the Mumble Server? <y/n>
|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
|_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_|
|_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_|
|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|

:" prompt

if [ "$prompt" = "y" ]; 
then
	apt-get install mumble-server -y
#	echo "mumble" | sudo tee -a /etc/init.d/piRadioBoot.sh
fi
echo "Returning to the Mumble Menu in:"
eval "$_COUNTDOWN"
eval "$_MUMBLE"
fi

if [ "$prompt" = "b" ]
then
eval "$_MENU_COMMUNICATIONS"
fi