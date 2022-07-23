#!/usr/bin/env $=bash
###This file will be used by other files than the _install.sh) once I can figure out how to set a relative path so it. Currently I would have to define a url in every script. I would like to avoid this so that self hosting is easier.

HOST_URL="https://pinomite.ml/"

###Define Script Pages

_BROADCASTING_DARKICE=$(curl -s -k ${HOST_URL}broadcasting-darkice.sh)

_BROADCASTING_EZSTREAM=$(curl -s -k ${HOST_URL}broadcasting-ezstream.sh)

_BROADCASTING_ICECAST2=$(curl -s -k ${HOST_URL}broadcasting-icecast2.sh)

_CHECK_ROOT=$(curl -s -k ${HOST_URL}_check-root.sh)

_COMMUNICATIONS_THUNDERBIRD=$(curl -s -k ${HOST_URL}communications-thunderbird.sh)

_COUNTDOWN=$(curl -s -k ${HOST_URL}_countdown.sh)

_GUI=$(curl -s -k ${HOST_URL}gui.sh)

_GUI_BROWSERS=$(curl -s -k ${HOST_URL}gui-browsers.sh)

_GUI_EDITORS=$(curl -s -k ${HOST_URL}gui-editors.sh)

_INSTALL=$(curl -s -k ${HOST_URL}_install.sh)

_KODI=$(curl -s -k ${HOST_URL}kodi.sh)

_SERVERS_APACHE2=$(curl -s -k ${HOST_URL}servers-apache2.sh)

_SERVERS_MYSQL_GRANT_PRIVILEGES=$(curl -s -k ${HOST_URL}servers-mysql-grant-privileges.sh)

_SERVERS_MYSQL_INSTALL=$(curl -s -k ${HOST_URL}servers-mysql-install.sh)

_SERVERS_MYSQL_NEW_DATABASE=$(curl -s -k ${HOST_URL}servers-mysql-new-database.sh)

_SERVERS_MYSQL_NEW_USER=$(curl -s -k ${HOST_URL}servers-mysql-new-user.sh)

_SERVERS_MONGODB=$(curl -s -k ${HOST_URL}servers-mongodb.sh)

_SERVERS_PHP=$(curl -s -k ${HOST_URL}servers-php.sh)

_SERVERS_PHPMYADMIN=$(curl -s -k ${HOST_URL}servers-phpmyadmin.sh)

_SERVERS_WORDPRESS=$(curl -s -k ${HOST_URL}servers-wordpress.sh)

_LOOPBACK=$(curl -s -k ${HOST_URL}loopback.sh)

_MUMBLE=$(curl -s -k ${HOST_URL}mumble.sh)

_PASSWORDS=$(curl -s -k ${HOST_URL}passwords.sh)

_PREINSTALL=$(curl -s -k ${HOST_URL}preinstall.sh)

_REBOOT=$(curl -s -k ${HOST_URL}reboot.sh)

_SERVERS_NEXTCLOUD=$(curl -s -k ${HOST_URL}servers-nextcloud.sh)

_STATIC_IP=$(curl -s -k ${HOST_URL}static-ip.sh)

_TRANSMISSION=$(curl -s -k ${HOST_URL}transmission.sh)

_UTILITY_GPARTED=$(curl -s -k ${HOST_URL}utility-gparted.sh)

_UTILITY_LIBREOFFICE=$(curl -s -k ${HOST_URL}utility-libreoffice.sh)

_UTILITY_STRETCH_SOURCES=$(curl -s -k ${HOST_URL}utility-stretch-sources.sh)

_UTILITY_UPDATE=$(curl -s -k ${HOST_URL}utility-update.sh)

_UTILITY_UPGRADE=$(curl -s -k ${HOST_URL}utility-upgrade.sh)



###Menu Files
_MENU_AUDIO_VIDEO=$(curl -s -k ${HOST_URL}_menu-audio-video.sh)

_MENU_BROADCASTING=$(curl -s -k ${HOST_URL}_menu-broadcasting.sh)

_MENU_COMMUNICATIONS=$(curl -s -k ${HOST_URL}_menu-communications.sh)

_MENU_GUI=$(curl -s -k ${HOST_URL}gui.sh)

_MENU_HELP=$(curl -s -k ${HOST_URL}_menu_help.sh)

_MENU_HELP_RETURN=$(curl -s -k ${HOST_URL}_menu-help-return.sh)

_MENU_INDEX=$(curl -s -k ${HOST_URL}_menu-index.sh)

_MENU_MAIN=$(curl -s -k ${HOST_URL}_menu-main.sh)

_MENU_MAIN_RETURN=$(curl -s -k ${HOST_URL}_menu-main-return.sh)

_MENU_NETWORK_UTILITY=$(curl -s -k ${HOST_URL}_menu-network-utility.sh)

_MENU_SECURITY=$(curl -s -k ${HOST_URL}_menu-security.sh)

_MENU_SERVERS=$(curl -s -k ${HOST_URL}_menu-servers.sh)

