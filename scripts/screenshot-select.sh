#!/bin/sh
# goes in ~/.local/bin
DIR="$HOME/Pictures/Screenshots"
NAME="$DIR/screenshot-$(date +'%Y-%m-%d_%H:%M:%S').png"
maim -s --hidecursor "$NAME"

if [[ -f "$NAME" ]]; then
    xclip -selection clipboard -target image/png -i "$NAME"
    notify-send -i "$NAME" "Screenshot" "screenshot copied to clipboard"
fi
