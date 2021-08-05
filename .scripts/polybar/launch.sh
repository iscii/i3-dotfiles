#!/bin/bash

# Terminate already running polybar instances
killall -q polybar

# Wait until the processes have been shut down
while prgrep -u $UID -x polybar > /dev/null; do
    sleep 1;
done

# Launch Polybar
polybar placeholder &
polybar ws &
polybar playing &
polybar widgets &

echo "Polybar launched"


