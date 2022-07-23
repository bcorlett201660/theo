#!/usr/bin/env bash

# Kodi
echo "
██╗  ██╗ ██████╗ ██████╗ ██╗
██║ ██╔╝██╔═══██╗██╔══██╗██║
█████╔╝ ██║   ██║██║  ██║██║
██╔═██╗ ██║   ██║██║  ██║██║
██║  ██╗╚██████╔╝██████╔╝██║
╚═╝  ╚═╝ ╚═════╝ ╚═════╝ ╚═╝                            

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
|  1 - Install             |
|  2 - Configure           |
|  b - Audio & Video Menu  |
|~~~~~~~~~~~~~~~~~~~~~~~~~~|
   "                                                
read -p "
What would you like to do?

:" prompt

while [[ $prompt != 'h' ]] && [[ $prompt != 'm' ]] && [[ $prompt != '1' ]] && [[ $prompt != '2' ]] && [[ $prompt != 'b' ]] || [[ $prompt == '' ]]
do
    read -p "Please enter a valid option: " prompt
done 

if [ "$prompt" = "h" ]
then
eval "$_HELP_KODI"
fi

if [ "$prompt" = "m" ]
then
eval "$_MENU_MAIN_RETURN"
fi

if [ "$prompt" = "1" ]
then
read -p "
Do you want to install Kodi? <y/n>
|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
|_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_|
|_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_|
|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|

:" prompt
if [ "$prompt" = "y" ]; 
then
	apt-get install kodi kodi-eventclients-xbmc-send -y         
fi
	 echo "Returning to the Kodi Menu in:"
eval "$_COUNTDOWN"
eval "$_KODI"
fi

if [ "$prompt" = "2" ]
then
read -p "
Would you like kodi to start on boot? <y/n>
|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
|_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_|
|_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_|
|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|

:" prompt
  if [ "$prompt" = "y" ];
  then
if [ ! -f /etc/init.d/pinomiteBoot.sh ]; then
touch /etc/init.d/pinomiteBoot.sh
sudo chmod +x /etc/init.d/pinomiteBoot.sh
fi
echo "kodi" | sudo tee -a /etc/init.d/pinomiteBoot.sh

if [ ! -f /etc/init.d/pinomiteBoot.confirm ]; then
echo "/etc/init.d/piRadioBoot.sh" | sudo tee -a /home/pi/.config/lxsession/LXDE-pi/autostart
touch /etc/init.d/pinomiteBoot.confirm
echo "This file is just to indicate to pinomite that Pinomite's boot sctipt was already added to /home/pi/.config/lxsession/LXDE-pi/autostart" |sudo tee -a /etc/init.d/piNomiteBoot.confirm
fi
fi
	 if [ -e "/root/.kodi/userdata/guisettings.xml" ]
	 then
	 truncate -s 0  /root/.kodi/userdata/guisettings.xml
         fi
	 kodi-send --action="Quit"
  read -p  "
Would you like to enable the Web GUI for Kodi? <y/n>
|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
|_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_|
|_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_|
|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|

:" prompt
  if [ "$prompt" = "y" ]; 
then
  
  KODI_WEB_SERVER="true"
  
  echo "
Please enter a password for accessing the Web GUI. Leave blank for no password.
|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
|_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_|
|_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_|
|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|

:"
  read  KODI_WEB_SERVER_PASSWORD
  
  echo "
What port would you like to use for the Web GUI? (i.e. 8080)
|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
|_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_|
|_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_|
|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|

:"
  read KODI_WEB_SERVER_PORT
  
  echo "
What would you like to name your server? (i.e. Kodi)
|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
|_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_|
|_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_/~\_|
|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|

:"
  read KODI_WEB_SERVER_NAME   
  
  else
  KODI_WEB_SERVER="false"
  KODI_WEB_SERVER_PASSWORD=""
  KODI_WEB_SERVER_PORT="8080"
  KODI_WEB_SERVER_NAME="kodi"
  
fi 


