# Day 13: APT Package Management (Debian/Ubuntu)

# Phase 3 - Users, Groups & Package Management | Day 13 of 30

# Commands covered today
See commands.md for all 10 commands with syntax and my own explanation
of what each one does and when I would reach for it.

# What I practiced
Refreshed the package index, ran a real upgrade that pulled in a new
kernel, then used full-upgrade to clean out the now-obsolete old kernel
entirely. Installed a small real utility (cowsay), inspected it two
different ways (apt show and dpkg -L), confirmed it worked, then purged it
completely and verified no trace was left behind. Finished by cleaning up
genuinely orphaned dependency packages with autoremove.

# What surprised me
A real kernel upgrade triggered a real failure: VirtualBox's Guest
Additions tried to automatically rebuild its kernel driver for the new
kernel and failed because a required compiler (gcc-12) wasn't installed.
The core system upgrade still succeeded — only that one optional
side-effect script failed — which was a good, real lesson in reading
error output carefully rather than assuming one error means the whole
operation failed.

# Evidence
Screenshot or terminal transcript of the drill in evidence/.

# Related
Previous day: ../day-12-groups/
Next day: ../day-14-dnf-yum/
