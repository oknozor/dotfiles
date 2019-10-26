#!/bin/bash

date=$(date +%Y-%m-%dT%H:%M:%S%z)
scrot -s "$HOME/Pictures/Screenshots/screenshot-$date.png" && paplay "$HOME/dotfiles/scripts/screenshot.wav"
