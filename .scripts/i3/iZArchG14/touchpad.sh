#!/bin/sh

if xinput list-props 15 | grep "Device Enabled (178):.*1">/dev/null
then
    xinput disable 15
    notify-send -u low "Trackpad disabled"
else
    xinput enable 15
    notify-send -u low "Trackpad enabled"
fi

