# Day 17 — Practice Drill

## Drill

Add a permanent environment variable and a custom alias to `.bashrc`, reload it without opening a new terminal, and confirm both persist in a fresh session.

## Step 1 — Edit `.bashrc`

I opened my personal Bash configuration file:

```bash
nano ~/.bashrc
```

I added:

```bash
export CHALLENGE_DAY="Day 17"
alias ll17='ls -la'
```

I then saved the file and exited Nano.

## Step 2 — Reload the Configuration

Instead of opening another terminal, I reloaded `.bashrc`:

```bash
source ~/.bashrc
```

This applied the changes to my current shell.

## Step 3 — Verify the Configuration

I verified the new alias and environment variable.

The custom alias was available as:

```bash
alias ll17='ls -la'
```

The environment variable was also available in the current shell.

## Step 4 — Test the Alias

I used the custom alias:

```bash
ll17
```

This performed the same operation as:

```bash
ls -la
```

## Step 5 — Test Persistence

I used `unalias` to remove `ll17` from the current shell and then reloaded `.bashrc`:

```bash
unalias ll17
source ~/.bashrc
```

The alias was available again, demonstrating that its configuration was stored in `.bashrc` rather than existing only as a temporary shell setting.

## Step 6 — Command Discovery

I used `type`, `which`, and `whereis` to understand how Linux identifies commands.

For example:

```bash
type ll17
which ll17
whereis ll17
```

The results showed the difference between an alias and a real executable.

## What I Learned

The main lesson from today's drill was the difference between making a change temporarily in the current shell and saving it in a configuration file so it can be loaded again.

`.bashrc` provides a convenient place for personal Bash customizations such as aliases and environment variables.
