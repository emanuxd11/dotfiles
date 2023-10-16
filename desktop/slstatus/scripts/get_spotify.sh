#!/bin/sh

if ps -C spotify > /dev/null; then
    PLAYER="spotify"
elif ps -C spotifyd > /dev/null; then
    PLAYER="spotifyd"
fi

if [ "$PLAYER" = "spotify" ] || [ "$PLAYER" = "spotifyd" ]; then
    ARTIST=$(playerctl metadata artist)
    TRACK=$(playerctl metadata title)
    POSITION=$(playerctl position | sed 's/..\{6\}$//')
    DURATION=$(playerctl metadata mpris:length | sed 's/.\{6\}$//')
    STATUS=$(playerctl status)
    SHUFFLE=$(playerctl shuffle)

    if [ "$STATUS" = "Playing" ]; then
        STATUS="▶"
    else
        STATUS="⏸"
    fi

    if [ "$SHUFFLE" = "On" ]; then
        SHUFFLE=" 🔀"
    else
        SHUFFLE=""
    fi

    string="$STATUS $ARTIST - $TRACK"
    printf "%.50s" "$string"
else
    printf " "
fi

