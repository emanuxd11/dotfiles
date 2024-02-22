#!/bin/sh
# EXPLANATION: shitty ass utility to set a wallpaper. Explanation over.

WALLPAPER_DIR="/home/$USER/.dotfiles/wallpapers"
CONFIG_DIR="/home/$USER/.config/set-wallpaper/"

make_permanent () {
  if [ -d "$CONFIG_DIR/" ]; then
    touch "$CONFIG_DIR/current-wallpaper.txt"
    echo "$path" > "$CONFIG_DIR/current-wallpaper.txt"
  else
    mkdir -p "$CONFIG_DIR/"
  fi
}

set_chosen () {
  path=$1
  feh --bg-fill "$path"
  if [ $? -eq 0 ]; then
    echo "Wallpaper set successfully!"
    loop=true
    while [ ""$loop"" = true ]; do
      read -p "Make permanent? (y/n): " yn
      case $yn in
        [Yy]* ) make_permanent $path; loop=false;;
        [Nn]* ) loop=false;;
      esac
    done
  else
    echo "feh: error setting $path as wallpaper"
    exit 1
  fi
}

set_random () {
  random_wallpaper=$(ls "$WALLPAPER_DIR" | shuf -n 1)
  feh --bg-fill "$WALLPAPER_DIR/$random_wallpaper"
}

set_current () {
  feh --bg-fill "$(/usr/bin/cat $CONFIG_DIR/current-wallpaper.txt)"
}

remove_permanent () {
  if [ -f "$CONFIG_DIR/current-wallpaper.txt" ]; then
    rm "$CONFIG_DIR/current-wallpaper.txt"
    echo "Current wallpaper removed from permanent successfully"
    exit 0
  else
    echo "There currently isn't a permanent wallpaper"
    exit 0
  fi
}

help () {
  printf "Usage: set_wallpaper.sh FILE_PATH\n    or set_wallpaper.sh [OPTION]\n\n"
  printf "Different use cases and options:\n\n"
  printf "\tDefault (no options): sets the wallpaper currently defined as permanent.\n\tIn case that isn't defined, a random one will be set\n\n"
  printf "\tSet Wallpaper from file path: sets the file passed via the path as wallpaper.\n\tThe program will ask you if you want to make this change permanent\n\n"
  printf "\tRemove permanent: -r or --remove-permanent -> remove currently set wallpaper\n\n"
  printf "\tHelp: -h or --help -> show list of commands\n\n"
}

if [ $# -ne 0 ]; then
  #help function
  if [ "$1" = "--help" ] || [ "$1" = "-h" ]; then
    help
    exit 0
  fi

  # in case we want to remove the current wallpaper and make it random again
  if [ "$1" = "--remove-permanent" ] || [ "$1" = "-r" ]; then
    remove_permanent
  fi

  chosen_wallpaper=$1
  if [ -f "$WALLPAPER_DIR/$chosen_wallpaper" ]; then
    set_chosen "$WALLPAPER_DIR/$chosen_wallpaper"
  elif [ -f "$chosen_wallpaper" ]; then
    set_chosen "$chosen_wallpaper"
  else
    echo "$WALLPAPER_DIR/$chosen_wallpaper: No such file or directory"
    exit 1
  fi
  exit 0
else # when no options are given (default behavior)
  if [ -f "$CONFIG_DIR/current-wallpaper.txt" ]; then
    # sets current wallpaper if currently there is one
    set_current
  else
    # sets a random wallpaper if there isn't a currently configured one
    set_random
  fi
  exit 0
fi

