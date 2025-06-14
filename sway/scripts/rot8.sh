#!/bin/bash


# This script uses rot8 to rotate touch screen + display according to orientaion
# Before using this script map your touch screen to display and put it in sway config
# e.g swaymsg input "1386:20548:Wacom_Pen_and_multitouch_sensor_Finger" map_to_output "eDP-1"
# find identifier with swaymsg -t get_inputs

# Script runs by running rot8 for a second and killing it.If you want continous rotation according to orientation run rot8 as daemon. 
# I couldnt bother finding the specific normalization factor and inversion so i am using this approach.


rot8 &
ROT8_PID=$!
sleep 1
kill $ROT8_PID 2>/dev/null || true
echo "rot8 ran and stopped"
