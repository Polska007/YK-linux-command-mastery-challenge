# Day 17 — Persisting Configuration

## Phase 4 — Environment, Vim & Text Processing | Day 17 of 30

Today I moved from temporary shell configuration to making changes that can be loaded again in future sessions.

I worked with `.bashrc`, environment configuration, aliases, and commands for finding out how Bash interprets and locates commands.

## Commands Covered

1. `nano ~/.bashrc`
2. `source ~/.bashrc`
3. `cat ~/.bash_profile`
4. `sudo nano /etc/environment`
5. `sudo nano /etc/bash.bashrc`
6. `alias`
7. `unalias`
8. `type`
9. `which`
10. `whereis`

See [commands.md](./commands.md) for the detailed notes and examples.

## What I Practiced

The main drill was to add a permanent environment variable and a custom alias to `.bashrc`, reload the configuration without opening a new terminal, and verify that the configuration could be loaded again.

I added:

```bash
export CHALLENGE_DAY="Day 17"
alias ll17='ls -la'
```

I then used `source ~/.bashrc` to reload the configuration.

I also used `unalias`, `type`, `which`, and `whereis` to understand how aliases, shell builtins, and executable files are identified.

## What Surprised Me

The biggest thing that stood out to me was the difference between `type`, `which`, and `whereis`.

They can all be used when trying to understand a command, but they don't give the same information.

`type` was able to identify my `ll17` alias and the `cd` shell builtin, while `which` only returned paths for actual executable files.

## Evidence

The terminal work and command results from today's practice are documented in [drill.md](./drill.md).

## Status

✅ Day 17 completed
