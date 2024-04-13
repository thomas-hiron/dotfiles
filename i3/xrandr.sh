#!/usr/bin/env bash

# Get connected display name
monitors=$(xrandr --query | grep -w connected | cut -d' ' -f1 | xargs)

if [[ ${monitors} == "eDP-1 HDMI-1" ]]; then
    echo "[INFO] Setting eDP-1 right to HDMI-1"
    xrandr --output HDMI-1 --auto --output eDP-1 --auto --right-of HDMI-1

    i3-msg 'workspace 1; move workspace to output HDMI-1'
    i3-msg 'workspace 2; move workspace to output eDP-1'
elif [[ ${monitors} == "eDP-1 DP-2-1 DP-2-2" ]]; then
    echo "[INFO] Setting eDP-1 off and DP-2-2 right to DP-2-1"
    xrandr --output eDP-1 --off --output DP-2-1 --auto --output DP-2-2 --auto --right-of DP-2-1

    i3-msg 'workspace 1; move workspace to output DP-2-1'
    i3-msg 'workspace 2; move workspace to output DP-2-2'
fi
