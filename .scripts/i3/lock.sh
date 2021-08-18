#!/bin/bash

# Colors - Mai Palette
g="#70727f"
lg="#bab9c2"
bpu="#495c97"
pu="#a6a8d9"
lpu="#d6afb4"
dpi="#d6afb4"
pi="#efd7d1"
t="#00000000"

font="Lotuscoder"

i3lock \
    -n \
    -B sigma \
    -k \
    --keyhl-color=$pu \
    --bshl-color=$g \
    --verif-color=$pu \
    --wrong-color=$pu \
    --layout-color=$pu \
    --time-color=$pu \
    --date-color=$pu \
    --greeter-color=$pu \
    --time-str="%I:%M:%S" \
    --date-str="%A %B %e, %Y" \
    --verif-text="" \
    --wrong-text="" \
    --noinput-text="No" \
    --lock-text="locking..." \
    --lockfailed-text="lock failed" \
    --greeter-text="お早う" \
    --time-font=$font \
    --date-font=$font \
    --layout-font=$font \
    --greeter-font=$font \
    --time-size=35 \
    --date-size=35 \
    --layout-size=35 \
    --greeter-size=60 \
    --bar-indicator \
    --bar-max-height=20 \
    --bar-pos="600:600" \
    --bar-count=1 \
    --bar-base-width=10 \
    --bar-max-height=10 \
    --bar-total-width=700 \
    --bar-color=$bpu \
    --ringver-color=$pi \
    --pass-media-keys \
    --pass-screen-keys \
    --pass-power-keys \
    --pass-volume-keys \
