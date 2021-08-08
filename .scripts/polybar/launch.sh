#!/bin/bash

# Terminate already running polybar instances
killall -q polybar

# Wait until the processes have been shut down
while prgrep -u $UID -x polybar > /dev/null; do
    sleep 1;
done

# Launch Polybar
polybar placeholder_top &
polybar placeholder_bottom &
polybar playing &
polybar system &
polybar ws &
polybar widgets &

echo "Polybar launched"

