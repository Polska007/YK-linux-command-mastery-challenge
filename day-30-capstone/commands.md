# Commands - Day 30 (Capstone)

This day is task-based rather than a fixed set of new commands. It combines
commands and techniques from across the entire 30-day challenge into two
real, working scripts.

## Build a full system health-check script
Combined uptime, free -h, ps aux, systemctl is-active, and journalctl into
one report (system_healthcheck.sh).

## Combine ps + systemctl + journalctl in one report
Used together to show process activity, live service state, and recent
error-level log entries side by side.

## SSH into a remote host and run a command
Connected to a freshly provisioned EC2 instance using a saved
~/.ssh/config shortcut, running both interactive and one-off remote
commands.

## scp a file as part of a deployment
Used to securely transfer an updated script to the remote server as the
first real step of the deployment script.

## Apply chmod/chown to deployed files
Set the deployed file's ownership to root:root and permissions to 755
immediately after transfer, before restarting the service.

## Schedule the health check with cron
Added a daily 6am cron entry to run system_healthcheck.sh
