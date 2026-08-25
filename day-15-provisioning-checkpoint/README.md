# Day 15: Users & Packages Checkpoint

# Phase 3 - Users, Groups & Package Management | Day 15 of 30 (Checkpoint)

# Commands covered today
See commands.md for all 10 commands with syntax and my own explanation
of what each one does and when I would reach for it.

# What I practiced
Provisioned a complete, realistic new team member account end-to-end:
verified the account didn't already exist two independent ways, created
it with a home directory, Bash shell, and secondary group in one command,
set a real password (which got rejected three times by the system's
policy before succeeding), then checked, installed, and verified three
role-appropriate tools (git, curl, htop) — closing with a cleanup check
and the full sequence documented via command history.

# What surprised me
Running useradd -m docker -G docker put "docker" in the wrong argument
position entirely, silently trying to create a user named docker instead
of adding to the docker group — a genuinely easy mistake to make when
typing quickly, and a good reminder that argument order matters as much
as knowing which flags exist.

# Evidence
Screenshot or terminal transcript of the drill in evidence/.

# Related
Previous day: ../day-14-dnf-yum/
Next day: ../day-16-environment-variables/
