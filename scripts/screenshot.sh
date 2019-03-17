#!/bin/bash

date=`date +%Y-%m-%dT%H:%M:%S%z`
grim -g "$(slurp)" ~/Pictures/screenshot$date.png && paplay ~/dotfiles/scripts/screenshot.wav
