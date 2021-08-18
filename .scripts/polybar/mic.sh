#!/bin/bash

if pactl list | grep -A 7 "alsa_input" | grep "Mute.*no">/dev/null;
then
    echo ""
else
    echo ""
fi
