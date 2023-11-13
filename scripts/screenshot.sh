#!/bin/sh
# goes in ~/.local/bin
DIR="$HOME/Pictures/Screenshots"
NAME="$DIR/screenshot-$(date +'%Y-%m-%d_%H:%M:%S').png"
maim "$NAME"
xclip -selection clipboard -target image/png -i "$NAME"
notify-send -i "$NAME" "screenshot.sh" "screenshot copied to clipboard"
