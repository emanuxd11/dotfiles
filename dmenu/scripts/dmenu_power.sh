#!/bin/sh
# dmenu power menu
#icons: ⏻ 󰒲 

OPT=$(echo -e "⏻ poweroff\n󰒲 suspend\n reboot" | dmenu -c -g 1 -l 3 -fn 'JetBrains Mono-14' -X 12 -Y 934 -W 133)

case $OPT in
    '⏻ suspend') sudo systemctl suspend   ;;
    '󰒲 poweroff') sudo systemctl poweroff ;;
    ' reboot') sudo systemctl reboot     ;;
    *) ;;
esac
