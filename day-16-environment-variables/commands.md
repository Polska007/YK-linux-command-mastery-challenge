# Commands - Day 16

## printenv
Prints every environment variable currently set in the shell session.

## printenv HOME
Prints the value of one specific variable, narrowed from the full list.

## echo $VAR
Reads a variable's value using shell expansion — $VARNAME gets replaced with its actual value before echo prints it.

## export
Marks a variable as an environment variable, making it visible to child processes the shell launches, not just the current shell itself.

## unset
Completely removes a variable from the environment, as if it had never been set.

## env
Displays all environment variables — functionally almost identical to printenv when used with no arguments.

## source
Runs a script within the current shell rather than a separate child process, so any variables it exports persist in the current session afterward.

## echo $PATH
Shows PATH — the colon-separated list of directories the shell searches, in order, to find executable commands by name.

## export PATH=$PATH:
Appends a new directory to the existing PATH rather than replacing it — omitting $PATH: would wipe out the whole existing PATH.

## cat /etc/environment
Reads the system-wide environment configuration file, applying to every user and every login, persisting across reboots.
