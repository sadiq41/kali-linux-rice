#!/bin/bash

# Get the list of Wi-Fi networks
networks=$(nmcli -t -f ssid device wifi list | sort -u)

# Use rofi to display the list of networks
chosen=$(echo "$networks" | rofi -dmenu -p "Select Wi-Fi Network")

# Connect to the selected network
if [ -n "$chosen" ]; then
    nmcli device wifi connect "$chosen"
fi
