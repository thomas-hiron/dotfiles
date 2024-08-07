#!/usr/bin/env bash

if [[ $(which systemctl) ]]; then
    systemctl poweroff
else
    sudo poweroff
fi
