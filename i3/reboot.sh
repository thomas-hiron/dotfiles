#!/usr/bin/env bash

if [[ $(which systemctl) ]]; then
    systemctl reboot
else
    sudo reboot
fi
