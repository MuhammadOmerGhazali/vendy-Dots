#!/bin/bash
STATE=$1

if [ "$STATE" = "on" ]; then
    # Start squeekboard if not already running
    if ! pgrep squeekboard > /dev/null; then
        squeekboard &
        echo "Started squeekboard"
    fi
    # Run rotation script to set portrait (adjust path as needed)
    if [ -x ~/.config/sway/scripts/rot8.sh ]; then
        ~/.config/sway/scripts/rot8.sh
        echo "Ran rotation script"
    else
        echo "Error: rotate.sh not found or not executable"
    fi
elif [ "$STATE" = "off" ]; then
    # Stop squeekboard
    if pgrep squeekboard > /dev/null; then
        killall squeekboard
        echo "Stopped squeekboard"
    fi
    # Reset rotation (run rotate.sh again or set explicitly)
    if [ -x ~/.config/sway/scripts/rot8.sh ]; then
        ~/.config/sway/scripts/rot8.sh
        echo "Reset rotation"
    else
        echo "Error: rotate.sh not found or not executable"
    fi
else
    echo "Invalid state: $STATE"
    exit 1
fi
