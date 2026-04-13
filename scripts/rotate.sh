#!/bin/bash

# Get the current transform/rotation of eDP-1 display
current_transform=$(niri msg --json outputs | jq -r '.["eDP-1"].logical.transform')

# Get the script directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Check current rotation and toggle accordingly
if [ "$current_transform" = "Normal" ]; then
    # Screen is in normal orientation, switch to tablet mode
    "$SCRIPT_DIR/tablet_mode_on.sh"
else
    # Screen is rotated, switch to laptop mode
    "$SCRIPT_DIR/tablet_mode_off.sh"
fi
