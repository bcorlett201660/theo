#!/usr/bin/env bash

echo " 

 ██████╗ ██╗   ██╗██╗
██╔════╝ ██║   ██║██║
██║  ███╗██║   ██║██║
██║   ██║██║   ██║██║
╚██████╔╝╚██████╔╝██║
 ╚═════╝  ╚═════╝ ╚═╝
                     

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

|~~~~~~~~~~~~~~~~~~~~~~~~~~|
|  h - Help                |
|  m - Main Menu           |
|  1 - Install Xserver     |
|  2 - Install PIXEL       |    
|  3 - Text Editors        |   
|  4 - Web Browsers        |
|~~~~~~~~~~~~~~~~~~~~~~~~~~|
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
eval "$_HELP_GUI"
fi

if [ "$prompt" = "m" ]
then
eval "$_MENU_MAIN_RETURN"
fi

if [ "$prompt" = "1" ]
then
  echo "
██████╗ ██╗██╗  ██╗███████╗██╗          ██████╗ ██╗   ██╗██╗
██╔══██╗██║╚██╗██╔╝██╔════╝██║         ██╔════╝ ██║   ██║██║
██████╔╝██║ ╚███╔╝ █████╗  ██║         ██║  ███╗██║   ██║██║
██╔═══╝ ██║ ██╔██╗ ██╔══╝  ██║         ██║   ██║██║   ██║██║
██║     ██║██╔╝ ██╗███████╗███████╗    ╚██████╔╝╚██████╔╝██║
╚═╝     ╚═╝╚═╝  ╚═╝╚══════╝╚══════╝     ╚═════╝  ╚═════╝ ╚═╝                                                            
"
read -p "
Would you like to install Xserver? <y/n>
|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
|_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_|
|_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_|
|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|

:" prompt
for _ in once; do
if [ "$prompt" = "y" ]; 
then
apt-get install --no-install-recommends xserver-xorg -y
apt-get install --no-install-recommends xinit -y
echo ""
break
fi
done

echo "Returning to the GUI Menu in:"
eval "$_COUNTDOWN"
eval "$_GUI"

fi

if [ "$prompt" = "2" ]
then
read -p "
Would you like to install the PIXEL GUI? <y/n>
|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
|_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_|
|_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_|
|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|

:" prompt
for _ in once; do
if [ "$prompt" = "y" ]; 
then
eval "$_UTILTIY_UPDATE"
eval "$_UTILITY_UPGRADE"
apt-get install --no-install-recommends xserver-xorg -y
apt-get install --no-install-recommends xinit -y
apt-get install raspberrypi-ui-mods -y
echo ""
break
fi
done

echo "Returning to the GUI Menu in:"
eval "$_COUNTDOWN"
eval "$_GUI"

fi

if [ "$prompt" = "3" ]
then 
eval "$_GUI_EDITORS"
echo "Returning to the GUI Menu in:"
eval "$_COUNTDOWN"
eval "$_GUI"
fi

if [ "$prompt" = "4" ]
then 
eval "$_GUI_BROWSERS"
echo "Returning to the GUI Menu in:"
eval "$_COUNTDOWN"
eval "$_GUI"
fi
