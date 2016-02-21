#!/bin/bash

#asks for sudo password and keeps its session alive
sudo -v
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

#installs touchegg
apt-get update
apt-get install touchegg
apt-get autoremove

#copy touchegg configuration to default location
cp ./touchegg.config ~/.config/touchegg/

#creates .xprofile on ~/ to disable synaptics 3 fingers and run touchegg on session startup
cat <<EOF > ~/.xprofile
synclient ClickFinger2=0 & synclient TapButton2=0
synclient ClickFinger3=0 & synclient TapButton3=0

touchegg &
EOF

#reboots
reboot
