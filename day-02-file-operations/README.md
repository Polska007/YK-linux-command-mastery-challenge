# Day 02: Creating, Copying, Moving, Deleting

# Phase 1 - File Navigation & Filesystem Mastery | Day 2 of 30

# Commands covered today
See commands.md for all 10 commands with syntax and my own explanation
of what each one does and when I would reach for it.

# What I practiced
Built a nested folder structure with mkdir -p, created files inside it with touch,
copied the whole structure to a backup with cp -r, renamed one file with mv, then
checked for empty directories to remove — none existed, so I demonstrated rmdir's
safe-delete behavior on a throwaway empty folder instead.

# What surprised me
rm -r and rm -rf will delete non-empty folders without hesitation, but rmdir
refuses unless a folder is completely empty. That distinction is a real safety net —
rmdir being "limited" is actually the point, not a flaw.

# Evidence
Screenshot or terminal transcript of the drill in evidence/.

# Related
Previous day: ../day-01-file-navigation/
Next day: ../day-03-file-inspection/
