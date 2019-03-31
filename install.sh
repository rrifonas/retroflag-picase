#!/bin/bash


#Step 1) Check if root--------------------------------------
if [[ $EUID -ne 0 ]]; then
   echo "Please execute script as root." 
   exit 1
fi
#-----------------------------------------------------------

#Step 2) Install gpiozero module----------------------------
git clone https://github.com/TinkerBoard/gpio_lib_python.git
cd gpio_lib_python
#Build
sudo apt-get --yes --assumeyes install python-dev python2.7-dev python3-dev
#Install Python 2.7
sudo python setup.py install
#Install Python 3
sudo python3 setup.py install

#-----------------------------------------------------------

#Step 3) Download Python script-----------------------------
cd /opt/
sudo mkdir RetroFlag
cd /opt/RetroFlag
script=SafeShutdown.py

if [ -e $script ];
	then
		echo "Script SafeShutdown.py already exists. Doing nothing."
	else
		wget "https://github.com/rrifonas/retroflag-picase/raw/master/recalbox_SafeShutdown.py"
		sudo mv /opt/RetroFlag/recalbox_SafeShutdown.py SafeShutdown.py 
fi
#-----------------------------------------------------------

#Step 6) Enable Python script to run on start up------------
cd /etc/
RC=rc.local

if grep -q "sudo python3 \/opt\/RetroFlag\/SafeShutdown.py \&" "$RC";
	then
		echo "File /etc/rc.local already configured. Doing nothing."
	else
		sed -i -e "s/^exit 0/sudo python3 \/opt\/RetroFlag\/SafeShutdown.py \&\n&/g" "$RC"
		echo "File /etc/rc.local configured."
fi
#-----------------------------------------------------------

#Step 7) Reboot to apply changes----------------------------
echo "RetroFlag Pi Case installation done. Will now reboot after 3 seconds."
sleep 3
sudo reboot
#-----------------------------------------------------------









