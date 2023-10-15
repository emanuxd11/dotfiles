#!/bin/sh
# I made this one myself, it's for counting sigma days

dwm_sigma () {
    days="$(((`date +%s` - `date +%s -d '2023/8/25'`) / 86400)) 😃"
    printf "%s%s" "$days" "$SEP2"
}

dwm_sigma
