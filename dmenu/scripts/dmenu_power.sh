#!/bin/sh
# dmenu power menu
# icons: ⏻ 󰒲 

if pgrep -x dmenu > /dev/null; then
    killall dmenu
    exit 0
fi


OPT=$(echo -e "⏻ poweroff\n󰒲 suspend\n reboot" | dmenu -c -g 1 -l 3 -fn 'JetBrains Mono-14' -X 10 -Y 932 -W 133)

case $OPT in
    '⏻ poweroff') systemctl poweroff ;;
    '󰒲 suspend') systemctl suspend  ;;
    ' reboot') systemctl reboot     ;;
    *) ;;
esac
