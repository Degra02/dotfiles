#!/bin/bash

get_framerate() {
  input_string=$(hyprctl monitors | grep -oP '\d+x\d+@\d+\.\d+')

  resolution_and_framerate=$(echo "$input_string" | grep -oP '\d+x\d+@\K\d+')
  framerate=$(echo "$resolution_and_framerate" | cut -d'.' -f1)

  echo $framerate
}

resolution_and_framerate=$(get_framerate)
echo "Current framerate: $resolution_and_framerate"

if [ $resolution_and_framerate -eq 165 ]; then
  hyprctl keyword monitor eDP-1,2560x1600@60,0x0,1.25
elif [ "$resolution_and_framerate" -eq 60 ]; then
  hyprctl keyword monitor eDP-1,2560x1600@165,0x0,1.25
else
    echo "No specific action defined for framerate $resolution_and_framerate"
fi

