#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then







    xrdb -merge $sysresources

fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# dwm status
/home/manu/.suckless/dwm-bar/dwm_bar.sh &

# Keymap
setxkbmap pt &

# Compositor
picom -f &

# Wallpaper
nitrogen --restore &

# don't blind me with brightness
brightnessctl s $(cat ~/.config/MyDogshitBrightnessThing/lastBrightness) &

# redshift (blue light filter)
# for Bari coordinates
# redshift -t 6500:3900 -l 41.14961:-8.61099 &
# for Porto coordinates
redshift -t 6100:3900 -l 41.14961:-8.61099 &

# Set the GTK theme to a dark theme
export GTK_THEME=Arc-Dark

# Init nmgui so it goes in the systray
nm-applet &

# Init pasystray (sys tray applet for pulseaudio)
pasystray &

# Loop
while true; do
	dwm >/dev/null 2>&1
done

# Exec dwm
exec dwm
