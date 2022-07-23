#!/bin/bash

#This script is by bcorlett201660 and is provided as is. We are not responsible for any unepected results you may have. Please use with caution, respect, and integrity.

# Check if script is being run as root user.
if ! [ $(id -u) = 0 ]; then
   echo "The script need to be run as root." >&2
   exit 1
fi

if [ $SUDO_USER ]; then
    real_user=$SUDO_USER
else
    real_user=$(whoami)
fi

# Check if Whiptail is installed - used for tool interface.
REQUIRED_PKG_WHIPTAIL="whiptail"
PKG_OK=$(dpkg-query -W --showformat='${Status}\n' $REQUIRED_PKG_WHIPTAIL|grep "install ok installed")
if [ "" = "$PKG_OK" ]; then
  echo "Setting up $REQUIRED_PKG_WHIPTAIL."
  apt-get --yes install $REQUIRED_PKG_WHIPTAIL
  whiptail --version
fi

#Ensure that required directories exist
if [ -d "/var/log/big-bang" ] 
then
   continue
else
    mkdir /var/log/big-bang
fi

#Launch Disclaimer
launchDisclaimer(){
 
if (whiptail --title "Disclaimer" --yesno "Do you accept responsibility for the results that come from using this software?" 8 78); then
    continue
else
    whiptail --title "Goodbye" --msgbox "Okay, take care Friend. Be safe." 8 78
exit
fi
}

#Main Menu
mainMenu(){
ADVSEL=$(whiptail --title "Main Menu" --fb --menu "What can I help you with?" 25 78 16 \
        "1" "About" \
        "2" "Utilities" \
        "3" "Web Dev" 3>&1 1>&2 2>&3)
    case $ADVSEL in
        1)
            echo "About"
            whiptail --title "About" --msgbox "So you want to know more, eh?" 8 45
        ;;
        2)
            echo "Utilities"
            whiptail --title "Utilities" --msgbox "Here are some helpful tools." 8 45
        ;;
        3)
            echo "Web Dev"
            whiptail --title "Option 1" --msgbox "Yay, web servers!" 8 45
        ;;
    esac
}


launchDisclaimer

mainMenu




###Project Roadmap
# - Add option to install chromium-browser
# - Add communication with GPT-n
# - Intigrate Pinomite items https://gist.github.com/BetaStacks/b1385128ae4b86d0d51c3700c4c08a24
# - intigrate Git tools
# - Provide option for web based gui