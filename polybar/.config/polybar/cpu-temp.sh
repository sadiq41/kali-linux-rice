#!/bin/bash
# Get the CPU temperature
temp=$(sensors | grep 'Package id 0:' | awk '{print $4}')
echo "$temp "

