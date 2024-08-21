#!/bin/bash

# Get the battery percentage
battery_percentage=$(acpi -b | awk -F ", " '{print $2}' | sed 's/.*: //' | tr -d '[:space:]%' )

# Check if the percentage is empty or non-numeric
if ! [[ "$battery_percentage" =~ ^[0-9]+$ ]]; then
  echo "⚠️"
  exit 1
fi

# Compare the percentage and output the appropriate icon
if [ "$battery_percentage" -le 20 ]; then
  echo "󰁺 $battery_percentage%" # Low battery icon
elif [ "$battery_percentage" -le 40 ]; then
  echo "󰁼 $battery_percentage%" # Mid battery icon
elif [ "$battery_percentage" -le 60 ]; then
  echo "󰁾 $battery_percentage%" # High battery icon
elif [ "$battery_percentage" -le 80 ]; then
  echo "󰂁 $battery_percentage%" # Very High battery icon
elif [ "$battery_percentage" -le 90 ]; then
  echo "󰂂 $battery_percentage%" # Nearly full battery icon
else
  echo "󰁹 $battery_percentage%" # Full battery icon
fi
