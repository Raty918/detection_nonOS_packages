#!/bin/sh	

#DEBIAN or UBUNTU
if 
cat /etc/os-release | grep -q 'ubuntu' ||
cat /etc/os-release | grep -q 'debian'
then
	( exec "./detection.sh" )	
fi
	
		#ALPINE
		if cat /etc/os-release | grep -q 'alpine'
		then
			apk info -W $line >> tmpOS.list 2>> tmpnonOS.list
		fi
		
		#CENTOS
		if cat /etc/os-release | grep -q 'centos'
		then
			rpm -qf $line >> tmpOS.list 2>> tmpnonOS.list
		fi