_MENU_SERVERS_MYSQL=$(curl -s -k ${HOST_URL}_menu-servers-mysql.sh)

_MENU_MYSQL=$(curl -s -k ${HOST_URL}_menu-servers-mysql.sh)

_MENU_NETWORK_UTILITY=$(curl -s -k ${HOST_URL}_menu-network-utility.sh)

_MENU_SECURITY=$(curl -s -k ${HOST_URL}_menu-security.sh)

_MENU_SERVERS=$(curl -s -k ${HOST_URL}_menu-servers.sh)

_MENU_UTILITY=$(curl -s -k ${HOST_URL}_menu-utility.sh)



###Help Docs

_HELP_AUDIO_VIDEO=$(curl -s -k ${HOST_URL}_help-audio-video.sh)

_HELP_BROADCASTING=$(curl -s -k ${HOST_URL}_help-broadcasting.sh)

_HELP_COMMUNICATIONS=$(curl -s -k ${HOST_URL}_help-communications.sh)

_HELP_GUI=$(curl -s -k ${HOST_URL}_help-gui.sh)

_HELP_KODI=$(curl -s -k ${HOST_URL}_help-kodi.sh)

_HELP_SERVERS=$(curl -s -k ${HOST_URL}_help-servers.sh)

_HELP_SERVERS_WORDPRESS=$(curl -s -k ${HOST_URL}_help-servers-wordpress.sh)

_HELP_LOOPBACK=$(curl -s -k ${HOST_URL}_help-loopback.sh)

_HELP_MUMBLE=$(curl -s -k ${HOST_URL}_help-mumble.sh)

_HELP_NETWORK_UTILITY=$(curl -s -k ${HOST_URL}_help-network-utility.sh)

_HELP_NEXTCLOUD=$(curl -s -k ${HOST_URL}_help-nextcloud.sh)

_HELP_PASSWORDS=$(curl -s -k ${HOST_URL}_help-passwords.sh)

_HELP_PREINSTALL=$(curl -s -k ${HOST_URL}_help-preinstall.sh)

_HELP_SECURITY=$(curl -s -k ${HOST_URL}_help-security.sh)

_HELP_SERVERS=$(curl -s -k ${HOST_URL}_help-servers.sh)

_HELP_STATIC_IP=$(curl -s -k ${HOST_URL}_help-static-ip.sh)

_HELP_TRANSMISSION=$(curl -s -k ${HOST_URL}_help-transmission.sh)

_HELP_UTILITY=$(curl -s -k ${HOST_URL}_help-utility.sh)

###Define Script Pages

export _CHECK_ROOT
export _COMMUNICATIONS_THUNDERBIRD
export _COUNTDOWN
export _GUI
export _GUI_BROWSERS
export _GUI_EDITOR
export _INSTALL
export _KODI
export _SERVERS_APACHE2
export _SERVERS_MYSQL_GRANT_PRIVILEGES
export _SERVERS_MYSQL_INSTALL
export _SERVERS_MYSQL_NEW_DATABASE
export _SERVERS_MYSQL_NEW_USER
export _SERVERS_MONGODB
export _SERVERS_PHP
export _SERVERS_PHPMYADMIN
export _SERVERS_WORDPRESS
export _LOOPBACK
export _MUMBLE
export _PASSWORDS
export _PREINSTALL
export _REBOOT
export _SERVERS_NEXTCLOUD
export _STATIC_IP
export _BROADCASTING_DARKICE
export _BROADCASTING_EZBROADCASTING
export _BROADCASTING_ICECAST2
export _TRANSMISSION
export _UTILITY_GPARTED
export _UTILITY_LIBREOFFICE
export _UTILITY_STRETCH_SOURCES
export _UTILITY_UPDATE
export _UTILITY_UPGRADE

###Menu Files
export _MENU_AUDIO_VIDEO
export _MENU_BROADCASTING
export _MENU_COMMUNICATIONS
export _MENU_HELP
export _MENU_HELP_RETURN
export _MENU_INDEX
export _MENU_MAIN
export _MENU_MAIN_RETURN
export _MENU_SECURITY
export _MENU_SERVERS
export _MENU_SERVERS_MYSQL
export _MENU_MYSQL
export _MENU_NETWORK_UTILITY
export _MENU_SECURITY
export _MENU_SERVERS
export _MENU_UTILITY


###Help Docs

export _HELP_AUDIO_VIDEO
export _HELP_BROADCASTING
export _HELP_GUI
export _HELP_KODI
export _HELP_SECURITY
export _HELP_SERVERS
export _HELP_SERVERS_WORDPRESS
export _HELP_LOOPBACK
export _HELP_MUMBLE
export _HELP_NETWORK_UTILITY
export _HELP_NEXTCLOUD
export _HELP_PASSWORDS
export _HELP_PREINSTALL
export _HELP_SECURITY
export _HELP_SERVERS
export _HELP_STATIC_IP
export _HELP_TRANSMISSION
export _HELP_UTILITY