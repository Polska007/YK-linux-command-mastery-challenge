#!/bin/bash

read -p "Enter your name: " username
echo "Hello, $username!"
CONFIG_FILE="/etc/hostname"
SERVERS=("8.8.8.8" "1.1.1.1" "9.9.9.9")

if [ -f "$CONFIG_FILE" ]; then
    echo "Config file $CONFIG_FILE exists."
else
    echo "Config file $CONFIG_FILE does not exist."
fi

for server in "${SERVERS[@]}"; do
    echo "Pinging $server..."
    ping -c 2 "$server"
done

success_count=$(ping -c 1 8.8.8.8 | grep -c "bytes from")

if [ "$success_count" -eq 1 ]; then
    echo "Connectivity check passed."
elif [ "$success_count" -gt 1 ]; then
    echo "Unexpected: more than one reply."
else
    echo "Connectivity check failed."
fi

counter=1
while [ $counter -le 3 ]; do
    echo "While loop iteration: $counter"
    counter=$((counter + 1))
done
