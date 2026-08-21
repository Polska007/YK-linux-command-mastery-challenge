# Commands - Day 11

## useradd
Creates a new user account — bare minimum, no home directory or shell configured by default.

## useradd -m
Same as useradd, but creates a home directory, copying default files from /etc/skel.

## useradd -m -s
Creates a user with a home directory and an explicitly specified login shell.

## adduser
Interactive, user-friendly wrapper around useradd — prompts for password and optional details, sets sensible defaults automatically.

## passwd
Sets or changes a user's password.

## usermod -aG
Appends a user to an additional secondary group without removing existing group memberships.

## usermod -s
Changes an existing user's login shell after account creation.

## usermod -l
Renames a user's login name — does not rename their home directory path.

## userdel
Deletes a user account but leaves their home directory behind.

## userdel -r
Deletes a user account and removes their home directory and mail spool.
