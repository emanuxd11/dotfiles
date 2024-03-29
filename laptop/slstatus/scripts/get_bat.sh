#!/bin/sh

CHARGE=$(cat /sys/class/power_supply/BAT0/capacity)
STATUS=$(cat /sys/class/power_supply/BAT0/status)

printf "%s" "$SEP1"
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
fi
