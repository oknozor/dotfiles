#!/bin/bash

date=$(date +%Y-%m-%dT%H:%M:%S%z)
scrot "$HOME/Pictures/Screenshots/$date.png" && paplay "$HOME/dotfiles/scripts/screenshot.wav"
