# Day 08: Privilege Escalation & Identity

# Phase 2 - Permissions, Ownership & Security | Day 8 of 30

# Commands covered today
See commands.md for all 10 commands with syntax and my own explanation
of what each one does and when I would reach for it.

# What I practiced
Explored the difference between sudo (borrows privileges using my own
password) and su (switches identity using the target account's own
password). Used sudo -i for a full root shell, sudo -u to act as another
user for one command, and sudo !! to instantly retry a failed command with
elevated privileges. Checked exactly what my account is authorized to do
with sudo -l, and safely opened (without editing) the sudoers file with
visudo.

# What surprised me
su root and su - root both failed no matter what I typed, and tracing it
back to /etc/shadow explained why: root's password is locked (shown as a
"!" in the hash field), so there's no valid password to ever enter — this
system is deliberately set up to force all privileged access through sudo
rather than direct root login. It made the difference between sudo and su
concrete instead of just theoretical.

# Evidence
Screenshot or terminal transcript of the drill in evidence/.

# Related
Previous day: ../day-07-ownership/
Next day: ../day-09-integrity-firewall/
