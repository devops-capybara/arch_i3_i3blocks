#!/bin/bash

BAT=$(ls -d /sys/class/power_supply/BAT* | head -n1)

LAST=""

while true; do
    STATUS=$(cat "$BAT/status")

    if [ "$STATUS" != "$LAST" ]; then
        pkill -RTMIN+1 i3blocks
        LAST="$STATUS"
    fi

    sleep 2
done
