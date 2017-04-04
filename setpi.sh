#!bin/bash
#upadte

echo "UPDATING *******************************************************************"
sudo apt-get update && sudo apt-get upgrade
echo -en "\007"
echo -en "\007"
echo -en "\007"

echo "Starting Dependency Install **************************************************"
#dependencies

# required packages:
sudo apt-get install python-configobj
sudo apt-get install python-cheetah
sudo apt-get install python-imaging

# required if hardware is serial or USB:
sudo apt-get install python-serial
sudo apt-get install python-usb

# required if using MySQL:
sudo apt-get install mysql-client
sudo apt-get install python-mysqldb

# required if using FTP on Raspbian systems:
sudo apt-get install ftp

# optional for extended almanac information:
sudo apt-get install python-dev
sudo apt-get install python-pip
sudo pip install pyephem
sudo apt-get install ftp

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

# Resources used
# 1: https://github.com/weewx/weewx/wiki/Raspberry-Pi
# 2: https://github.com/weewx/weewx/wiki/
# 3: http://www.weewx.com/docs/debian.htm



#Things Still need to set up and install a light weight websever
#ngix or lighttpd

#then need to adjest and configre the RTC issue with Raspi Pi
# see -> https://github.com/weewx/weewx/wiki/pi-RTC-with-raspbian-jessie
