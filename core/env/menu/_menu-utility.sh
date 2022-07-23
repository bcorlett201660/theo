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
   
|~~~~~~~~~~~~~~~~~~~~~~~~|
|  h - Help              |
|  m - Main Menu         |
|  1 - Gparted           |
|  2 - LibreOffice       |
|  3 - Stretch Sources   |
|  4 - Transmission      |
|  5 - Update            |
|  6 - Upgrade           |
|~~~~~~~~~~~~~~~~~~~~~~~~|
"

read -p "
What would you like to do?

:" prompt

while [[ $prompt != 'h' ]] && [[ $prompt != 'm' ]] && [[ $prompt != '1' ]] && [[ $prompt != '2' ]] && [[ $prompt != '3' ]] && [[ $prompt != '4' ]] && [[ $prompt != '5' ]] && [[ $prompt != '6' ]] || [[ $prompt == '' ]]
do
    read -p "Please enter a valid option: " prompt
done 

if [ "$prompt" = "h" ]; 
then
eval "$_HELP_UTILITY"
fi

if [ "$prompt" = "m" ]
then
eval "$_MENU_MAIN_RETURN"
fi

if [ "$prompt" = "1" ]
then
eval "$_UTILITY_GPARTED"
echo "
"
sleep 2
eval "$_MENU_UTILITY"
fi

if [ "$prompt" = "2" ]
then
eval "$_UTILITY_LIBREOFFICE"
echo "
"
sleep 2
echo "
Returning to the Utility Menu in:"
eval "$_COUNTDOWN"
eval "$_MENU_UTILITY"
fi

if [ "$prompt" = "3" ]
then
eval "$_UTILITY_STRETCH_SOURCES"
echo "
"
sleep 2
echo "
Returning to the Utility Menu in:"
eval "$_COUNTDOWN"
eval "$_MENU_UTILITY"
fi

if [ "$prompt" = "4" ]
then
eval "$_TRANSMISSION"
echo "
"
sleep 2
echo "
Returning to the Utility Menu in:"
eval "$_COUNTDOWN"
eval "$_MENU_UTILITY"
fi

if [ "$prompt" = "5" ]
then
eval "$_UTILITY_UPDATE"
echo "
"
sleep 2
echo "
Returning to the Utility Menu in:"
eval "$_COUNTDOWN"
eval "$_MENU_UTILITY"
fi

if [ "$prompt" = "6" ]
then
eval "$_UTILITY_UPGRADE"
echo "
"
sleep 2
echo "
Returning to the Utility Menu in:"
eval "$_COUNTDOWN"
eval "$_MENU_UTILITY"
fi