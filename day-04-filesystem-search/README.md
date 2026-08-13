# Day 04: Searching the Filesystem

# Phase 1 - File Navigation & Filesystem Mastery | Day 4 of 30

# Commands covered today
See commands.md for all 10 commands with syntax and my own explanation
of what each one does and when I would reach for it.

# What I practiced
Used find with -name, -type, -size, -mtime, and -perm to search /etc and /var
for specific files. Discovered locate wasn't installed, installed plocate, then
used locate and updatedb to search via a pre-built index instead of a live scan.
Finished by measuring /home's disk usage with du -sh and checking the root
filesystem's remaining space with df -h.

# What surprised me
locate wasn't installed by default, which was a good reminder that not every
"standard" Linux command is guaranteed to be present on every system — some,
like locate/plocate, are optional packages. I also learned the hard way that du
without -sh dumps a massive line-by-line breakdown, while du -sh gives the clean
single-number summary that's actually useful day-to-day.

# Evidence
Screenshot or terminal transcript of the drill in evidence/.

# Related
Previous day: ../day-03-file-inspection/
Next day: ../day-05-links-checkpoint/
