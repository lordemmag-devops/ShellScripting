#!/bin/bash

USER_LIST="users.txt"

if [ ! -f "$USER_LIST" ]; then
    echo "User list file not found!"
    exit 1
fi

while IFS= read -r user; do
    if id "$user" &>/dev/null; then
        echo "User $user already exists"
    else
        sudo useradd -m "$user"
        echo "$user:Password123" | sudo chpasswd  # Set default password
        echo "User $user created successfully"
    fi
done < "$USER_LIST"

