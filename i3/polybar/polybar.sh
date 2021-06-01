#!/usr/bin/env bash
killall -q polybar 
polybar --config=~/.config/polybar/config.ini main
