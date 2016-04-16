#!/bin/bash

#asks for sudo password and keeps its session alive
sudo -v
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

#installs touchegg
apt-get update
apt-get install touchegg
apt-get autoremove

#copy touchegg configuration to default location
cp ./touchegg.conf ~/.config/touchegg/

# updates ~/.xprofile to start touchegg on session startup
echo 'touchegg &' >> ~/.xprofile
