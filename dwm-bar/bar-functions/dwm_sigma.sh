#!/bin/sh
# I made this one myself, it's for counting sigma days

dwm_sigma () {
    days="sigma counter: $(((`date +%s` - `date +%s -d '2023/3/4'`) / 86400)) days"
    printf "%s%s" "$days" "$SEP2"
}

dwm_sigma
