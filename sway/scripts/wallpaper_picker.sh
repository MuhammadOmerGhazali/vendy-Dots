#!/bin/bash

FOLDER="$HOME/.cache/vddf/" 

WALLPAPER=$(find ~/dotfiles/sway/wallpapers -type f \( -iname "*.png" -o -iname "*.jpg" \) | wofi --show dmenu --prompt "Select wallpaper")

if [[ -n "$WALLPAPER" ]]; then

	echo "$WALLPAPER" > "$FOLDER"+last_wallpaper
	
	echo "$FOLDER"

	pkill swaybg
	swaybg -i "$WALLPAPER" -m fill &
	wal -i "$(cat ~/.cache/vddf/+last_wallpaper)" 

fi
