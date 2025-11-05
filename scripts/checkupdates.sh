#!/bin/bash

PACMAN_UPDATES=$(checkupdates 2> /dev/null | wc -l)
AUR_UPDATES=$(paru -Qum 2> /dev/null | wc -l)
UPDATES=$((PACMAN_UPDATES + AUR_UPDATES))
echo "$UPDATES"
