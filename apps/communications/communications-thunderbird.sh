#!/usr/bin/env bash



read -p "
Would you like to install the Thunderbird Email client? <y/n>
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
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys A6DCF7707EBC211F && sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 9BDB3D89CE49EC21 && sudo apt-get update && sudo apt-get install thunderbird -y
	fi