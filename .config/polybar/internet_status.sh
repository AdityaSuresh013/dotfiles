#!/bin/bash

# Ping Cloudflare DNS to check internet connection
if ping -c 1 1.1.1.1 &> /dev/null
then
    #ssid=$(iwgetid -r)
    #echo "󰤨 $ssid"
    echo "󰤨 "
else
    echo "󰤭 "
fi

# get_latency() {
#     # Extract average latency from the ping command
#     ping -c $PING_COUNT $TARGET | awk -F'/' 'END { print $5 }'
# }
