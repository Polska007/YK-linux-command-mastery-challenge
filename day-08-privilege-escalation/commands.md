# Commands - Day 8

## sudo
Lets a permitted user run a single command with elevated (typically root) privileges, checked against /etc/sudoers.

## sudo -i
Starts a full interactive root shell, with root's own environment and home directory, until you exit.

## sudo -u
Runs a command as a specific user other than root.

## sudo !!
Re-runs the immediately previous command with sudo prepended — a shortcut for when you forget sudo and a command fails.

## sudo -l
Lists exactly what sudo privileges your account has been granted — which commands, as which users.

## visudo
The only safe way to edit /etc/sudoers — locks the file and validates syntax before saving, preventing a broken config from locking everyone out of sudo.

## su
Switches to a different user (root by default) within the current shell, prompting for the target user's own password.

## su -
Same as su, but also loads the target user's full environment and home directory, as if they'd logged in fresh themselves.

## whoami
Prints the username of whoever is currently running the shell.

## id
Shows UID, GID, and every group the current user belongs to — reveals why certain access exists, not just who you are.
