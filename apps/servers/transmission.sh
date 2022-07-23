#!/usr/bin/env bash

# Transmission/Transmission-Daemon
echo "

████████╗██████╗  █████╗ ███╗   ██╗███████╗███╗   ███╗██╗███████╗███████╗██╗ ██████╗ ███╗   ██╗
╚══██╔══╝██╔══██╗██╔══██╗████╗  ██║██╔════╝████╗ ████║██║██╔════╝██╔════╝██║██╔═══██╗████╗  ██║
   ██║   ██████╔╝███████║██╔██╗ ██║███████╗██╔████╔██║██║███████╗███████╗██║██║   ██║██╔██╗ ██║
   ██║   ██╔══██╗██╔══██║██║╚██╗██║╚════██║██║╚██╔╝██║██║╚════██║╚════██║██║██║   ██║██║╚██╗██║
   ██║   ██║  ██║██║  ██║██║ ╚████║███████║██║ ╚═╝ ██║██║███████║███████║██║╚██████╔╝██║ ╚████║
   ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝╚══════╝╚═╝     ╚═╝╚═╝╚══════╝╚══════╝╚═╝ ╚═════╝ ╚═╝  ╚═══╝   
"

echo "

  __  __                     
 |  \/  |                    
 | \  / |  ___  _ __   _   _ 
 | |\/| | / _ \| '_ \ | | | |
 | |  | ||  __/| | | || |_| |
 |_|  |_| \___||_| |_| \__,_|  

|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
|  h - Help                   |
|  m - Main Menu              |       
|  1 - Transmission           |
|  2 - Transmission Daemon    |
|  3 - Configure Daemon       |
|  b - Utility Menu	      |
|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
   "                                                
read -p "
What would you like to do?

:" prompt

while [[ $prompt != 'h' ]] && [[ $prompt != 'm' ]] && [[ $prompt != '1' ]] && [[ $prompt != '2' ]] && [[ $prompt != '3' ]] || [[ $prompt == '' ]]
do
    read -p "Please enter a valid option: " prompt
done 

if [ "$prompt" = "h" ]
then
eval "$_HELP_TRANSMISSION"
fi

if [ "$prompt" = "m" ]
then
eval "$_MENU_MAIN_RETURN"
fi

if [ "$prompt" = "1" ]
then
read -p "
Do you want to install Transmission? <y/n>
|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
|_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_|
|_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_|
|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|

:" prompt
if [ "$prompt" = "y" ]; 
then
	apt-get install transmission -y	
echo "
Transmission has been installed!
"
fi
sleep 1
echo "
Returning to the Tranmission Menu in:
"
eval "$_COUNTDOWN"
eval "$_TRANSMISSION"
fi


if [ "$prompt" = "2" ]
then
read -p "
Do you want to install Transmission Daemon? <y/n>
|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
|_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_|
|_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_|
|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|

:" prompt
if [ "$prompt" = "y" ]; 
then
	apt-get install transmission-daemon -y

echo "
Transmission Daemon has been installed!
"
fi

sleep 1
echo "
Returning to the Tranmission Menu in:
"
eval "$_COUNTDOWN"
eval "$_TRANSMISSION"
fi
	
if [ "$prompt" = "3" ]
then
read -p "
Do you want to configure Transmission Daemon for Pinomite Radio? <y/n>
|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
|_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_|
|_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_|
|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|

:" prompt
if [ "$prompt" = "y" ]; 
then
	truncate -s 0  /etc/transmission-daemon/settings.json
	service transmission-daemon stop
	echo '{
	    "alt-speed-down": 50, 
	    "alt-speed-enabled": false, 
	    "alt-speed-time-begin": 540, 
	    "alt-speed-time-day": 127, 
	    "alt-speed-time-enabled": false, 
	    "alt-speed-time-end": 1020, 
	    "alt-speed-up": 50, 
	    "bind-address-ipv4": "0.0.0.0", 
	    "bind-address-ipv6": "::", 
	    "blocklist-enabled": false, 
	    "blocklist-url": "http://www.example.com/blocklist", 
	    "cache-size-mb": 4, 
	    "dht-enabled": true, 
	    "download-dir": "/home/pi/Downloads", 
	    "download-limit": 100, 
	    "download-limit-enabled": 0, 
	    "download-queue-enabled": true, 
	    "download-queue-size": 5, 
	    "encryption": 1, 
	    "idle-seeding-limit": 0, 
	    "idle-seeding-limit-enabled": true, 
	    "incomplete-dir": "/home/pi/Downloads", 
	    "incomplete-dir-enabled": false, 
	    "lpd-enabled": false, 
	    "max-peers-global": 200, 
	    "message-level": 1, 
	    "peer-congestion-algorithm": "", 
	    "peer-id-ttl-hours": 6, 
	    "peer-limit-global": 200, 
	    "peer-limit-per-torrent": 50, 
	    "peer-port": 51413, 
	    "peer-port-random-high": 65535, 
	    "peer-port-random-low": 49152, 
	    "peer-port-random-on-start": false, 
	    "peer-socket-tos": "default", 
	    "pex-enabled": true, 
	    "port-forwarding-enabled": true, 
	    "preallocation": 1, 
	    "prefetch-enabled": 1, 
	    "queue-stalled-enabled": true, 
	    "queue-stalled-minutes": 30, 
	    "ratio-limit": 2, 
	    "ratio-limit-enabled": false, 
	    "rename-partial-files": true, 
	    "rpc-authentication-required": true, 
	    "rpc-bind-address": "0.0.0.0", 
	    "rpc-enabled": true, 
	    "rpc-password": "raspberry", 
	    "rpc-port": 9091, 
	    "rpc-url": "/transmission/", 
	    "rpc-username": "admin", 
	    "rpc-whitelist": "*.*.*.*", 
	    "rpc-whitelist-enabled": true, 
	    "scrape-paused-torrents-enabled": true, 
	    "script-torrent-done-enabled": false, 
	    "script-torrent-done-filename": "", 
	    "seed-queue-enabled": true, 
	    "seed-queue-size": 0, 
	    "speed-limit-down": 100, 
	    "speed-limit-down-enabled": false, 
	    "speed-limit-up": 0, 
	    "speed-limit-up-enabled": true, 
	    "start-added-torrents": true, 
	    "trash-original-torrent-files": false, 
	    "umask": 2, 
	    "upload-limit": 0, 
	    "upload-limit-enabled": 1, 
	    "upload-slots-per-torrent": 0, 
	    "utp-enabled": true
	}' | sudo tee -a /etc/transmission-daemon/settings.json
	service transmission-daemon start
	echo "service transmission-daemon restart" | sudo tee -a /etc/init.d/piRadioBoot.sh

echo "
Transmission has been configured!
"
fi

sleep 1
echo "
Returning to the Tranmission Menu in:
"
eval "$_COUNTDOWN"
eval "$_TRANSMISSION"
fi

if [ "$prompt" = "b" ]
then
eval "$_MENU_UTILITY"
fi