#!/bin/bash
#upadte
echo "UPDATING *******************************************************************"
sudo apt-get update && sudo apt-get upgrade

echo -en "\007"
echo -en "\007"
echo -en "\007"

echo "Starting Dependency Install **************************************************"
#dependencies

# required packages:
sudo apt-get install python-configobj python-imaging python-cheetah

# required if hardware is serial or USB:
sudo apt-get install python-serial python-usb

# required if using MySQL:
sudo apt-get install mysql-client python-mysqldb

# required if using FTP on Raspbian systems:
sudo apt-get install ftp

# optional for extended almanac information:
sudo apt-get install python-dev python-pip ngnix
sudo pip install pyephem

echo -en "\007"
echo -en "\007"
echo -en "\007"

echo "Install Weewx **************************************************************************"
#Configure apt
wget -qO - http://weewx.com/keys.html | sudo apt-key add -
wget -qO - http://weewx.com/apt/weewx.list | sudo tee /etc/apt/sources.list.d/weewx.list

#Install
sudo apt-get update
sudo apt-get install weewx

echo -en "\007"
echo -en "\007"
echo -en "\007"

echo " Testing WeeWx **************************************************************************"
#Start
sudo /etc/init.d/weewx start
#Stop
sudo /etc/init.d/weewx stop
echo " ************************************DONE***************************************************"
