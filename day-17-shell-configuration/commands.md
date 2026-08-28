# Commands - Day 17

## nano ~/.bashrc
Opens the personal, per-user shell configuration file that runs on every new interactive terminal — the standard place to add permanent variables, aliases, and PATH changes.

## source ~/.bashrc
Reloads the .bashrc file within the current shell, applying any new changes immediately without needing a new terminal.

## cat ~/.bash_profile
Reads the login-shell-specific config file. Not present on this system by default — Ubuntu desktop relies on .profile instead.

## sudo nano /etc/environment
Opens the system-wide simple KEY=value environment file, applying to every user on the machine.

## sudo nano /etc/bash.bashrc
Opens the system-wide shell script equivalent of .bashrc, running for every user's interactive shells — supports real shell logic, not just variable definitions.

## alias
Lists every currently active alias in the shell.

## unalias
Removes an alias from the current session only — doesn't touch the underlying .bashrc file where it may still be permanently defined.

## type
Reports what kind of thing a command name is: shell builtin, alias, function, or executable file (with its path).

## which
Searches PATH specifically for an executable file matching a command name — returns nothing for aliases or builtins, since neither is a standalone file.

## whereis
Searches standard system locations for a command's binary, source, and manual page all at once — broader than which's PATH-only search.
