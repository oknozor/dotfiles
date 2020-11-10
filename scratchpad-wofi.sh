swaymsg -t get_tree | jq -r '.nodes[].nodes[]|select(.name="__i3_scratch").floating_nodes[].name'
sid - File Manager
Downloads - File Manager