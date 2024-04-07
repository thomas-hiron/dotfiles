#!/usr/bin/env bash

monitors=$(xrandr --listactivemonitors | grep -Eo "\\S{3,}$" | xargs)

if [[ ${monitors} == "eDP-1 HDMI-1" ]]; then
    echo "[INFO] Setting eDP-1 right to HDMI-1"
    xrandr --output HDMI-1 --auto --output eDP-1 --auto --right-of HDMI-1

    i3-msg 'workspace 1; move workspace to output HDMI-1'
    i3-msg 'workspace 2; move workspace to output eDP-1'
fi
