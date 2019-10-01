#!/bin/zsh

if [ -z $@ ]
then
    function get_monitors()
    {
        xrandr --listmonitors | rg -v "Monitor" | awk -F' ' '{ print $4 }'
    }
    get_monitors

else
    MONITORS=$@

    if [ x"empty" = x"${MONITORS}" ]
    then
        display.sh >/dev/null
    elif [ -n "${MONITORS}" ]
    then
        i3-msg move workspace to output "$MONITORS" > /dev/null
    fi
fi
