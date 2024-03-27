#!/bin/bash

get_framerate() {
  input_string=$(hyprctl monitors | grep -oP '\d+x\d+@\d+\.\d+')

  resolution_and_framerate=$(echo "$input_string" | grep -oP '\d+x\d+@\K\d+')
  framerate=$(echo "$resolution_and_framerate" | head -n1)

  echo $framerate
}

framerate=$(get_framerate)
echo "Current framerate: $resolution_and_framerate"

if [ $framerate -eq 165 ]; then
  hyprctl keyword monitor eDP-1,2560x1600@60,0x0,1.25
elif [ "$framerate" -eq 60 ]; then
  hyprctl keyword monitor eDP-1,2560x1600@165,0x0,1.25
else
    echo "No specific action defined for framerate $framerate"
fi

