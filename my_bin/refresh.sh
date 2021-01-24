#!/bin/bash

echo "System is about to be updated"
sleep 0.2
read -sp "Please type the sudo password for this machine: " sudo_passw

if [ -z "$sudo_passw" ]; then
    echo ""
    echo ""
    echo "You must type the sudo password to be able to execute"
    echo "this script"
    echo ""
    exit
else
    :
fi

echo ""
read -t 5 -n 1 -r -s -p $'Press any key to continue...\n'

echo ""
echo -e "Updating:\t\tsystem"
echo ""
echo ""
echo "$sudo_passw" | sudo -S apt-get -y update
echo ""
echo "System updated"
echo -e "status:\tdone"
echo "----------------------------↓↓--------------------------------"
echo ""

#The apt-get autoclean option, like apt-get clean, clears the local repository of retrieved package files,
#but it only removes files that can no longer be downloaded and are virtually useless. It helps to keep your cache
#from growing too large.
echo -e "Removing:\t\tunused files stored in the cache memory"
echo ""
echo ""
echo "$sudo_passw" | sudo -S apt-get -y autoclean
echo ""
echo "Unused cache memory files removed"
echo -e "status:\tdone"
echo "----------------------------↓↓--------------------------------"
echo ""

echo -e "Removing:\t\tpackages that were automatically installed and are no longer required"
echo ""
echo ""
echo "$sudo_passw" | sudo -S apt-get -y autoremove
echo ""
echo "Packages that are no longer required removed"
echo -e "status:\tdone"
echo "----------------------------↓↓--------------------------------"
echo ""

echo -e "Istanlling:\t\tkernel updates"
echo ""
echo ""
echo "$sudo_passw" | sudo -S apt-get -y dist-upgrade
echo ""
echo "Kernel is now uptodate"
echo -e "status:\tdone"
echo "----------------------------↓↓--------------------------------"
echo ""

echo -e "Fixing:\t\tbroken packages"
echo ""
echo "$sudo_passw" | sudo -S dpkg --configure -a
echo ""
echo "Broken packages fixed"
echo -e "status:\tdone"
echo "----------------------------↓↓--------------------------------"
echo ""

echo -e "Upgrading:\t\tsystem"
echo ""
echo ""
apt list --upgradable
echo ""
echo "$sudo_passw" | sudo -S apt-get -y upgrade
echo ""
echo "System upgraded"
echo -e "status\tdone"
echo "----------------------------↓↓--------------------------------"
echo ""

echo -e "Updating:\t\tsystem"
echo ""
echo ""
echo "$sudo_passw" | sudo -S apt-get -y update
echo ""
echo "System updated"
echo -e "status:\tdone"
echo "----------------------------↓↓--------------------------------"
echo ""

echo "Current terminal processes:"
ps
sleep 1s

echo ""
echo "Note: if you want to see all the current processes that are"
echo "running on your computer right now type the commap 'top'"
echo ""
exit


