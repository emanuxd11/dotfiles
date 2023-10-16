#!/bin/sh

# A dwm_bar function that shows the current date and time
# Joe Standring <git@joestandring.com>
# GNU GPLv3

dwm_date () {
    printf "%s" "$SEP1"
    if [ "$IDENTIFIER" = "unicode" ]; then
        printf "󰸗  %s" "$(date "+%a %d/%m/%Y %R")"
    else
        printf "DAT %s" "$(date "+%a %d/%m/%Y %R")"
    fi
    # no separator because it's the last one
    # printf "%s\n" "$SEP2"
}

dwm_date
