# Day 07: Ownership & Special Bits

# Phase 2 - Permissions, Ownership & Security | Day 7 of 30

# Commands covered today
See commands.md for all 10 commands with syntax and my own explanation
of what each one does and when I would reach for it.

# What I practiced
Changed file ownership with chown, chown user:group, and chgrp, then explored
the special permission bits: SUID, SGID, and the sticky bit. Built a shared
project folder with SGID applied and confirmed new files inherit its group.
Ran a full system-wide audit for SUID binaries and genuinely found — and then
fixed — an unexpected one on my own machine.

# What surprised me
Running chown -R root:root against my entire GitHub repo instead of a scoped
test folder was a real, slightly alarming moment — every file in the project
was suddenly owned by root, which would have blocked my own write access to
my own work. Recovering it with chown -R new:new was simple, but it made the
danger of -R combined with root ownership very real rather than theoretical.
The SUID audit was even more striking: my own test script showed up in the
same list as passwd and sudo, which is exactly the kind of thing a real
security audit exists to catch.

# Evidence
Screenshot or terminal transcript of the drill in evidence/.

# Related
Previous day: ../day-06-permissions/
Next day: ../day-08-privilege-escalation/
