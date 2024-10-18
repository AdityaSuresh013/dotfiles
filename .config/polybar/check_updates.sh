#!/bin/bash

# Update package list without requiring password
sudo apt-get update -qq

# Check for package updates
updates=$(apt list --upgradable 2>/dev/null | grep -v 'Listing...' | wc -l)

# If there are updates, show the number
if [ "$updates" -gt 0 ]; then
    echo "Updates: $updates"
#else
    #echo "No updates"
fi

