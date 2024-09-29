#!/bin/sh

CHOICE=$(
NEWT_COLORS='
    root=black,black
    window=,gray
    border=white,red
    textbox=white,black
    button=black,white
' \
whiptail --title "Pick your environment" --menu "Make your choice" 16 100 9 \
    "1)" "dwm" \
    "2)" "KDE Plasma" \
    "3)" "Don't start graphical environment" 3>&2 2>&1 1>&3
)
exitstatus=$?

start_env=true

if [ $exitstatus = 0 ]
then
    case $CHOICE in
        "1)")
            env="dwm"
        ;;
        "2)")
            env="startplasma-x11"
        ;;
        "3)")
            start_env=false
        ;;
    esac
else
    echo "Action cancelled, not starting graphical environment."
    start_env=false
fi

if [ $start_env = true ]
then
    # echo "$env" > /tmp/graph_env_opt
    [[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx /home/manu/.xinitrc $env
else
    clear
    figlet "Welcome to Arch Linux!"
    neofetch
fi
