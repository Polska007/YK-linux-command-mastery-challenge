# Day 29 Practice Drill

## Task
Turn yesterday's script into a reusable function that accepts a service
name as an argument, checks its status, restarts it if stopped, and
schedule it to run hourly with cron.

## Script: service_watchdog.sh
```bash
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
```

## Commands run (in order)
1. Built check_service() as a real function accepting $1 as the service name
2. ./service_watchdog.sh cups (cups running) → confirmed "is running" path
3. sudo systemctl stop cups; ./service_watchdog.sh cups → confirmed the
   restart path genuinely triggers, verified with systemctl is-active
   afterward showing "active" again
4. Added $#/$@ demonstration with multiple arguments → confirmed count
   and full argument list reported correctly, only $1 actually used
5. Added $0 → confirmed it reports "./service_watchdog.sh", matching
   exact invocation
6. Added $? exit code check after the restart command → confirmed
   "Restart succeeded" genuinely reflects the real command's outcome
7. sudo journalctl -t new --since "5 minutes ago" | grep watchdog →
   confirmed logger's message genuinely landed in the system journal
8. nohup ./service_watchdog.sh cups & → ran in the background, confirmed
   completion and full output captured in nohup.out
9. Added trap for Ctrl+C (INT signal) with a temporary sleep 5 to create
   a real interrupt window; confirmed Ctrl+C correctly triggered the
   trap's cleanup message instead of the script dying abruptly
10. crontab -e → added an hourly job:
    0 * * * * /home/new/YK-linux-command-mastery-challenge/service_watchdog.sh
    cups >> /home/new/watchdog-cron.log 2>&1
11. crontab -l (after typo'd -1, -I, -L attempts) → confirmed both the
    existing Day 25 cron job and the new hourly watchdog job saved correctly

## Result
Turned yesterday's linear script into a genuine reusable function
accepting a service name as an argument, with real, proven restart logic
(demonstrated both when the service was running and when it was
genuinely stopped), exit code verification, signal handling, background
execution, system logging, and finally scheduled to run automatically
every hour via cron.

## Problem encountered and fix
- Initial function definition was missing its closing brace, leaving
  later code technically inside the function body — corrected the
  structure.
- First two Ctrl+C attempts happened after the script had already
  finished (it completed too fast to interrupt) — added a temporary
  sleep 5 to create a genuine window, then removed it once trap was proven.
- Guessed crontab -1, -I, -L before landing on the correct lowercase -l.
