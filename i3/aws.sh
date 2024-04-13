#!/usr/bin/env bash

ip_regex="[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}"

# Get running aws instances
instances=$(aws ec2 describe-instances --filters Name=instance-state-name,Values=running --query 'Reservations[*].Instances[*].[InstanceId, PublicIpAddress, Tags[?Key==`Name`].Value[]]' --output json)

list=""
while IFS= read -r line; do
    host=$(echo "${line}" | grep -oE "i-[a-z0-9]+")
    ip=$(echo "${line}" | grep -oE "${ip_regex}")
    name=$(echo "${line}" | sed -n 's/.*\["\([^"]*\)"\].*/\1/p')

    # Create rofi list
    list="${list}${name}: ${ip} (${host})\n"
done <<< "$(echo "${instances}" | jq -c '.[][]')"

# Display rofi
selected=$(echo -e "$list" | rofi -dmenu -i -p "Choose instance:")

# Get selected IP
ip=$(echo "${selected}" | grep -oE "${ip_regex}")

if [ -n "$ip" ]; then
    # Run a terminal in interactive mode, and exec bash to keep terminal open after the session is closed.
    gnome-terminal -- zsh -ic "ssh admin@$ip; exec bash"
fi
