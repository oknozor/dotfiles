#!/bin/bash

if [ $# -eq 0 ]; then
    echo "Usage: $0 widget1 [widget2 ...]"
    exit 1
fi

active_windows=$(eww active-windows)

is_widget_open() {
    echo "$active_windows" | grep -q "^$1:"
}

any_widget_open=false
for widget in "$@"; do
    if is_widget_open "$widget"; then
        any_widget_open=true
        break
    fi
done

echo "$@"
if [ "$any_widget_open" = true ]; then
    eww close "$@"
else
    eww open-many "$@"
fi
