#!/usr/bin/env bash

if [ "$(whoami)" != "root" ]; 
then
	echo "Run script as ROOT please. (sudo !!)"
	exit
fi
