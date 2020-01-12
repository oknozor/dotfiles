#!/bin/zsh

if [ -z $@ ]
then
    function get_monitors()
    {
        monitors=$(xrandr --listmonitors | rg -v "Monitor" | awk -F' ' '{ print $4 }')
        echo "$monitors\nDuplicate"
    }
    get_monitors

else
    MONITORS=$@
    echo "coucou"

    if [ x"empty" = x"${MONITORS}" ]
    then
        display.sh >/dev/null
    elif [ -n "${MONITORS}" ]
    then
        i3-msg '[workspace="  "]' move workspace to output "$MONITORS" > /dev/null
    fi
fi
