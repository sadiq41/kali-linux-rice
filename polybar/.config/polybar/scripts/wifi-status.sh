#!/bin/bash
# Check if Wi-Fi is connected
if iwconfig 2>&1 | grep -q "ESSID"; then
    # Get SSID and signal strength
    SSID=$(iwgetid -r)
    SIGNAL=$(grep "$(iw dev | grep Interface | awk '{print $2}')" /proc/net/wireless | awk '{print int($3 * 100 / 70)}')
    echo " $SSID $SIGNAL%"
else
    echo "睊 Disconnected"
fi
