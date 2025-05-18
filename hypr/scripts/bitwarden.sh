#!/bin/bash

# Dependencies: socat, hyprland (duh)
# To automatically load the script add it to your home and add this line to your `hyprland.conf':
#   `exec-once = /path/to/floating_bitwarden.sh`

# read from hyprland socket2
socat "$XDG_RUNTIME_DIR"/hypr/"$HYPRLAND_INSTANCE_SIGNATURE"/.socket2.sock - | \
  while read p; do
    # filter `windowtitlev2` events, meaning: "a title has changed it's title"
    # then filter the title that must be exactly 'Extension: (Bitwarden Password Manager)'
    #   if we match only 'Bitwarden' every window that contains bitwarden will be matched
    #   eg: searching 'Bitwarden' on google will trigger it
    if echo "$p" | grep 'windowtitlev2' | grep 'Extension: (Bitwarden Password Manager)' -q; then
      # get the id/address of the window that changed its title
      ADDR="0x$(echo "$p" | sed -E 's/.*>>(.*),.*/\1/')"
      # set floating on
      hyprctl dispatch setfloating address:"$ADDR"
      # set window size to 400x600 pixels"
      hyprctl dispatch resizewindowpixel "exact 400 600,address:$ADDR"
    fi
  done
