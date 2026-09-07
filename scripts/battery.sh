#!/bin/bash

BAT=$(ls -d /sys/class/power_supply/BAT* 2>/dev/null | head -n1)

CAP=$(cat "$BAT/capacity")
STATUS=$(cat "$BAT/status")

if [ "$STATUS" = "Charging" ]; then
    ICON="⚡"
else
    if [ "$CAP" -gt 80 ]; then ICON=""
    elif [ "$CAP" -gt 60 ]; then ICON=""
    elif [ "$CAP" -gt 40 ]; then ICON=""
    elif [ "$CAP" -gt 20 ]; then ICON=""
    else ICON=""
    fi
fi

echo "$ICON  $CAP%"
