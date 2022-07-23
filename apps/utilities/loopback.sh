#!/usr/bin/env bash

echo "
██╗      ██████╗  ██████╗ ██████╗ ██████╗  █████╗  ██████╗██╗  ██╗███████╗
██║     ██╔═══██╗██╔═══██╗██╔══██╗██╔══██╗██╔══██╗██╔════╝██║ ██╔╝██╔════╝
██║     ██║   ██║██║   ██║██████╔╝██████╔╝███████║██║     █████╔╝ ███████╗
██║     ██║   ██║██║   ██║██╔═══╝ ██╔══██╗██╔══██║██║     ██╔═██╗ ╚════██║
███████╗╚██████╔╝╚██████╔╝██║     ██████╔╝██║  ██║╚██████╗██║  ██╗███████║
╚══════╝ ╚═════╝  ╚═════╝ ╚═╝     ╚═════╝ ╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝╚══════╝                                                                          
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
|  1 - Enable Loopback     |
|  b - Audio & Video Menu  |
|~~~~~~~~~~~~~~~~~~~~~~~~~~|
   "                                                
read -p "
What would you like to do?

:" prompt  

while [[ $prompt != 'h' ]] && [[ $prompt != 'm' ]] && [[ $prompt != '1' ]] && [[ $prompt != 'b' ]] || [[ $prompt == '' ]]
do
    read -p "Please enter a valid option: " prompt
done 

if [ "$prompt" = "h" ]
then
eval "$_HELP_LOOPBACK"
fi

if [ "$prompt" = "m" ]
then
eval "$_MENU_MAIN_RETURN"
fi

if [ "$prompt" = "1" ]
then
read -p "
Do you want to setup ALSA Loopbacks? <y/n>
|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
|_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_|
|_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_|
|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|

:" prompt
if [ "$prompt" = "y" ]; 
then
	echo 'snd-aloop' | sudo tee -a /etc/modules
	echo 'alias snd-card-0 snd-aloop
	
	options snd-aloop enable=1,1 pcm_substreams=0,0' | sudo tee -a /etc/modprobe.d/sound.conf
	
	echo "
	Two ALSA Loopbacks have been enabled. Reboot your device for them to activate.
	"
	sleep 2
fi
echo "Returning to the Loopback Menu in:"
eval "$_COUNTDOWN"
eval "$_LOOPBACK"
fi

if [ "$prompt" = "b" ]
then
eval "$_MENU_AUDIO_VIDEO"
fi