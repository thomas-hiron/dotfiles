#!/usr/bin/env bash

polybar-msg cmd quit

if type "xrandr"; then
    counter=0

    for m in $(xrandr --query | grep -w connected | cut -d" " -f1); do
        let counter=counter+1
        MONITOR=$m polybar bar -c $HOME/.config/polybar/config.ini 2>&1 | tee -a "/tmp/polybar${counter}.log" & disown
    done
fi
