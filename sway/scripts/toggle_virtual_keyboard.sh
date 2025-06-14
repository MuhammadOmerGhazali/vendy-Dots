#!/bin/bash

# Check if squeekboard is running
if pgrep squeekboard > /dev/null; then
    killall squeekboard
    echo "Squeekboard stopped"
else
    squeekboard &
    echo "Squeekboard started"
fi
