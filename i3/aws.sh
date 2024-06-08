#!/usr/bin/env bash

ip_regex="[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}"
cache_file="/tmp/aws_rofi_list.txt"

# Remove cache
if [[ $1 == "no-cache" ]]; then
    rm -f "${cache_file}"
fi

# Get running aws instances
if [[ ! -f "${cache_file}" ]]; then
    instances=$(aws ec2 describe-instances --filters Name=instance-state-name,Values=running --query 'Reservations[*].Instances[*].[InstanceId, PublicIpAddress, Tags[?Key==`Name`].Value[]]' --output json)

    list=""
    while IFS= read -r line; do
        host=$(echo "${line}" | grep -oE "i-[a-z0-9]+")
        ip=$(echo "${line}" | grep -oE "${ip_regex}")
        name=$(echo "${line}" | sed -n 's/.*\["\([^"]*\)"\].*/\1/p')

        # Create rofi list
        list="${list}${name}: ${ip} (${host})\n"
    done <<< "$(echo "${instances}" | jq -c '.[][]')"

    echo "${list}" > "${cache_file}"
fi

list=$(cat "${cache_file}")

# Display rofi (truncate last line break char)
selected=$(echo -e "${list::-1}" | sort | rofi -matching "fuzzy" -dmenu -i -p "Choose instance")

# Get selected IP
ip=$(echo "${selected}" | grep -oE "${ip_regex}")

if [ -n "$ip" ]; then
    # Run a terminal in interactive mode, and exec bash to keep terminal open after the session is closed.
    gnome-terminal -- zsh -ic "ssh admin@$ip; exec bash"
fi
