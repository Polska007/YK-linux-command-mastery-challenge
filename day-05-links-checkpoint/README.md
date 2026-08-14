# Day 05: Paths, Links & Tree Structures (Checkpoint)

# Phase 1 - File Navigation & Filesystem Mastery | Day 5 of 30 (Checkpoint)

# Commands covered today
See commands.md for all 10 commands with syntax and my own explanation
of what each one does and when I would reach for it.

# What I practiced
Explored directory structures with tree and tree -L, then created both a hard
link and a symbolic link to /etc/hostname to directly compare them. Proved the
difference live by temporarily renaming the original file: the hard link kept
working (same underlying data), while the symlink broke into a dangling link,
then healed once the original path was restored. Wrapped up with readlink,
realpath, basename, dirname, pushd/popd, and ls -lt.

# What surprised me
The clearest lesson of the whole phase: a hard link doesn't care about names or
paths at all, only the actual data — renaming or moving the original file left
it completely unaffected. A symlink, by contrast, is just a note pointing at a
path, so it broke the instant that path stopped existing, and came right back
to life the moment the path existed again. Seeing it happen live made the
distinction click in a way reading about it never would have.

# Evidence
Screenshot or terminal transcript of the drill in evidence/.

# Related
Previous day: ../day-04-filesystem-search/
Next day: ../day-06-permissions/
