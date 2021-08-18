#!/bin/bash

if bluetoothctl show | grep "Powered: no" > /dev/null;
then
    echo "" # bluetooth off
else
    connectionstatus=$(bluetoothctl info 2> /dev/null);
    if [[ $? -eq 0 ]];
    then
        echo "" # connected
    else
        echo "" # not connected
    fi
fi
