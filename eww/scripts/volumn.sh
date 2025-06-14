#!/bin/bash
pactl subscribe | grep --line-buffered "Event 'change' on sink" | while read -r _; do
  volume=$(pamixer --get-volume)
  muted=$(pamixer --get-mute)
  echo "{\"volume\": $volume, \"muted\": $muted}"
done