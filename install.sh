#!/bin/bash

#installs touchegg
sudo apt-get update
sudo apt-get install touchegg
sudo apt-get autoremove

#copy touchegg configuration to default location
cp ./touchegg.conf ~/.config/touchegg/

# updates ~/.xprofile to start touchegg on session startup
echo 'touchegg &' >> ~/.xprofile
