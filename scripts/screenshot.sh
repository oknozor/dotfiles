#!/bin/bash

date=$(date +%Y-%m-%dT%H:%M:%S%z)
grim -g "$(slurp)" "$HOME/Pictures/Screenshots/screenshot-$date.png" && paplay "$HOME/dotfiles/scripts/screenshot.wav"
