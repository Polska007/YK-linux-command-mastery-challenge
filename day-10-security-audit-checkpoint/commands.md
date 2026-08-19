# Commands - Day 10 (Checkpoint)

## find / -perm /4000 (SUID audit)
Searches the whole filesystem for files with the SUID bit set — a repeat security audit from Day 7, confirming the fix held.

## last
Shows a history of recent login/logout sessions, from /var/log/wtmp.

## lastlog
Shows the single most recent login for every user account, or flags accounts that have never logged in.

## w
Shows who is logged in right now, their idle time, current activity, and system load.

## who
A simpler version of w — just who's logged in, their terminal, and login time.

## groups
Lists every group a user belongs to.

## passwd
Changes a user's password (interactive), or with -S, shows password status without changing anything.

## chage -l
Shows detailed, human-readable password aging information for a user.

## lastb
Shows a history of failed/bad login attempts, from /var/log/btmp.

## history | grep sudo
Filters the shell's command history down to only lines containing "sudo".
