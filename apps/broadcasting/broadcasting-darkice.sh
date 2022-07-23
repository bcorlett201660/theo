#!/usr/bin/env bash

echo "
    ██████╗  █████╗ ██████╗ ██╗  ██╗██╗ ██████╗███████╗              
    ██╔══██╗██╔══██╗██╔══██╗██║ ██╔╝██║██╔════╝██╔════╝              
    ██║  ██║███████║██████╔╝█████╔╝ ██║██║     █████╗                
    ██║  ██║██╔══██║██╔══██╗██╔═██╗ ██║██║     ██╔══╝                
    ██████╔╝██║  ██║██║  ██║██║  ██╗██║╚██████╗███████╗              
    ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝ ╚═════╝╚══════╝              
                           ██╗                                       
                           ██║                                       
                        ████████╗                                    
                        ██╔═██╔═╝                                    
                        ██████║                                      
                        ╚═════╝                                      
██████╗  █████╗ ██████╗ ██╗  ██╗███████╗███╗   ██╗ ██████╗ ██╗    ██╗
██╔══██╗██╔══██╗██╔══██╗██║ ██╔╝██╔════╝████╗  ██║██╔═══██╗██║    ██║
██║  ██║███████║██████╔╝█████╔╝ ███████╗██╔██╗ ██║██║   ██║██║ █╗ ██║
██║  ██║██╔══██║██╔══██╗██╔═██╗ ╚════██║██║╚██╗██║██║   ██║██║███╗██║
██████╔╝██║  ██║██║  ██║██║  ██╗███████║██║ ╚████║╚██████╔╝╚███╔███╔╝
╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═══╝ ╚═════╝  ╚══╝╚══╝                                                                      
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
|  1 - Install DarkIce      |
|  2 - Install DarkSnow     |
|  3 - Configure DarkIce    |
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

if [ "$prompt" = "h" ];
then
eval "$_HELP_BROADCASTING"
fi

if [ "$prompt" = "m" ];
then
eval "$_MENU_MAIN_RETURN"
fi

if [ "$prompt" = "b" ];
then
eval "$_MENU_BROADCASTING"
fi

if [ "$prompt" = "1" ];
then
read -p "
Do you want to install Darkice? <y/n>
|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
|_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_|
|_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_|
|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
:" prompt
if [ "$prompt" = "y" ]; 
then
	apt-get install darkice -y
	touch /etc/darkice.cfg
fi
echo "
Returning to the Darkice Menu in:"
eval "$_COUNTDOWN"
eval "$_BROADCASTING_DARKICE"
fi

if [ "$prompt" = "2" ];
then
read -p "
Do you want to install DarkSnow? <y/n>
|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
|_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_|
|_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_|
|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
:" prompt
if [ "$prompt" = "y" ]; 
then
	apt-get install darksnow -y
fi
echo "
Returning to the Darkice Menu in:"
eval "$_COUNTDOWN"
eval "$_BROADCASTING_DARKICE"
fi

if [ "$prompt" = "3" ];
then
read -p "
Do you want to configure Darkice? <y/n>
|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
|_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_|
|_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_|
|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
:" prompt
if [ "$prompt" = "y" ]; 
then
echo "
Is your stream input is mono or stereo? <m/s>
|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
|_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_|
|_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_|
|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
:"
read STREAM_CHANELLS_I

if [ "STREAM_CHANELLS_I" = "m" ];
then
STREAM_CHANELLS_O="1"
else
STREAM_CHANELLS_O="2"
fi

echo "
Enter a number between 0.1 and 1 to set the quality, followed by [ENTER];
|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
|_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_|
|_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_|
|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
:"
read STREAM_QUALITY

echo "
Enter the Source Password to your IceCast2 server, followed by [ENTER];
|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
|_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_|
|_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_|
|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
:"
read ICECAST_SOURCE_PASS

echo "
Enter the mount point to be used for your stream, followed by [ENTER];
|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
|_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_|
|_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_|
|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
:"
read MOUNT_POINT

echo "
Enter a name for your stream, followed by [ENTER];
|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
|_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_|
|_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_|
|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
:"
read STREAM_NAME

echo "
Enter a description for your stream, followed by [ENTER];
|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
|_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_|
|_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_|
|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
:"
read STREAM_DESCRIPTION

echo "
Enter the url related to your stream. (i.e. http://127.0.0.1), followed by [ENTER];
|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
|_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_|
|_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_|
|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
:"
read STREAM_URL

echo "
Enter the genre of your stream, followed by [ENTER];
|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
|_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_|
|_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_|
|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
:"
read STREAM_GENRE

echo "
Would you like your stream to be publicly listed no/yes, followed by [ENTER];
|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
|_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_|
|_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_|
|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
:"
read STREAM_PUBLIC

echo "
Please enter a location and file name for your recordins to be dumped. (i.e. /home/pi/Desktop/stream_recording.mp3), followed by [ENTER];
|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
|_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_|
|_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_|
|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
:"
read STREAM_LOCALDUMP


echo "# see the darkice.cfg man page for details
# this section describes general aspects of the live streaming session
[general];
duration      = 0                # duration of encoding, in seconds. 0 means forever
bufferSecs    = 1                # size of internal slip buffer, in seconds
reconnect     = yes              # reconnect to the server(s) if disconnected
# this section describes the audio input that will be streamed
[input];
device        = hw:0,0           # Alsa soundcard device for the audio input
sampleRate    = 44100            # sample rate in Hz. try 11025, 22050 or 44100
bitsPerSample = 16               # bits per sample. try 16
channel       = $STREAM_CHANELLS                # channels. 1 = mono, 2 = stereo
# this section describes a streaming connection to an IceCast2 server
# there may be up to 8 of these sections, named [icecast2-0]; ... [icecast2-7];
# these can be mixed with [icecast-x]; and [shoutcast-x]; sections
[icecast2-0];
bitrateMode   = vbr              # variable bit rate
format        = mp3              # format of the stream: mp3
quality       = $STREAM_QUALITY              # quality of the stream sent to the server
server        = localhost        # host name of the server
port          = 8000             # port of the IceCast2 server, usually 8000
password      = $ICECAST_SOURCE_PASS  # source password to the IceCast2 server
mountPoint    = $MOUNT_POINT         # mount point of this stream on the IceCast2 server
name          = $STREAM_NAME            # name of the stream
description   = $STREAM_DESCRIPTION # description of the stream
url           = $STREAM_URL URL related to the stream
genre         = $STREAM_GENRE         # genre of the stream
public        = $STREAM_PUBLIC               # advertise this stream?
localDumpFile = $STREAM_LOCALDUMP    # Record also to a file" | sudo tee -a /etc/darkice.cfg
echo "darkice" | sudo tee -a /etc/init.d/piRadioBoot.sh
fi
fi
echo "
Returning to the Darkice Menu in:"
eval "$_COUNTDOWN"
eval "$_BROADCASTING_DARKICE"
fi

if [ "$prompt" = "b" ];
then
eval "$_MENU_BROADCASTING"
fi