#!/bin/bash

FOLDER="$HOME/.cache/vddf/"
mkdir -p "$FOLDER"
find ~/dotfiles/sway/wallpapers -type f \( -iname "*.png" -o -iname "*.jpg" \) > "$FOLDER"wallpaper_list.txt