# Day 25: Process & Service Checkpoint

# Phase 5 - Process & Service Management | Day 25 of 30 (Checkpoint)

# Commands covered today
See commands.md for all 10 commands with syntax and my own explanation
of what each one does and when I would reach for it.

# What I practiced
Built a complete operational snapshot of the server: uptime, memory usage,
broader system health via vmstat and iostat, the status of three real
services (discovering ssh wasn't even installed and setting it up live),
a non-destructive liveness check with kill -0, and cron job status —
moving from genuinely no scheduled jobs to one real, confirmed entry.

# What surprised me
Checking ssh's status revealed it wasn't installed at all on this system —
turning a simple status check into a real install-and-verify task.
Afterward, journalctl showed sshd binding to port 22, the exact port I
opened in the firewall back on Day 9 before SSH even existed on this
machine — a nice, concrete link between two separate days finally coming
together into something functional.

# Evidence
Screenshot or terminal transcript of the drill in evidence/.

# Related
Previous day: ../day-24-service-logs/
Next day: ../day-26-networking-basics/
