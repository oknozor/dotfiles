#!/bin/bash

SCREENS=`xrandr -q |grep " connected" |cut -d " " -f1`
SCREEN_1=`printf "%s\n" "${SCREENS[0]}" | sed '1!d'` 
SCREEN_2=`printf "%s\n" "${SCREENS[0]}" | sed '2!d'`

echo $SCREEN_1
echo $SCREEN_2 
