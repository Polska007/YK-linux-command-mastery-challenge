# Day 06: Reading & Setting Permissions

# Phase 2 - Permissions, Ownership & Security | Day 6 of 30

# Commands covered today
See commands.md for all 10 commands with syntax and my own explanation
of what each one does and when I would reach for it.

# What I practiced
Created a fresh script file and brought it to rwxr-xr-x using all three chmod
methods — relative, assignment, and octal — confirming the result with ls -l
after each one. Also explored 644 and 600 modes, applied a recursive chmod,
and checked the system's umask in both raw and symbolic form.

# What surprised me
Running chmod -R 755 against my whole repo instead of a scoped folder gave my
README.md and LICENSE files execute permission they didn't need — a small,
harmless mistake, but a real demonstration of how -R applies everywhere under
a path, not just where you meant it to. It also connected directly to umask:
this system's 0002 umask explains why my very first touch-created file
started as rw-rw-r-- instead of the more common rw-r--r--.

# Evidence
Screenshot or terminal transcript of the drill in evidence/.

# Related
Previous day: ../day-05-links-checkpoint/
Next day: ../day-07-ownership/
