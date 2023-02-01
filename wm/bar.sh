#!/bin/sh
CONFIG=$HOME/.config/eww
eww -c ${CONFIG} kill || true && eww -c ${CONFIG} daemon && eww -c ${CONFIG} open bar
