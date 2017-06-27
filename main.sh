#!/bin/sh	

echo "Operating system: $(cat /etc/os-release | grep -w ID | cut -d '=' -f 2)"

#Command needed
command -v ps >/dev/null 2>&1 || { echo >&2 "I require ps command but it's not installed.  Aborting."; exit 1; }
command -v find >/dev/null 2>&1 || { echo >&2 "I require find but it's not installed.  Aborting."; exit 1; }
command -v pmap >/dev/null 2>&1 || { echo >&2 "I require pmap but it's not installed.  Aborting."; exit 1; }


#DEBIAN or UBUNTU
if 
cat /etc/os-release | grep -q 'ubuntu' ||
cat /etc/os-release | grep -q 'debian'
then
	( exec "./dpkg.sh" )	
fi	
		
#ALPINE
if 
cat /etc/os-release | grep -q 'alpine'
then
	( exec "./apk.sh" )
fi
		
#CENTOS or FEDORA or RHEL
if 
cat /etc/os-release | grep -q 'centos'
cat /etc/os-release | grep -q 'fedora'
cat /etc/os-release | grep -q 'rhel'
then
	( exec "./rpm.sh" )
fi

