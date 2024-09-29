#!/bin/sh

# Set random Wallpaper 
/home/manu/.local/bin/set_wallpaper.sh &

# Status bar
slstatus &

# Compositor
picom -f &

# Bluetooth Manager Applet
blueman-applet &

# Audio Manager Applet
pnmixer &

# Network Manager Applet
nm-applet &

# Blue light filter
redshift -t 6100:3900 -l 41.14961:-8.61099 & 

exec dwm &

