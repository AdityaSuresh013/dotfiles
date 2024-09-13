#!/bin/bash
# A rofi powered menu to execute power related action.

chosen=$(printf "  Power Off\n  Reboot\n  Lock\n  Logout" | rofi -dmenu -i -p "Power Menu" -theme-str 'listview { lines: 4; }')

case "$chosen" in
    "  Power Off") systemctl poweroff ;;
    "  Reboot") systemctl reboot ;;
    "  Lock") i3lock -i /home/audi/Pictures/#11121d.png ;;
    "  Logout") i3-msg exit ;; # or use an appropriate command for your environment
    *) exit 1 ;;
esac

