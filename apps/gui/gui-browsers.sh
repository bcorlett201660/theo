#!/usr/bin/env bash

echo "
███████╗██████╗ ██╗████████╗ ██████╗ ██████╗ ███████╗
██╔════╝██╔══██╗██║╚══██╔══╝██╔═══██╗██╔══██╗██╔════╝
█████╗  ██║  ██║██║   ██║   ██║   ██║██████╔╝███████╗
██╔══╝  ██║  ██║██║   ██║   ██║   ██║██╔══██╗╚════██║
███████╗██████╔╝██║   ██║   ╚██████╔╝██║  ██║███████║
╚══════╝╚═════╝ ╚═╝   ╚═╝    ╚═════╝ ╚═╝  ╚═╝╚══════╝                                                     

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
|  1 - Chromium        |
|  2 - Firefox         |
|  b - GUI Menu        |
|~~~~~~~~~~~~~~~~~~~~~~|
   "                                                
read -p "
What would you like to do?

:" prompt

while [[ $prompt != 'h' ]] && [[ $prompt != 'm' ]] && [[ $prompt != '1' ]] && [[ $prompt != '2' ]] && [[ $prompt != 'b' ]] || [[ $prompt == '' ]]
do
    read -p "Please enter a valid option: " prompt
done 

echo "
If you are planning to install the PIXEL GUI you may want to also install one or more text/code editor(s)."

if [ "$prompt" = "h" ]
then
eval "$_HELP_GUI"
fi

if [ "$prompt" = "m" ]
then
eval "$_MENU_MAIN_RETURN"
fi

if [ "$prompt" = "1" ]
then
read -p "
Would you like to install Chromium Web Browser? <y/n>
|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
|_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_|
|_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_|
|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|

:" prompt
if [ "$prompt" = "y" ]; 
then
apt-get install chromium-browser -y
fi
sleep 1
echo "
Returning to the Browsers Menu in:"
eval "$_COUNTDOWN"
eval "$_GUI_BROWSERS"
fi
	
if [ "$prompt" = "2" ]
then
read -p "
Would you like to install Firefox Web Browser? <y/n>
|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
|_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_|
|_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_|
|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|

:" prompt
if [ "$prompt" = "y" ]; 
then

echo "
deb http://ppa.launchpad.net/ubuntu-mozilla-security/ppa/ubuntu trusty main
deb-src http://ppa.launchpad.net/ubuntu-mozilla-security/ppa/ubuntu trusty main
" | sudo tee -a /etc/apt/sources.list
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys A6DCF7707EBC211F && sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 9BDB3D89CE49EC21 && sudo apt-get update && sudo apt-get install firefox -y
	fi
sleep 1
echo "
Returning to the Browsers Menu in:"
eval "$_COUNTDOWN"
eval "$_GUI_BROWSERS"
fi

if [ "$prompt" = "m" ]
then
eval "$_GUI_BROWSERS"
fi