#!/usr/bin/env bash
read -p "
Do you want to add the Raspbian Stretch Sources? <y/n>
|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
|_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_|
|_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_|
|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|

:" prompt

if [ "$prompt" = "y" ]; 
then
echo "deb http://mirrordirector.raspbian.org/raspbian/ stretch main contrib non-free rpi" > /etc/apt/sources.list.d/stretch.list
	echo "APT::Default-Release \"jessie\";" > /etc/apt/apt.conf.d/99-default-release

echo "

Stretch sources have been added to /etc/apt/sources.list.d/stretch.list"
fi
