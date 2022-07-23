#!/usr/bin/env bash

# Ezstream
echo "
███████╗███████╗███████╗████████╗██████╗ ███████╗ █████╗ ███╗   ███╗
██╔════╝╚══███╔╝██╔════╝╚══██╔══╝██╔══██╗██╔════╝██╔══██╗████╗ ████║
█████╗    ███╔╝ ███████╗   ██║   ██████╔╝█████╗  ███████║██╔████╔██║
██╔══╝   ███╔╝  ╚════██║   ██║   ██╔══██╗██╔══╝  ██╔══██║██║╚██╔╝██║
███████╗███████╗███████║   ██║   ██║  ██║███████╗██║  ██║██║ ╚═╝ ██║
╚══════╝╚══════╝╚══════╝   ╚═╝   ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚═╝     ╚═╝                                                                    

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

|~~~~~~~~~~~~~~~~~~~~~~~~~~~|
|  h - Help                 |
|  m - Main Menu            |       
|  1 - Install   	    |
|  2 - Configure  	    |
|  3 - Sample Files   	    |
|  b - Broadcasting Menu    |
|~~~~~~~~~~~~~~~~~~~~~~~~~~~|
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
eval "$_HELP_BROADCASTING"
fi

if [ "$prompt" = "m" ]
then
eval "$_MENU_MAIN_RETURN"
fi


if [ "$prompt" = "1" ]
then
read -p "
Do you want to install Ezstream? <y/n>
|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
|_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_|
|_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_|
|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
:" prompt
if [ "$prompt" = "y" ]; 
then
	apt-get install ezstream -y
	
echo "
Ezstream has been installed.
"
fi
sleep 1	
echo "
Returning to the Ezstream Menu in:"
eval "$_COUNTDOWN"
eval "$_BROADCASTING_EZSTREAM"
fi
	
	
if [ "$prompt" = "2" ]
then
read -p "
Do you want to configure Ezstream? <y/n>
|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
|_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_|
|_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_|
|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
:" prompt
if [ "$prompt" = "y" ]; 
then	

	touch /etc/piRadio.xml

	echo "
Please enter the mount point for your stream, followed by [ENTER]
|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
|_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_|
|_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_|
|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
:"
	read EZSTREAM_MOUNT_POINT

	echo "
Please enter the Source Password for your IceCast2 Server, followed by [ENTER]
|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
|_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_|
|_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_|
|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
:"
	read ICECAST_SOURCE_PASS

	echo "
Would like to shuffle the playlist? <y/n>
|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
|_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_|
|_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_|
|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
:"
	read EZSTREAM_SHUFFLE_I
	
	if [ "$EZSTREAM_SHUFFLE_I" = "y" ];
	then
	 EZSTREAM_SHUFFLE_O="1"
	 else
	 EZSTREAM_SHUFFLE_O="0"
	 fi

	echo "
Would like to repeat the playlist? <y/n>
|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
|_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_|
|_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_|
|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
:"
	read EZSTREAM_REPEAT_I
	
	if [ "EZSTREAM_REPEAT_I" = "y"]
	then
	 EZSTREAM_REPEAT_O="0"
	 else
	 EZSTREAM_REPEAT_O="1"
	 fi

	echo "
Enter a name for your stream, followed by [ENTER]
|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
|_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_|
|_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_|
|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
:"
	read EZSTREAM_NAME

	echo "
Enter the url for your stream (i.e. http://127/0.0.1), followed by [ENTER]
|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
|_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_|
|_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_|
|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
:"
	read EZSTREAM_URL

	echo "
Enter the genre of your stream, followed by [ENTER]
|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
|_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_|
|_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_|
|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
:"
	read EZSTREAM_GENRE

	echo "
Enter the description for your stream, followed by [ENTER]
|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
|_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_|
|_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_|
|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
:"
	read EZSTREAM_DESCRIPTION

	echo "
Would like the stream to be publicly listed? <y/n>
|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
|_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_|
|_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_|
|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
:"
	read EZSTREAM_PUBLIC_I
	
	if [ "EZSTREAM_PUBLIC_O" = "y" ]
	then
	EZSTREAM_PUBLIC_O="1"
	else
	EZSTREAM_PUBLIC_O="0"
	fi

	echo "<ezstream>
		<url>http://localhost:8000/$EZSTREAM_MOUNT_POINT</url>
		<sourcepassword>$ICECAST_SOURCE_PASS</sourcepassword>
		<format>MP3</format>
		<filename>/home/pi/Music/Ezstream/ezstream.m3u</filename>
		<shuffle>$EZSTREAM_SHUFFLE_O</shuffle> 
		<stream_once>$EZSTREAM_REPEAT_O</stream_once>
		<metadata_format>@s@</metadata_format>
		<svrinfoname>$EZSTREAM_NAME</svrinfoname>
		<svrinfourl>$EZSTREAM_URL</svrinfourl>
		<svrinfogenre>$EZSTREAM_GENRE</svrinfogenre>
		<svrinfodescription>$EZSTREAM_DESCRIPTION</svrinfodescription>
		<svrinfobitrate>16</svrinfobitrate>
		<svrinfochannels>2</svrinfochannels>
		<svrinfosamplerate>22050</svrinfosamplerate>
		<svrinfopublic>$EZSTREAM_PUBLIC</svrinfopublic>
	</ezstream>" | sudo tee -a /etc/piRadio.xml
	mkdir /home/pi/Music/Ezstream
	touch /home/pi/Music/Ezstream/ezstream.m3u
echo "
Ezstream has been configured.
"
fi
sleep 1	
echo "
Returning to the Ezstream Menu in:"
eval "$_COUNTDOWN"
eval "$_BROADCASTING_EZSTREAM"
fi

if [ "$prompt" = "3" ]
then
	read -p "
Would you like to download sample files for your steam? <y/n>
|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
|_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_|
|_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_|
|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
:" prompt
        if [ "$prompt" = "y" ]; 
then
	wget https://www.brandoncorlett.com/resources/ezstream-demo/bensound-memories.mp3 -P /home/pi/Music/Ezstream
	wget https://www.brandoncorlett.com/resources/ezstream-demo/bensound-goinghigher.mp3 -P /home/pi/Music/Ezstream
        wget https://www.brandoncorlett.com/resources/ezstream-demo/bensound-energy.mp3 -P /home/pi/Music/Ezstream
	echo "/home/pi/Music/Ezstream/bensound-memories.mp3
	/home/pi/Music/Ezstream/bensound-goinghigher.mp3
	/home/pi/Music/Ezstream/bensound-energy.mp3" | sudo tee -a /home/pi/Music/Ezstream/ezstream.m3u
	fi
	echo "/usr/bin/ezstream -c /etc/piRadio.xml &" | sudo tee -a /etc/init.d/piRadioBoot.sh
	
echo "
Ezstream demo files have been downloaded.
"
sleep 1	
echo "
Returning to the Eztstream Menu in:"
eval "$_COUNTDOWN"
eval "$_BROADCASTING_EZSTREAM"
else
sleep 1	
echo "
Returning to the Eztstream Menu in:"
eval "$_COUNTDOWN"
eval "$_BROADCASTING_EZSTREAM"
fi
sleep 1	
echo "
Returning to the Broadcasting Menu in:"
eval "$_COUNTDOWN"
eval "$_MENU_BROADCASTING"
fi

if [ "$prompt" = "b" ]
then
eval "$_MENU_BROADCASTING"
fi