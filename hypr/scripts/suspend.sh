#!/bin/sh
# swayidle -w \
# timeout 300 ' swaylock -fSle --effect-blur 5x5' \
# timeout 500 ' hyprctl dispatch dpms off' \
# timeout 1600 'systemctl suspend' \
# resume ' hyprctl dispatch dpms on' \
# before-sleep 'swaylock -fSle --effect-blur 5x5' &

swayidle -w \
timeout 500 'hyprlock' \
timeout 800 'hyprctl dispatch dpms off' \
resume 'hyprctl dispatch dpms on' \
timeout 1800 'systemctl suspend' \
before-sleep 'hyprlock' &

