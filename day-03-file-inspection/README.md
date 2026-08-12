# Day 03: Reading & Inspecting Files

# Phase 1 - File Navigation & Filesystem Mastery | Day 3 of 30

# Commands covered today
See commands.md for all 10 commands with syntax and my own explanation
of what each one does and when I would reach for it.

# What I practiced
Used /var/log/syslog as my working file for the day. Viewed it fully with cat,
paged through it with less, pulled the first and last 15 lines with head -n and
tail -n, watched it live with tail -f, counted its lines with wc and wc -l,
identified its type with file, and inspected its full metadata with stat.

# What surprised me
Every single command failed with Permission denied until I added sudo — and stat
at the end explained exactly why: the file is owned by syslog:adm with 0640
permissions, so a regular user has no read access at all. It connected directly
back to the permissions concepts from Day 1's ls -l output, even before officially
reaching the Permissions phase.

# Evidence
Screenshot or terminal transcript of the drill in evidence/.

# Related
Previous day: ../day-02-file-operations/
Next day: ../day-04-filesystem-search/
