#!/bin/sh

if pactl list | grep -A 7 "alsa_input" | grep "Mute.*no">/dev/null
then
    pactl set-source-mute @DEFAULT_SOURCE@ 1 
    notify-send -u low "Mic muted"
else
    pactl set-source-mute @DEFAULT_SOURCE@ 0
    notify-send -u low "Mic unmuted"
fi
