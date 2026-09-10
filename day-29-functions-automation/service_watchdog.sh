#!/bin/bash
trap 'echo "Script was interrupted! Logging and exiting..."; logger "service_watchdog: script interrupted"; exit 1' INT
echo "Running script: $0"
check_service() {
    local service_name=$1
    echo "Checking status of: $service_name"

    if systemctl is-active --quiet "$service_name"; then
        echo "$service_name is running."
    else
        echo "$service_name is NOT running. Attempting restart..."
        sudo systemctl restart "$service_name"
        if [ $? -eq 0 ]; then
    echo "Restart succeeded."
else
    	echo "Restart FAILED."
		fi
		logger "service_watchdog: restarted $service_name"
	fi
}

echo "Number of arguments given: $#"
echo "All arguments: $@"
check_service "$1"
