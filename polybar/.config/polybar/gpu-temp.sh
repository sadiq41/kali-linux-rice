#!/bin/bash

# Get GPU temperature from sensors output
gpu_temp=$(sensors | grep 'nouveau-pci-0100' -A 1 | grep 'temp1' | awk '{print $2}')

# Display the GPU temperature with a GPU icon
echo "$gpu_temp"
