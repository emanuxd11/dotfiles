#!/bin/sh

VOL=$(pamixer --get-volume)
STATE=$(pamixer --get-mute)

if [ "$STATE" = "true" ] || [ "$VOL" -eq 0 ]; then
    printf "󰖁"
elif [ "$VOL" -gt 0 ] && [ "$VOL" -le 50 ]; then
    printf "󰖀 %s%%" "$VOL"
else
    printf "󰕾 %s%%" "$VOL"
fi

