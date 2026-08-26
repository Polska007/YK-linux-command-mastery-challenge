# Day 16: Environment Variables

# Phase 4 - Environment, Vim & Text Processing | Day 16 of 30

# Commands covered today
See commands.md for all 10 commands with syntax and my own explanation
of what each one does and when I would reach for it.

# What I practiced
Set, confirmed, and removed a temporary environment variable using export,
echo, and unset. Proved the real difference between running a script
normally versus sourcing it, by exporting a variable inside a script and
watching it vanish after a normal run but persist after a sourced run.
Finished by adding a new directory to PATH for the current session only,
proving with a clean before/after test that a script the shell couldn't
find by name suddenly became runnable once its directory joined PATH.

# What surprised me
Running a script normally versus sourcing it produces genuinely different
results for exported variables — not just a theoretical distinction. The
exact same script, run two different ways, left my current shell
completely unaffected the first time and permanently changed the second
time. Seeing both outcomes side by side made source's real purpose click
immediately.

# Evidence
Screenshot or terminal transcript of the drill in evidence/.

# Related
Previous day: ../day-15-provisioning-checkpoint/
Next day: ../day-17-shell-configuration/
