#!/bin/bash

notify-send --icon=preferences-desktop-tablet "Tablet mode"
niri msg output 'eDP-1' transform 90
niri msg action expand-column-to-available-width
niri msg action expand-column-to-available-height
sysboard &
/home/okno/.cargo/bin/roland --config /home/okno/dotfiles/configs/roland/config.toml
