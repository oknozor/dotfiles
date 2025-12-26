#!/bin/bash

# Check if sysboard is already running
if pgrep -x "sysboard" > /dev/null; then
    # If running, kill it
    pkill -x "sysboard"
    echo "Existing sysboard process terminated."
else
    # If not running, start it
    sysboard &
    echo "sysboard started."
fi
