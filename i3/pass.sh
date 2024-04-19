#!/usr/bin/env bash

password_files=$(find ~/.password-store -type f -name "*.gpg")

password=$(echo -e "${password_files}" | sed -r "s#.+password-store/##" | sed "s/.gpg//" | rofi -dmenu  -i -p "Choose password:")

[[ -n $password ]] || exit

pass show -c "$password"
