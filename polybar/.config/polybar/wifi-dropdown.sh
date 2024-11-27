#!/bin/bash

# Get available Wi-Fi networks
wifi_networks=$(nmcli -t -f ssid dev wifi)

# Check if any networks are available
if [ -z "$wifi_networks" ]; then
    echo "No Wi-Fi networks found"
    exit 1
fi

# Use Rofi to display the networks in a dropdown
selected=$(echo "$wifi_networks" | rofi -dmenu -p "Select Wi-Fi Network" -location 0 -width 15)

# Connect to the selected network
if [ ! -z "$selected" ]; then
    nmcli dev wifi connect "$selected"
fi
