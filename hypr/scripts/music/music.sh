#!/bin/zsh

hyprctl dispatch exec spotify
hyprctl dispatch exec 'kitty --class=cava cava'  
hyprctl dispatch togglefloating cava
hyprctl dispatch focuswindow spotify
