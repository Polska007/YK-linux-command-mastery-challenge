# Commands - Day 29

## function_name() { }
Defines a reusable, named block of code that can be called repeatedly with different inputs.

## $1 / $2
Positional arguments — values passed to a script or function, accessed in order.

## $# / $* / $@
$# is the count of arguments; $* joins all arguments into one string; $@ keeps them as separate individual items.

## $0
Holds the name of the script itself as it was invoked, useful for accurate usage/help messages.

## exit codes ($?)
Captures the exit code of the most recently run command — 0 means success, non-zero means failure — letting scripts react to whether something actually worked.

## crontab syntax
The 5-field time format (minute, hour, day-of-month, month, day-of-week) controlling when a scheduled job runs.

## cron scheduling (0 * * * *)
A specific cron schedule meaning "at minute 0 of every hour" — i.e., once every hour.

## nohup script.sh &
Runs a script in the background, immune to being killed when the terminal session that started it closes.

## trap
Intercepts specific signals (like Ctrl+C) and runs custom cleanup code instead of letting the script die abruptly.

## logger
Writes a message directly into the system log, viewable via journalctl — useful for scripts running unattended.
