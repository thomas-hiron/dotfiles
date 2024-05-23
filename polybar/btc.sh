#!/usr/bin/env bash

btc=$(curl -Ls 'https://api.bitvavo.com/v2/ticker/24h' | jq -r '.[] | select(.market == "BTC-EUR").last')

echo -n "BTC: ${btc%.*} €"
