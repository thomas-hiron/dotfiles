#!/usr/bin/env bash

btc=$(curl -s "https://api.blockchain.com/v3/exchange/tickers/BTC-EUR" -H  "accept: application/json" | jq -r ".last_trade_price")

echo -n "BTC: ${btc%.*} €"
