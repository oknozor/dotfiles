#!/bin/bash

# Get the number of output
sway_outputs="$(swaymsg -t get_outputs --raw)"
output_number=$(echo "$sway_outputs" | jq '. | length')

if [ "$output_number" == 1 ] 
then
  echo "$sway_outputs" | jq  '.[0] | .name'
else 
  echo "$sway_outputs" | jq  '.[1] | .name'
fi

