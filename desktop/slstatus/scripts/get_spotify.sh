#!/bin/sh

# Check if Spotify is running
if ps -C spotify > /dev/null; then
  PLAYER="spotify"
elif ps -C spotifyd > /dev/null; then
  PLAYER="spotifyd"
else
  # If neither Spotify nor spotifyd is running, exit
  printf " "
  exit 0
fi

# Check if the detected player is Spotify or spotifyd
if [ "$PLAYER" = "spotify" ] || [ "$PLAYER" = "spotifyd" ]; then
  ARTIST=$(playerctl --player=$PLAYER metadata artist)
  TRACK=$(playerctl --player=$PLAYER metadata title)
  POSITION=$(playerctl --player=$PLAYER position | sed 's/..\{6\}$//')
  DURATION=$(playerctl --player=$PLAYER metadata mpris:length | sed 's/.\{6\}$//')
  STATUS=$(playerctl --player=$PLAYER status)
  SHUFFLE=$(playerctl --player=$PLAYER shuffle)

  if [ "$STATUS" = "Playing" ]; then
    STATUS="▶"
  else
    STATUS="⏸"
  fi

  string="$STATUS $ARTIST - $TRACK"
  printf "%.50s" "$string" 
else
  # If the detected player is not Spotify or spotifyd, exit
  printf " "
  exit 0
fi

