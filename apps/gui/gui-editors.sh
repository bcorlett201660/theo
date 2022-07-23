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
|  1 - Leafpad         |
|  2 - Gedit           |
|  3 - Geany           |
|  b - GUI Menu        |
|~~~~~~~~~~~~~~~~~~~~~~|
   "                                                
read -p "
What would you like to do?

:" prompt

while [[ $prompt != 'h' ]] && [[ $prompt != 'm' ]] && [[ $prompt != '1' ]] && [[ $prompt != '2' ]] && [[ $prompt != '3' ]] && [[ $prompt != 'b' ]] || [[ $prompt == '' ]]
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
Would you like to install Leafpad? <y/n>
|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
|_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_|
|_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_|
|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|

:" prompt
if [ "$prompt" = "y" ]; 
then
apt-get install leafpad -y
fi
sleep 1
echo "
Returning to the Text Editors Menu in:"
eval "$_COUNTDOWN"
eval "$_GUI_EDITORS"
fi
	
if [ "$prompt" = "2" ]
then
read -p "
Would you like to install Gedit? <y/n>
|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
|_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_|
|_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_|
|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|

:" prompt
if [ "$prompt" = "y" ]; 
then
	apt-get install gedit -y
	fi
sleep 1
echo "
Returning to the Text Editors Menu in:"
eval "$_COUNTDOWN"
eval "$_GUI_EDITORS"
fi

if [ "$prompt" = "3" ]
then
read -p "
Would you like to install Geany? <y/n>
|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
|_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_|
|_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_|
|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|

:" prompt
if [ "$prompt" = "y" ]; 
then
	apt-get install geany -y
	fi
sleep 1
echo "
Returning to the Text Editors Menu in:"
eval "$_COUNTDOWN"
eval "$_GUI_EDITORS"
fi

if [ "$prompt" = "b" ]
then
eval "$_GUI"
fi
