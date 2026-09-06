# Commands - Day 25 (Checkpoint)

## ps aux | grep
Filters the full process list down to processes matching a specific name.

## systemctl status <svc>
Shows a service's detailed current state — loaded, active/inactive, enabled/disabled, recent log lines, and process tree.

## journalctl -u <svc> --since today
Shows a specific service's systemd journal logs, filtered to entries from today only.

## kill -0 (liveness check)
Sends signal 0 to a PID — a non-destructive check confirming whether a process exists and is signalable, without actually affecting it.

## uptime
Shows how long the system has been running, number of logged-in users, and load averages, in one summary line.

## free -h
Shows memory and swap usage in human-readable units.

## vmstat
A broad system performance snapshot covering processes, memory, swap, I/O, and CPU activity together.

## iostat
Focuses specifically on disk I/O and CPU utilization, useful for diagnosing disk-bound performance issues.

## watch
Runs a command repeatedly at a set interval, refreshing the screen automatically.

## crontab -e / crontab -l
crontab -e edits a user's scheduled cron jobs; crontab -l lists the current jobs without opening an editor.
