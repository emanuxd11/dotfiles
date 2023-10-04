#!/bin/sh

# A dwm_bar function to read the battery level and status
# Joe Standring <git@joestandring.com>
# GNU GPLv3

dwm_battery () {
    # Change BAT1 to whatever your battery is identified as. Typically BAT0 or BAT1
    CHARGE=$(cat /sys/class/power_supply/BAT0/capacity)
    STATUS=$(cat /sys/class/power_supply/BAT0/status)

    # time left for full charge or of charge
    # TIME=$(upower -d | grep "time to " | awk '{print $4, $5}' | uniq)

    # color variables
    RED='\033[0;31m'
    NORMAL='\033[0m'

    printf "%s" "$SEP1"
    if [ "$IDENTIFIER" = "unicode" ]; then
        if [ "$STATUS" = "Charging" ]; then
            printf "  %s%%" "$CHARGE"
	else
    		if [ "$CHARGE" -gt 0 ] && [ "$CHARGE" -le 10 ]; then
            		printf "${red}${normal}  %s%%" "$CHARGE"
    		elif [ "$CHARGE" -gt 10 ] && [ "$CHARGE" -le 36 ]; then
            		printf "  %s%%" "$CHARGE"
    		elif [ "$CHARGE" -gt 36 ] && [ "$CHARGE" -le 64 ]; then
            		printf "  %s%%" "$CHARGE"
    		elif [ "$CHARGE" -gt 64 ] && [ "$CHARGE" -le 90 ]; then
            		printf "  %s%%" "$CHARGE"
    		else
            		printf "  %s%%" "$CHARGE"
		fi

		# for time left, but I don't want this now
		# printf " $TIME left"
	fi
    else
        printf "BAT %s%% %s" "$CHARGE" "$STATUS"
    fi
    printf "%s\n" "$SEP2"
}

dwm_battery

