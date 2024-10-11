#!/bin/bash

# =========================================
#           Add user to sudoers
# =========================================

# Check if the script is run as root
if [ "$EUID" -ne 0 ]; then
    echo "This script must be run as root. Please run it with sudo or as the root user."
    exit 1
fi

echo "Running setup script as root."
apt install sudo

# Function to add user to sudo group
add_user_to_sudo() {
    local username=$1
    if id "$username" &>/dev/null; then
        if groups "$username" | grep -q '\bsudo\b'; then
            echo "$username is already in the sudo group. Skipping..."
            return 0  # skip adding
        else
            echo "Adding $username to the sudo group..."
            usermod -aG sudo "$username"
            echo "$username has been added to the sudo group."
        fi
    else
        echo "User $username does not exist."
        return 1
    fi
}

read -p "Enter the username to add to the sudo group: " username

# Add user to sudo group
add_user_to_sudo "$username"
