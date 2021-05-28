#!/bin/sh
USERNAME=`logname`
mkdir -p -v "/home/$USERNAME/.lsws/" "/home/$USERNAME/.lsws/config/" "/home/$USERNAME/.lsws/logs/"
UID_TEMP=`id -u $USER`
if [ "$UID_TEMP" == 0 ];then
	if [ ! -e /usr/local/man/man1/ ];then
		mkdir -v /usr/local/man/man1/
	fi
	mv -v ./lsws.1.gz /usr/local/man/man1/
	mv -v ./lsws.1 /usr/local/man/man1/
	if [ -d "/home/$USERNAME/.lsws/" ] && [ -d "/home/$USERNAME/.lsws/config/" ] && [ -d "/home/$USERNAME/.lsws/logs/" ];then
		touch ./Seasonal.defaults
		mv -v ./lsws.defaults "/home/${USERNAME}/.lsws/config/"
		mv -v ./Seasonal.defaults "/home/${USERNAME}/.lsws/config/"
		chown -R $USERNAME /home/${USERNAME}/.lsws
	fi
fi
