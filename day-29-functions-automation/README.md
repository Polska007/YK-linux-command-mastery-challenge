# Day 29: Functions, Arguments & Automation

# Phase 6 - Networking, Scripting & SSH Mastery | Day 29 of 30

# Commands covered today
See commands.md for all 10 commands with syntax and my own explanation
of what each one does and when I would reach for it.

# What I practiced
Turned yesterday's linear script into a real, reusable function-based
watchdog: accepts a service name as an argument, checks its live status,
and genuinely restarts it if stopped — proven both ways by deliberately
stopping cups and watching the script bring it back. Added exit code
verification, signal trapping, background execution with nohup, system
logging, and finally scheduled the whole thing to run automatically
every hour via cron.

# What surprised me
Proving trap actually worked required creating a real problem first —
my first two Ctrl+C attempts landed after the script had already
finished, since checking an already-running service is nearly instant.
Adding a temporary sleep to create an actual interruption window was the
only way to get genuine, honest evidence rather than just claiming it
would work.

# Evidence
Screenshot or terminal transcript of the drill in evidence/.

# Related
Previous day: ../day-28-bash-scripting/
Next day: ../day-30-capstone/
