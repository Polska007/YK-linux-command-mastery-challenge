# Day 10: Security Checkpoint & Audit (Checkpoint)

# Phase 2 - Permissions, Ownership & Security | Day 10 of 30 (Checkpoint)

# Commands covered today
See commands.md for all 10 commands with syntax and my own explanation
of what each one does and when I would reach for it.

# What I practiced
Produced a full mini security audit of the system: re-ran the SUID audit
from Day 7 to confirm the fix held, reviewed login history with last,
checked who was actively logged in with w and who, checked which accounts
have never logged in with lastlog, reviewed password status and aging with
passwd -S and chage -l, checked for failed login attempts with lastb, and
pulled a complete sudo command history for the session.

# What surprised me
lastlog reported my own account as "Never logged in" even though last
showed dozens of real sessions — a genuine discrepancy between two
different logging mechanisms, not a mistake. I also nearly changed my real
password by running the wrong passwd command, which was a good, honest
reminder that any command prompting for new input twice deserves a pause
before hitting enter, not just commands that look obviously destructive.

# Evidence
Screenshot or terminal transcript of the drill in evidence/.

# Related
Previous day: ../day-09-integrity-firewall/
Next day: ../day-11-user-management/
