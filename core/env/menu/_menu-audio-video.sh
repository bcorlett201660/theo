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
|  1 - ALSA Loopbacks  |
|  2 - Kodi            |
|~~~~~~~~~~~~~~~~~~~~~~|
"
read -p "
What would you like to do?

:" prompt

while [[ $prompt != 'h' ]] && [[ $prompt != 'm' ]] && [[ $prompt != '1' ]] && [[ $prompt != '2' ]] || [[ $prompt == '' ]]
do
    read -p "Please enter a valid option: " prompt
done 

if [ "$prompt" = "h" ]; 
then
eval "$_HELP_AUDIO_VIDEO"
fi

if [ "$prompt" = "m" ]
then
eval "$_MENU_MAIN_RETURN"
fi

if [ "$prompt" = "1" ]
then
eval "$_LOOPBACK"
fi

if [ "$prompt" = "2" ]
then
eval "$_KODI"
fi