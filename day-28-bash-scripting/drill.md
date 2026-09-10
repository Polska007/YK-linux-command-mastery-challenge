# Day 28 Practice Drill

## Task
Write and execute a script that reads the user's name, checks whether a
config file exists using an if statement, and loops through three server
names pinging each one.

## Script: onboarding.sh
```bash
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
```

## Commands run (in order)
1. nano onboarding.sh → created the script, added shebang first
2. Added read -p to prompt for and greet the user by name
3. Added CONFIG_FILE and SERVERS variable assignments
4. Added an if/else block checking whether /etc/hostname exists
5. Added a for loop iterating over the SERVERS array, pinging each
6. chmod +x onboarding.sh → made the script executable
7. ./onboarding.sh → first full run: name prompt, config check, all
   three servers pinged successfully (0% packet loss each)
8. Added a $() command substitution capturing ping result count, an
   if/elif/else using -eq and -gt to evaluate it, and a while loop
   counting to 3
9. ./onboarding.sh (second run) → full script executed end-to-end,
   all sections working correctly including the new additions

## Result
Built and successfully executed one complete real script covering all
10 of today's commands: shebang, chmod +x, ./ execution, variable
assignment, command substitution, read -p, if/elif/else/fi, numeric
comparison operators, a for loop, and a while loop — all working
together in a single, genuine piece of automation rather than isolated
snippets.

## Problem encountered and fix
None — the script ran correctly on both executions, building up
incrementally and testing at each stage before adding the next piece.
