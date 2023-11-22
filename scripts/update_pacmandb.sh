#!/bin/bash
# this is pretty much useless. only point of this script is for the number
# of updates that shows in my bottom panel to be somewhat accurate by updating
# day with the help of a cron job that runs this every hour
# goes in ~/.local/bin

log_date="$(cat /var/log/pacmanscript.log | tail -n 1)"
log_date=${log_date:1:19}
log_timestamp=$(date -d "$log_date" +"%s")
current_timestamp=$(date +"%s")
time_diff=$((current_timestamp - log_timestamp))
threshold=$((23 * 60 * 60)) # intuitively this would be 24h, but due to the couple of seconds
# it takes to run the update, it would never be able to run 24h later (always 25). 
# So this is the easiest solution.

if [ "$time_diff" -ge "$threshold" ] || [ ! -f "/var/log/pacmanscript.log" ]; then
    sudo pacman -Sy -y
    UPD=$(pacman -Qu | wc -l)
    echo "[$(date -u +'%Y-%m-%d %H:%M:%S %Z')] Package database update: $UPD updates available" >> /var/log/pacmanscript.log
fi

