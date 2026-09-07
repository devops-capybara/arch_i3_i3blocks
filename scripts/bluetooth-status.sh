#!/bin/bash

#if ! bluetoothctl show | grep -q "Powered: yes"; then
#    echo " off"
#    exit
#fi

#device=$(bluetoothctl devices Connected | awk '{print $2}')

#if [ -n "$device" ]; then
#    name=$(bluetoothctl info "$device" | grep "Name" | cut -d ' ' -f2-)
#    echo " $name"
#else
#    echo " on"
#fi
#!/bin/bash

MAC="14:3F:A6:98:D3:1C"

# Sprawdź, czy Bluetooth jest włączony
if ! bluetoothctl show | grep -q "Powered: yes"; then
    exit 0
fi

# Sprawdź, czy słuchawki są połączone
if bluetoothctl info "$MAC" | grep -q "Connected: yes"; then
    name=$(bluetoothctl info "$MAC" | grep "Name:" | cut -d ' ' -f2-)
    battery=$(bluetoothctl info "$MAC" | grep "Battery Percentage:" | grep -oP '\(\K[0-9]+')

    if [ -n "$battery" ]; then
        echo " $name $battery%"
    else
        echo " $name"
    fi
fi
