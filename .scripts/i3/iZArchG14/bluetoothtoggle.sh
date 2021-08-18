#!/bin/bash

if bluetoothctl show | grep "Powered: no" > /dev/null;
then
    bluetoothctl power on
    notify-send "Bluetooth on"
else
    bluetoothctl power off
    notify-send "Bluetooth off"
fi
