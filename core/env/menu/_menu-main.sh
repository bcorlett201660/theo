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
|  i - Index             |
|  1 - Audio & Video     |
|  2 - Broadcasting      |
|  3 - Communications    |
|  4 - GUI               |
|  5 - Network Utility   |
|  6 - Security          |
|  7 - Servers           |
|  8 - Utility           |
|  q - Exit              |
|~~~~~~~~~~~~~~~~~~~~~~~~|
   "                                                
read -p "
What would you like to do?

:" prompt

while [[ $prompt != 'h' ]] && [[ $prompt != 'i' ]] && [[ $prompt != 'q' ]] && [[ $prompt != '1' ]] && [[ $prompt != '2' ]] && [[ $prompt != '3' ]] && [[ $prompt != '4' ]] && [[ $prompt != '5' ]] && [[ $prompt != '6' ]] && [[ $prompt != '7' ]] && [[ $prompt != '8' ]] || [[ $prompt == '' ]]
do
    read -p "Please enter a valid option: " prompt
done 

if [ "$prompt" = "h" ]; 
then
eval "$_MENU_HELP"
fi

if [ "$prompt" = "i" ]; 
then
eval "$_MENU_INDEX"
fi

if [ "$prompt" = "q" ]; 
then
exit
fi

if [ "$prompt" = "1" ]; 
then
eval "$_MENU_AUDIO_VIDEO"
fi

if [ "$prompt" = "2" ]; 
then
eval "$_MENU_BROADCASTING"
fi

if [ "$prompt" = "3" ]; 
then
eval "$_MENU_COMMUNICATIONS"
fi

if [ "$prompt" = "4" ]; 
then
eval "$_MENU_GUI"
fi

if [ "$prompt" = "5" ]; 
then
eval "$_MENU_NETWORK_UTILITY"
fi

if [ "$prompt" = "6" ]; 
then
eval "$_MENU_SECURITY"
fi

if [ "$prompt" = "7" ]; 
then
eval "$_MENU_SERVERS"
fi


if [ "$prompt" = "8" ]; 
then
eval "$_MENU_UTILITY"
fi
