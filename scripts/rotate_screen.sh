#!/bin/bash

# Get the output of niri msg -j outputs
output=$(niri msg -j outputs)

# Parse the JSON output to get the transform value
transform=$(echo "$output" | jq -r '."eDP-1".logical.transform')

# Check if the transform is normal
if [ "$transform" = "Normal" ]; then
    # If normal, rotate to 90 degrees
    niri msg output 'eDP-1' transform 90
    niri msg action expand-column-to-available-width
    niri msg action expand-column-to-available-height
else
    # If not normal, set to normal
    niri msg output 'eDP-1' transform normal
fi