echo "<settings>
    <accessibility>
        <audiohearing default="true">false</audiohearing>
        <audiovisual default="true">false</audiovisual>
        <subhearing default="true">false</subhearing>
    </accessibility>
    <addons>
        <unknownsources default="true">false</unknownsources>
    </addons>
    <audiocds>
        <autoaction default="true">0</autoaction>
        <ejectonrip default="true">true</ejectonrip>
        <encoder default="true">audioencoder.xbmc.builtin.wav</encoder>
        <recordingpath default="true"></recordingpath>
        <trackpathformat default="true">%A/%A - %B/[%N. ][%A - ]%T</trackpathformat>
        <usecddb default="true">true</usecddb>
    </audiocds>
    <audiooutput>
        <ac3passthrough default="true">true</ac3passthrough>
        <ac3transcode default="true">false</ac3transcode>
        <atempothreshold default="true">2</atempothreshold>
        <audiodevice default="true">ALSA:@:CARD=Loopback,DEV=0</audiodevice>
        <boostcenter default="true">0</boostcenter>
        <channels default="true">1</channels>
        <config default="true">2</config>
        <dspaddonsenabled default="true">false</dspaddonsenabled>
        <dtshdpassthrough default="true">false</dtshdpassthrough>
        <dtspassthrough default="true">false</dtspassthrough>
        <eac3passthrough default="true">false</eac3passthrough>
        <guisoundmode default="true">1</guisoundmode>
        <maintainoriginalvolume default="true">true</maintainoriginalvolume>
        <passthrough default="true">false</passthrough>
        <passthroughdevice default="true">PI:HDMI</passthroughdevice>
        <plladjust default="true">0</plladjust>
        <processquality default="true">30</processquality>
        <samplerate default="true">48000</samplerate>
        <stereoupmix default="true">false</stereoupmix>
        <streamnoise default="true">true</streamnoise>
        <streamsilence default="true">1</streamsilence>
        <truehdpassthrough default="true">false</truehdpassthrough>
        <volumesteps default="true">90</volumesteps>
    </audiooutput>
    <bluray>
        <playerregion default="true">1</playerregion>
    </bluray>
    <cache>
        <harddisk default="true">256</harddisk>
    </cache>
    <cacheaudio>
        <dvdrom default="true">256</dvdrom>
        <internet default="true">256</internet>
        <lan default="true">256</lan>
    </cacheaudio>
    <cachedvd>
        <dvdrom default="true">2048</dvdrom>
        <lan default="true">2048</lan>
    </cachedvd>
    <cacheunknown>
        <internet default="true">4096</internet>
    </cacheunknown>
    <cachevideo>
        <dvdrom default="true">2048</dvdrom>
        <internet default="true">4096</internet>
        <lan default="true">2048</lan>
    </cachevideo>
    <debug>
        <extralogging default="true">false</extralogging>
        <screenshotpath default="true"></screenshotpath>
        <setextraloglevel default="true"></setextraloglevel>
        <showloginfo default="true">false</showloginfo>
    </debug>
    <disc>
        <playback default="true">0</playback>
    </disc>
    <dvds>
        <automenu default="true">false</automenu>
        <autorun default="true">false</autorun>
        <playerregion default="true">0</playerregion>
    </dvds>
    <epg>
        <daystodisplay default="true">3</daystodisplay>
        <epgupdate default="true">120</epgupdate>
        <hidenoinfoavailable default="true">true</hidenoinfoavailable>
        <ignoredbforclient default="true">false</ignoredbforclient>
        <preventupdateswhileplayingtv default="true">false</preventupdateswhileplayingtv>
        <selectaction default="true">2</selectaction>
    </epg>
    <eventlog>
        <enabled default="true">true</enabled>
        <enablednotifications default="true">false</enablednotifications>
    </eventlog>
    <filelists>
        <allowfiledeletion default="true">false</allowfiledeletion>
        <browsearchives default="true">true</browsearchives>
        <ignorethewhensorting default="true">true</ignorethewhensorting>
        <showaddsourcebuttons default="true">true</showaddsourcebuttons>
        <showextensions default="true">true</showextensions>
        <showhidden default="true">false</showhidden>
        <showparentdiritems default="true">true</showparentdiritems>
    </filelists>
    <general>
        <addonbrokenfilter default="true">true</addonbrokenfilter>
        <addonforeignfilter default="true">false</addonforeignfilter>
        <addonnotifications default="true">false</addonnotifications>
        <addonupdates default="true">0</addonupdates>
        <settinglevel>1</settinglevel>
        <eventlog>
            <level>0</level>
            <showhigherlevels>true</showhigherlevels>
        </eventlog>
        <systemtotaluptime>0</systemtotaluptime>
    </general>
    <input>
        <asknewcontrollers default="true">true</asknewcontrollers>
        <controllerpoweroff default="true">false</controllerpoweroff>
        <enablemouse default="true">true</enablemouse>
        <rumblenotify default="true">false</rumblenotify>
    </input>
    <locale>
        <audiolanguage default="true">original</audiolanguage>
        <charset default="true">DEFAULT</charset>
        <country default="true">USA (12h)</country>
        <keyboardlayouts default="true">English QWERTY</keyboardlayouts>
        <language default="true">resource.language.en_gb</language>
        <longdateformat default="true">regional</longdateformat>
        <shortdateformat default="true">regional</shortdateformat>
        <speedunit default="true">regional</speedunit>
        <subtitlelanguage default="true">original</subtitlelanguage>
        <temperatureunit default="true">regional</temperatureunit>
        <timeformat default="true">regional</timeformat>
        <timezone default="true">Etc/UTC</timezone>
        <timezonecountry default="true"></timezonecountry>
        <use24hourclock default="true">regional</use24hourclock>
    </locale>
    <lookandfeel>
        <enablerssfeeds default="true">false</enablerssfeeds>
        <font default="true">Default</font>
        <rssedit default="true"></rssedit>
        <skin default="true">skin.estuary</skin>
        <skincolors default="true">SKINDEFAULT</skincolors>
        <skintheme default="true">SKINDEFAULT</skintheme>
        <skinzoom default="true">0</skinzoom>
        <soundskin default="true">resource.uisounds.kodi</soundskin>
        <startupwindow default="true">10000</startupwindow>
        <stereostrength default="true">5</stereostrength>
    </lookandfeel>
    <masterlock>
        <maxretries default="true">3</maxretries>
        <startuplock default="true">false</startuplock>
    </masterlock>
    <musicfiles>
        <findremotethumbs default="true">true</findremotethumbs>
        <librarytrackformat default="true"></librarytrackformat>
        <nowplayingtrackformat default="true"></nowplayingtrackformat>
        <trackformat default="true">[%N. ]%A - %T</trackformat>
        <usetags default="true">true</usetags>
    </musicfiles>
    <musiclibrary>
        <albumsscraper default="true">metadata.album.universal</albumsscraper>
        <artistsscraper default="true">metadata.artists.universal</artistsscraper>
        <backgroundupdate default="true">false</backgroundupdate>
        <downloadinfo default="true">false</downloadinfo>
        <overridetags default="true">false</overridetags>
        <showallitems default="true">true</showallitems>
        <showcompilationartists default="true">true</showcompilationartists>
        <updateonstartup default="true">false</updateonstartup>
    </musiclibrary>
    <musicplayer>
        <autoplaynextitem default="true">true</autoplaynextitem>
        <crossfade default="true">0</crossfade>
        <crossfadealbumtracks default="true">true</crossfadealbumtracks>
        <queuebydefault default="true">false</queuebydefault>
        <replaygainnogainpreamp default="true">89</replaygainnogainpreamp>
        <replaygainpreamp default="true">89</replaygainpreamp>
        <replaygaintype default="true">1</replaygaintype>
        <seekdelay default="true">750</seekdelay>
        <seeksteps default="true">-60,-30,-10,10,30,60</seeksteps>
        <visualisation default="true">visualization.spectrum</visualisation>
    </musicplayer>
    <mymusic>
        <defaultlibview default="true"></defaultlibview>
        <songthumbinvis default="true">false</songthumbinvis>
        <playlist>
            <repeat>false</repeat>
            <shuffle>false</shuffle>
        </playlist>
        <needsupdate>0</needsupdate>
    </mymusic>
    <myvideos>
        <extractchapterthumbs default="true">false</extractchapterthumbs>
        <extractflags default="true">false</extractflags>
        <extractthumb default="true">false</extractthumb>
        <flatten default="true">false</flatten>
        <replacelabels default="true">true</replacelabels>
        <selectaction default="true">1</selectaction>
        <stackvideos default="true">false</stackvideos>
        <watchmodemovies>0</watchmodemovies>
        <watchmodetvshows>0</watchmodetvshows>
        <watchmodemusicvideos>0</watchmodemusicvideos>
        <playlist>
            <repeat>false</repeat>
            <shuffle>false</shuffle>
        </playlist>
        <needsupdate>0</needsupdate>
    </myvideos>
    <network>
        <bandwidth default="true">0</bandwidth>
        <httpproxypassword default="true"></httpproxypassword>
        <httpproxyport default="true">8080</httpproxyport>
        <httpproxyserver default="true"></httpproxyserver>
        <httpproxytype default="true">0</httpproxytype>
        <httpproxyusername default="true"></httpproxyusername>
        <usehttpproxy default="true">false</usehttpproxy>
    </network>
    <pictures>
        <displayresolution default="true">14</displayresolution>
        <generatethumbs default="true">true</generatethumbs>
        <showvideos default="true">true</showvideos>
        <usetags default="true">true</usetags>
    </pictures>
    <powermanagement>
        <displaysoff default="true">0</displaysoff>
        <shutdownstate default="true">0</shutdownstate>
        <shutdowntime default="true">0</shutdowntime>
        <wakeonaccess default="true">false</wakeonaccess>
    </powermanagement>
    <pvrmanager>
        <backendchannelorder default="true">true</backendchannelorder>
        <hideconnectionlostwarning default="true">false</hideconnectionlostwarning>
        <syncchannelgroups default="true">true</syncchannelgroups>
        <usebackendchannelnumbers default="true">false</usebackendchannelnumbers>
    </pvrmanager>
    <pvrmenu>
        <closechannelosdonswitch default="true">true</closechannelosdonswitch>
        <displaychannelinfo default="true">5</displaychannelinfo>
        <iconpath default="true"></iconpath>
    </pvrmenu>
    <pvrparental>
        <duration default="true">300</duration>
        <enabled default="true">false</enabled>
        <pin default="true"></pin>
    </pvrparental>
    <pvrplayback>
        <channelentrytimeout default="true">0</channelentrytimeout>
        <confirmchannelswitch default="true">false</confirmchannelswitch>
        <enableradiords default="true">true</enableradiords>
        <fps default="true">0</fps>
        <playminimized default="true">true</playminimized>
        <scantime default="true">10</scantime>
        <signalquality default="true">true</signalquality>
        <startlast default="true">0</startlast>
        <trafficadvisory default="true">false</trafficadvisory>
        <trafficadvisoryvolume default="true">10</trafficadvisoryvolume>
    </pvrplayback>
    <pvrpowermanagement>
        <backendidletime default="true">15</backendidletime>
        <dailywakeup default="true">false</dailywakeup>
        <dailywakeuptime default="true">00:00:00</dailywakeuptime>
        <enabled default="true">false</enabled>
        <prewakeup default="true">15</prewakeup>
        <setwakeupcmd default="true"></setwakeupcmd>
    </pvrpowermanagement>
    <pvrrecord>
        <defaultlifetime default="true">99</defaultlifetime>
        <defaultpriority default="true">50</defaultpriority>
        <grouprecordings default="true">true</grouprecordings>
        <instantrecordaction default="true">0</instantrecordaction>
        <instantrecordtime default="true">120</instantrecordtime>
        <marginend default="true">0</marginend>
        <marginstart default="true">0</marginstart>
        <preventduplicateepisodes default="true">0</preventduplicateepisodes>
        <timernotifications default="true">true</timernotifications>
    </pvrrecord>
    <pvrtimers>
        <hidedisabledtimers default="true">false</hidedisabledtimers>
    </pvrtimers>
    <scrapers>
        <moviesdefault default="true">metadata.themoviedb.org</moviesdefault>
        <musicvideosdefault default="true">metadata.local</musicvideosdefault>
        <tvshowsdefault default="true">metadata.tvdb.com</tvshowsdefault>
    </scrapers>
    <screensaver>
        <mode default="true">screensaver.xbmc.builtin.black</mode>
        <time default="true">3</time>
        <usedimonpause default="true">true</usedimonpause>
        <usemusicvisinstead default="true">true</usemusicvisinstead>
    </screensaver>
    <services>
        <airplay default="true">false</airplay>
        <airplaypassword default="true"></airplaypassword>
        <airplayvideosupport default="true">true</airplayvideosupport>
        <airplayvolumecontrol default="true">true</airplayvolumecontrol>
        <devicename default="true">Kodi</devicename>
        <esallinterfaces default="true">false</esallinterfaces>
        <escontinuousdelay default="true">25</escontinuousdelay>
        <esenabled default="true">true</esenabled>
        <esinitialdelay default="true">750</esinitialdelay>
        <esmaxclients default="true">20</esmaxclients>
        <esport default="true">9777</esport>
        <esportrange default="true">10</esportrange>
        <upnpannounce default="true">true</upnpannounce>
        <upnpcontroller default="true">false</upnpcontroller>
        <upnplookforexternalsubtitles default="true">false</upnplookforexternalsubtitles>
        <upnprenderer default="true">false</upnprenderer>
        <upnpserver default="true">false</upnpserver>
        <useairplaypassword default="true">false</useairplaypassword>
        <webserver default="true">$KODI_WEB_SERVER</webserver>
        <webserverpassword default="true">$KODI_WEB_SERVER_PASSWORD</webserverpassword>
        <webserverport default="true">$KODI_WEB_SERVER_PORT</webserverport>
        <webserverusername default="true">$KODI_WEB_SERVER_NAME</webserverusername>
        <webskin default="true">webinterface.default</webskin>
        <zeroconf default="true">true</zeroconf>
    </services>
    <slideshow>
        <displayeffects default="true">true</displayeffects>
        <highqualitydownscaling default="true">false</highqualitydownscaling>
        <shuffle default="true">false</shuffle>
        <staytime default="true">5</staytime>
    </slideshow>
    <smb>
        <winsserver default="true">0.0.0.0</winsserver>
        <workgroup default="true">WORKGROUP</workgroup>
    </smb>
    <subtitles>
        <align default="true">0</align>
        <charset default="true">DEFAULT</charset>
        <color default="true">1</color>
        <custompath default="true"></custompath>
        <downloadfirst default="true">false</downloadfirst>
        <font default="true">arial.ttf</font>
        <height default="true">28</height>
        <languages default="true">English</languages>
        <movie default="true"></movie>
        <overrideassfonts default="true">false</overrideassfonts>
        <parsecaptions default="true">false</parsecaptions>
        <pauseonsearch default="true">true</pauseonsearch>
        <stereoscopicdepth default="true">0</stereoscopicdepth>
        <storagemode default="true">0</storagemode>
        <style default="true">1</style>
        <tv default="true"></tv>
    </subtitles>
    <system>
        <playlistspath>special://profile/playlists/</playlistspath>
    </system>
    <videolibrary>
        <actorthumbs default="true">true</actorthumbs>
        <backgroundupdate default="true">false</backgroundupdate>
        <flattentvshows default="true">1</flattentvshows>
        <groupmoviesets default="true">false</groupmoviesets>
        <groupsingleitemsets default="true">false</groupsingleitemsets>
        <showallitems default="true">true</showallitems>
        <showemptytvshows default="true">false</showemptytvshows>
        <showunwatchedplots default="true">true</showunwatchedplots>
        <tvshowsincludeallseasonsandspecials default="true">0</tvshowsincludeallseasonsandspecials>
        <tvshowsselectfirstunwatcheditem default="true">0</tvshowsselectfirstunwatcheditem>
        <updateonstartup default="true">false</updateonstartup>
    </videolibrary>
    <videoplayer>
        <adjustrefreshrate default="true">0</adjustrefreshrate>
        <autoplaynextitem default="true">false</autoplaynextitem>
        <errorinaspect default="true">0</errorinaspect>
        <hqscalers default="true">20</hqscalers>
        <limitguiupdate default="true">10</limitguiupdate>
        <preferdefaultflag default="true">true</preferdefaultflag>
        <prefervaapirender default="true">true</prefervaapirender>
        <quitstereomodeonstop default="true">true</quitstereomodeonstop>
        <rendermethod default="true">0</rendermethod>
        <seekdelay default="true">750</seekdelay>
        <seeksteps default="true">-600,-300,-180,-60,-30,-10,10,30,60,180,300,600</seeksteps>
        <stereoscopicplaybackmode default="true">0</stereoscopicplaybackmode>
        <stretch43 default="true">0</stretch43>
        <supportmvc default="true">true</supportmvc>
        <teletextenabled default="true">true</teletextenabled>
        <teletextscale default="true">true</teletextscale>
        <useamcodec default="true">true</useamcodec>
        <useamcodech264 default="true">0</useamcodech264>
        <useamcodecmpeg2 default="true">0</useamcodecmpeg2>
        <useamcodecmpeg4 default="true">800</useamcodecmpeg4>
        <usedisplayasclock default="true">false</usedisplayasclock>
        <usedxva2 default="true">true</usedxva2>
        <usemediacodec default="true">true</usemediacodec>
        <usemediacodecsurface default="true">true</usemediacodecsurface>
        <usemmal default="true">true</usemmal>
        <useomx default="true">true</useomx>
        <useomxplayer default="true">false</useomxplayer>
        <usevaapi default="true">true</usevaapi>
        <usevaapimpeg2 default="true">true</usevaapimpeg2>
        <usevaapimpeg4 default="true">true</usevaapimpeg4>
        <usevaapivc1 default="true">true</usevaapivc1>
        <usevdpau default="true">true</usevdpau>
        <usevdpaumixer default="true">true</usevdpaumixer>
        <usevdpaumpeg2 default="true">true</usevdpaumpeg2>
        <usevdpaumpeg4 default="true">false</usevdpaumpeg4>
        <usevdpauvc1 default="true">true</usevdpauvc1>
        <usevtb default="true">true</usevtb>
    </videoplayer>
    <videoscreen>
        <blankdisplays default="true">false</blankdisplays>
        <cms3dlut default="true"></cms3dlut>
        <cmsenabled default="true">false</cmsenabled>
        <cmsgamma default="true">220</cmsgamma>
        <cmsgammamode default="true">0</cmsgammamode>
        <cmslutsize default="true">6</cmslutsize>
        <cmsmode default="true">0</cmsmode>
        <cmsprimaries default="true">0</cmsprimaries>
        <cmswhitepoint default="true">0</cmswhitepoint>
        <delayrefreshchange default="true">0</delayrefreshchange>
        <displayprofile default="true"></displayprofile>
        <dither default="true">false</dither>
        <ditherdepth default="true">8</ditherdepth>
        <fakefullscreen default="true">true</fakefullscreen>
        <framepacking default="true">false</framepacking>
        <limitedrange default="true">false</limitedrange>
        <limitgui default="true">0</limitgui>
        <monitor default="true">Default</monitor>
        <noofbuffers default="true">2</noofbuffers>
        <preferedstereoscopicmode default="true">100</preferedstereoscopicmode>
        <resolution default="true">16</resolution>
        <screen default="true">0</screen>
        <screenmode default="true">DESKTOP</screenmode>
        <stereoscopicmode default="true">0</stereoscopicmode>
        <textures32 default="true">true</textures32>
    </videoscreen>
    <weather>
        <addon default="true"></addon>
        <currentlocation default="true">1</currentlocation>
    </weather>
    <window>
        <height default="true">480</height>
        <width default="true">720</width>
    </window>
    <viewstates>
        <musicfiles>
            <viewmode>720896</viewmode>
            <sortmethod>1</sortmethod>
            <sortorder>1</sortorder>
            <sortattributes>0</sortattributes>
        </musicfiles>
        <musiclastfm>
            <viewmode>65536</viewmode>
            <sortmethod>1</sortmethod>
            <sortorder>1</sortorder>
            <sortattributes>0</sortattributes>
        </musiclastfm>
        <musicnavalbums>
            <viewmode>65536</viewmode>
            <sortmethod>1</sortmethod>
            <sortorder>1</sortorder>
            <sortattributes>0</sortattributes>
        </musicnavalbums>
        <musicnavartists>
            <viewmode>65536</viewmode>
            <sortmethod>1</sortmethod>
            <sortorder>1</sortorder>
            <sortattributes>0</sortattributes>
        </musicnavartists>
        <musicnavsongs>
            <viewmode>65536</viewmode>
            <sortmethod>1</sortmethod>
            <sortorder>1</sortorder>
            <sortattributes>0</sortattributes>
        </musicnavsongs>
        <pictures>
            <viewmode>720896</viewmode>
            <sortmethod>1</sortmethod>
            <sortorder>1</sortorder>
            <sortattributes>0</sortattributes>
        </pictures>
        <programs>
            <viewmode>720896</viewmode>
            <sortmethod>1</sortmethod>
            <sortorder>1</sortorder>
            <sortattributes>0</sortattributes>
        </programs>
        <videofiles>
            <viewmode>720896</viewmode>
            <sortmethod>1</sortmethod>
            <sortorder>1</sortorder>
            <sortattributes>0</sortattributes>
        </videofiles>
        <videonavactors>
            <viewmode>65536</viewmode>
            <sortmethod>1</sortmethod>
            <sortorder>1</sortorder>
            <sortattributes>0</sortattributes>
        </videonavactors>
        <videonavepisodes>
            <viewmode>720896</viewmode>
            <sortmethod>23</sortmethod>
            <sortorder>1</sortorder>
            <sortattributes>0</sortattributes>
        </videonavepisodes>
        <videonavgenres>
            <viewmode>65536</viewmode>
            <sortmethod>1</sortmethod>
            <sortorder>1</sortorder>
            <sortattributes>0</sortattributes>
        </videonavgenres>
        <videonavmusicvideos>
            <viewmode>65536</viewmode>
            <sortmethod>1</sortmethod>
            <sortorder>1</sortorder>
            <sortattributes>0</sortattributes>
        </videonavmusicvideos>
        <videonavseasons>
            <viewmode>65536</viewmode>
            <sortmethod>1</sortmethod>
            <sortorder>1</sortorder>
            <sortattributes>0</sortattributes>
        </videonavseasons>
        <videonavtitles>
            <viewmode>65536</viewmode>
            <sortmethod>1</sortmethod>
            <sortorder>1</sortorder>
            <sortattributes>0</sortattributes>
        </videonavtitles>
        <videonavtvshows>
            <viewmode>65536</viewmode>
            <sortmethod>1</sortmethod>
            <sortorder>1</sortorder>
            <sortattributes>0</sortattributes>
        </videonavtvshows>
        <videonavyears>
            <viewmode>65536</viewmode>
            <sortmethod>1</sortmethod>
            <sortorder>1</sortorder>
            <sortattributes>0</sortattributes>
        </videonavyears>
    </viewstates>
    <resolutions />
    <defaultvideosettings>
        <interlacemethod>1</interlacemethod>
        <scalingmethod>1</scalingmethod>
        <noisereduction>0.000000</noisereduction>
        <postprocess>false</postprocess>
        <sharpness>0.000000</sharpness>
        <viewmode>0</viewmode>
        <zoomamount>1.000000</zoomamount>
        <pixelratio>1.000000</pixelratio>
        <verticalshift>0.000000</verticalshift>
        <volumeamplification>0.000000</volumeamplification>
        <outputtoallspeakers>false</outputtoallspeakers>
        <showsubtitles>true</showsubtitles>
        <brightness>50.000000</brightness>
        <contrast>50.000000</contrast>
        <gamma>20.000000</gamma>
        <audiodelay>0.000000</audiodelay>
        <subtitledelay>0.000000</subtitledelay>
        <nonlinstretch>false</nonlinstretch>
        <stereomode>0</stereomode>
    </defaultvideosettings>
    <defaultaudiosettings>
        <masterstreamtype>7</masterstreamtype>
        <masterstreamtypesel>7</masterstreamtypesel>
        <masterstreambase>0</masterstreambase>
        <masterprocess_0_0>0</masterprocess_0_0>
        <masterprocess_0_1>0</masterprocess_0_1>
        <masterprocess_0_2>0</masterprocess_0_2>
        <masterprocess_0_3>0</masterprocess_0_3>
        <masterprocess_0_4>0</masterprocess_0_4>
        <masterprocess_0_5>0</masterprocess_0_5>
        <masterprocess_0_6>0</masterprocess_0_6>
        <masterprocess_0_7>0</masterprocess_0_7>
        <masterprocess_0_8>0</masterprocess_0_8>
        <masterprocess_0_9>0</masterprocess_0_9>
        <masterprocess_0_10>0</masterprocess_0_10>
        <masterprocess_1_0>0</masterprocess_1_0>
        <masterprocess_1_1>0</masterprocess_1_1>
        <masterprocess_1_2>0</masterprocess_1_2>
        <masterprocess_1_3>0</masterprocess_1_3>
        <masterprocess_1_4>0</masterprocess_1_4>
        <masterprocess_1_5>0</masterprocess_1_5>
        <masterprocess_1_6>0</masterprocess_1_6>
        <masterprocess_1_7>0</masterprocess_1_7>
        <masterprocess_1_8>0</masterprocess_1_8>
        <masterprocess_1_9>0</masterprocess_1_9>
        <masterprocess_1_10>0</masterprocess_1_10>
        <masterprocess_2_0>0</masterprocess_2_0>
        <masterprocess_2_1>0</masterprocess_2_1>
        <masterprocess_2_2>0</masterprocess_2_2>
        <masterprocess_2_3>0</masterprocess_2_3>
        <masterprocess_2_4>0</masterprocess_2_4>
        <masterprocess_2_5>0</masterprocess_2_5>
        <masterprocess_2_6>0</masterprocess_2_6>
        <masterprocess_2_7>0</masterprocess_2_7>
        <masterprocess_2_8>0</masterprocess_2_8>
        <masterprocess_2_9>0</masterprocess_2_9>
        <masterprocess_2_10>0</masterprocess_2_10>
        <masterprocess_3_0>0</masterprocess_3_0>
        <masterprocess_3_1>0</masterprocess_3_1>
        <masterprocess_3_2>0</masterprocess_3_2>
        <masterprocess_3_3>0</masterprocess_3_3>
        <masterprocess_3_4>0</masterprocess_3_4>
        <masterprocess_3_5>0</masterprocess_3_5>
        <masterprocess_3_6>0</masterprocess_3_6>
        <masterprocess_3_7>0</masterprocess_3_7>
        <masterprocess_3_8>0</masterprocess_3_8>
        <masterprocess_3_9>0</masterprocess_3_9>
        <masterprocess_3_10>0</masterprocess_3_10>
        <masterprocess_4_0>0</masterprocess_4_0>
        <masterprocess_4_1>0</masterprocess_4_1>
        <masterprocess_4_2>0</masterprocess_4_2>
        <masterprocess_4_3>0</masterprocess_4_3>
        <masterprocess_4_4>0</masterprocess_4_4>
        <masterprocess_4_5>0</masterprocess_4_5>
        <masterprocess_4_6>0</masterprocess_4_6>
        <masterprocess_4_7>0</masterprocess_4_7>
        <masterprocess_4_8>0</masterprocess_4_8>
        <masterprocess_4_9>0</masterprocess_4_9>
        <masterprocess_4_10>0</masterprocess_4_10>
        <masterprocess_5_0>0</masterprocess_5_0>
        <masterprocess_5_1>0</masterprocess_5_1>
        <masterprocess_5_2>0</masterprocess_5_2>
        <masterprocess_5_3>0</masterprocess_5_3>
        <masterprocess_5_4>0</masterprocess_5_4>
        <masterprocess_5_5>0</masterprocess_5_5>
        <masterprocess_5_6>0</masterprocess_5_6>
        <masterprocess_5_7>0</masterprocess_5_7>
        <masterprocess_5_8>0</masterprocess_5_8>
        <masterprocess_5_9>0</masterprocess_5_9>
        <masterprocess_5_10>0</masterprocess_5_10>
        <masterprocess_6_0>0</masterprocess_6_0>
        <masterprocess_6_1>0</masterprocess_6_1>
        <masterprocess_6_2>0</masterprocess_6_2>
        <masterprocess_6_3>0</masterprocess_6_3>
        <masterprocess_6_4>0</masterprocess_6_4>
        <masterprocess_6_5>0</masterprocess_6_5>
        <masterprocess_6_6>0</masterprocess_6_6>
        <masterprocess_6_7>0</masterprocess_6_7>
        <masterprocess_6_8>0</masterprocess_6_8>
        <masterprocess_6_9>0</masterprocess_6_9>
        <masterprocess_6_10>0</masterprocess_6_10>
        <masterprocess_7_0>0</masterprocess_7_0>
        <masterprocess_7_1>0</masterprocess_7_1>
        <masterprocess_7_2>0</masterprocess_7_2>
        <masterprocess_7_3>0</masterprocess_7_3>
        <masterprocess_7_4>0</masterprocess_7_4>
        <masterprocess_7_5>0</masterprocess_7_5>
        <masterprocess_7_6>0</masterprocess_7_6>
        <masterprocess_7_7>0</masterprocess_7_7>
        <masterprocess_7_8>0</masterprocess_7_8>
        <masterprocess_7_9>0</masterprocess_7_9>
        <masterprocess_7_10>0</masterprocess_7_10>
    </defaultaudiosettings>
    <audio>
        <mute>false</mute>
        <fvolumelevel>1.000000</fvolumelevel>
    </audio>
</settings>" | sudo tee -a /root/.kodi/userdata/guisettings.xml

 echo "Returning to the Kodi Menu in:"
eval "$_COUNTDOWN"
eval "$_KODI"
fi


if [ "$prompt" = "b" ]
then
eval "$_MENU_AUDIO_VIDEO"
fi