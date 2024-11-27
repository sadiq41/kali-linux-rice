#!/bin/bash

# Scan for available Wi-Fi networks
networks=$(nmcli -t -f SSID dev wifi)

# Display networks using rofi and capture the selected network
selected_network=$(echo "$networks" | rofi -dmenu -p "Select Wi-Fi Network")

# Check if a network was selected
if [ -z "$selected_network" ]; then
    exit 1
fi

# Ask for the password for the selected network
password=$(rofi -dmenu -p "Enter password for $selected_network")

# Connect to the selected network using the password
nmcli dev wifi connect "$selected_network" password "$password"

