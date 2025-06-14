#!/bin/bash

FOLDER="$HOME/.cache/vddf/"
mkdir -p "$FOLDER"

# Update wallpaper list
bash ~/.config/eww/scripts/update_wallpaper_list.sh

# Set EWW_WALLPICKER_OPEN to true and open the window
eww update EWW_WALLPICKER_OPEN=true
eww open wallpaper-picker

# Wait for the window to close (user can close it with a keybind or click outside)
# You can bind a key in Sway to run `eww close wallpaper-picker`