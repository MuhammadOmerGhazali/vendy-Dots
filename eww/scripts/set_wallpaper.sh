#!/bin/bash

WALLPAPER="$1"
FOLDER="$HOME/.cache/vddf/"

if [[ -n "$WALLPAPER" ]]; then
    echo "$WALLPAPER" > "$FOLDER"+last_wallpaper
    pkill swaybg
    swaybg -i "$WALLPAPER" -m fill &
fi