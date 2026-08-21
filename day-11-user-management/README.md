# Day 11: Creating & Managing Users

# Phase 3 - Users, Groups & Package Management | Day 11 of 30

# Commands covered today
See commands.md for all 10 commands with syntax and my own explanation
of what each one does and when I would reach for it.

# What I practiced
Compared bare-bones useradd against useradd -m -s and the interactive
adduser, seeing how much manual setup useradd skips by default. Set a
user's password, added them to a secondary group without losing existing
group membership, renamed the account, and finished by comparing userdel
against userdel -r side by side on two different test accounts.

# What surprised me
Renaming an account with usermod -l changes the login name but not the
home directory path — the account was "draftuser2" but still lived at
/home/draftuser. Also genuinely useful to see userdel leave a real orphaned
directory behind (owned by a raw UID once the username no longer resolved),
directly next to another account that userdel -r cleaned up completely.

# Evidence
Screenshot or terminal transcript of the drill in evidence/.

# Related
Previous day: ../day-10-security-audit-checkpoint/
Next day: ../day-12-groups/
