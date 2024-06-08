#!/usr/bin/env bash

emoji_file="/tmp/emoji.txt"
test -f $emoji_file || curl -sL https://raw.githubusercontent.com/milesj/emojibase/master/packages/data/en/data.raw.json  | jq -r '.[] | .emoji + "  " + (.label | ascii_upcase) + "  " + (.tags | .? | map("#" + .) | join(" "))' > $emoji_file

selected=$(cat $emoji_file | rofi -dmenu -i -p "Choose emoji" | grep -oP "^[^ ]+")
xdotool type $selected
