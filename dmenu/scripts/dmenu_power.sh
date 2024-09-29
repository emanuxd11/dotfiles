#!/bin/sh
# dmenu power menu
# icons: ⏻ 󰒲 󰍃

if pgrep -x dmenu > /dev/null; then
    killall dmenu
    exit 0
fi


OPT=$(echo "⏻ poweroff\n󰒲 suspend\n󰍃 logout\n reboot" | dmenu -c -g 1 -l 4 -fn 'JetBrains Mono-14' -X 10 -Y 904 -W 133)

case $OPT in
    '⏻ poweroff') systemctl poweroff ;;
    '󰒲 suspend') systemctl suspend   ;;
    '󰍃 logout') killall Xorg         ;;
    ' reboot') systemctl reboot     ;;
    *) ;;
esac
