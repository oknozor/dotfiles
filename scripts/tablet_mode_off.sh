#!/bin/bash

notify-send --icon=preferences-system-laptop --urgency=low "Laptop mode"
pkill -x "sysboard"
pkill -x "roland"
niri msg output 'eDP-1' transform normal
