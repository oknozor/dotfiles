#!/bin/bash

LOCK_PATH=$HOME/.dotfiles/lockscreens

betterlockscreen -u $LOCK_PATH
betterlockscreen -w

while sleep 720; do
   betterlockscreen -u $LOCK_PATH
   betterlockscreen -w
done
