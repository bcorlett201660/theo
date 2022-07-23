#!/usr/bin/env bash

echo "
███████╗████████╗ █████╗ ████████╗██╗ ██████╗    ██╗██████╗ 
██╔════╝╚══██╔══╝██╔══██╗╚══██╔══╝██║██╔════╝    ██║██╔══██╗
███████╗   ██║   ███████║   ██║   ██║██║         ██║██████╔╝
╚════██║   ██║   ██╔══██║   ██║   ██║██║         ██║██╔═══╝ 
███████║   ██║   ██║  ██║   ██║   ██║╚██████╗    ██║██║     
╚══════╝   ╚═╝   ╚═╝  ╚═╝   ╚═╝   ╚═╝ ╚═════╝    ╚═╝╚═╝                                                                 
"

echo "

  __  __                     
 |  \/  |                    
 | \  / |  ___  _ __   _   _ 
 | |\/| | / _ \| '_ \ | | | |
 | |  | ||  __/| | | || |_| |
 |_|  |_| \___||_| |_| \__,_|  

|~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
|  h - Help                  |
|  m - Main Menu             |       
|  1 - eth0                  |
|  2 - wlan0      	     |
|  3 - Other                 |
|  b - Network Utility Menu  |
|~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
   "                                                
read -p "
What would you like to do?

:" prompt

while [[ $prompt != 'h' ]] && [[ $prompt != 'm' ]] && [[ $prompt != '1' ]] && [[ $prompt != '2' ]] && [[ $prompt != '3' ]] && [[ $prompt != 'b' ]] || [[ $prompt == '' ]]
do
    read -p "Please enter a valid option: " prompt
done 

if [ "$prompt" = "h" ]
then
eval "$_HELP_STATIC_IP"
fi

if [ "$prompt" = "m" ]
then
eval "$_MENU_MAIN_RETURN"
fi

### ETH0 ###

if [ "$prompt" = "1" ]; 
then

read -p "
Do you want to set a static ip for eth0?
|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
|_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_|
|_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_|
|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|

:" prompt

if [ "$prompt" = "y" ]; 
then
echo "
Please enter the ip address of your router (i.e. 192.168.0.1), followed by [ENTER]
|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
|_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_|
|_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_|
|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|

:"

read ROUTER_IP
		
echo "
Please enter the static ip address to be used for the interface eth0, followed by [ENTER]
|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
|_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_|
|_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_|
|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|

:"

read ETH_IP
		
echo "interface eth0
			 
static ip_address=$ETH_IP/24
static routers=$ROUTER_IP
static domain_name_servers=$ROUTER_IP"| sudo tee -a /etc/dhcpcd.conf
fi
sleep 2
echo "
Returning to the Static IP Menu in:"
eval "$_COUNTDOWN"
eval "$_STATIC_IP"
fi

### WLAN0 ###

if [ "$prompt" = "2" ]; 
then

read -p "
Do you want to set a static ip for wlan0?
|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
|_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_|
|_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_|
|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|

:" prompt

if [ "$prompt" = "y" ]; 
then

echo "
Please enter the ip address of your router (i.e. 192.168.0.1), followed by [ENTER]
|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
|_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_|
|_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_|
|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|

:"

read ROUTER_IP
		
echo "
Please enter the static ip address to be used for the interface wlan0, followed by [ENTER]
|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
|_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_|
|_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_|
|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|

:"

read WLAN_IP
		
echo "interface wlan0
			 
static ip_address=$WLAN_IP/24
static routers=$ROUTER_IP
static domain_name_servers=$ROUTER_IP"| sudo tee -a /etc/dhcpcd.conf
fi
sleep 2
echo "
Returning to the Static IP Menu in:"
eval "$_COUNTDOWN"
eval "$_STATIC_IP"
fi


### OTHER  ###
	
if [ "$prompt" = "3" ]; 
then


echo "
Please enter the name of the interface (i.e. wlan1), followed by [ENTER]
|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
|_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_|
|_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_|
|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|

:"

read OTHER_INTERFACE

read -p "
Do you want to set a static ip for $OTHER_INTERFACE?
|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
|_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_|
|_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_|
|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|

:" prompt

if [ "$prompt" = "y" ]; 
then

		
echo "
Please enter the static ip address to be used for the interface $OTHER_INTERFACE, followed by [ENTER]
|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
|_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_|
|_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_|
|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|

:"

read OTHER_INTERFACE_IP
		
echo "
Please enter the ip address of your router (i.e. 192.168.0.1), followed by [ENTER]
|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
|_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_|
|_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_|
|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|

:"

read ROUTER_IP
		
echo "interface $OTHER_INTERFACE
			 
static ip_address=$OTHER_INTERFACE_IP/24
static routers=$ROUTER_IP
static domain_name_servers=$ROUTER_IP"| sudo tee -a /etc/dhcpcd.conf
fi
sleep 2
echo "
Returning to the Static IP Menu in:"
eval "$_COUNTDOWN"
eval "$_STATIC_IP"
fi

if [ "$prompt" = "b" ]
then
eval "$_MENU_NETWORK_UTILITY"
fi
