#!/bin/bash

player_status=$(playerctl status 2> /dev/null)
# if exit code ($?) is 0, player is playing
if [[ $? -eq 0 && $player_status != "Stopped" ]]; then   
    metadata="$(playerctl metadata artist) - $(playerctl metadata title)"
    if [[ $(echo $metadata | wc -c) -gt 40 ]]; then
        metadata=$(echo $metadata | cut -c1-46)"..."
    fi
fi

if [[ $player_status = "Playing" ]]; then
    echo " $metadata"
elif [[ $player_status = "Paused" ]]; then
    echo " $metadata"
else
    echo ""
fi
