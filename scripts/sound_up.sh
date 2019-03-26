#!/bin/bash
S_PATH=~/dotfiles/scripts/bleep
STATE=$S_PATH/bleep_state
SOUND_BEEP=`cat $STATE`

echo $SOUND_BEEP

if [ $SOUND_BEEP -gt "4" ]; then
    echo 0 > $STATE 
else
    ((SOUND_BEEP++)) 
    echo $SOUND_BEEP > $STATE
fi

paplay $S_PATH/$SOUND_BEEP.wav
