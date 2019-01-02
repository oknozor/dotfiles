#!/bin/bash

    if [ -z $1 ]; then
        echo "rvim [remote_machine]"
    elif [ $# != 1 ]; then
        echo "Illegal number of parameters"
    else
        vim scp://$1//home/
    fi
