# Day 5 Practice Drill (Checkpoint)

## Task
Create a symbolic link to a config file, resolve its real path, print a two-level
tree of /etc, and explain to a peer, in your own words, the difference between
a hard link and a symbolic link.

## Commands run (in order)
1. tree ~/YK-linux-command-mastery-challenge   → tree not installed, required
                                                   sudo apt install tree first
2. tree -L 2 /etc                              → correctly limited two-level tree
3. ln /etc/hostname ~/hostname-hardlink        → failed without sudo (Operation
                                                   not permitted); succeeded with sudo
4. ls -li /etc/hostname ~/hostname-hardlink    → confirmed matching inode 130725
                                                   and link count incremented to 2
5. ln -s /etc/hostname ~/hostname-symlink      → succeeded without sudo
6. ls -li /etc/hostname ~/hostname-symlink     → confirmed different inode 1313873,
                                                   type 'l', arrow to /etc/hostname
7. sudo mv /etc/hostname /etc/hostname-moved-temporarily
8. cat ~/hostname-hardlink                     → still printed "NEW" (unaffected)
9. cat ~/hostname-symlink                      → failed: No such file or directory
                                                   (dangling symlink)
10. sudo mv /etc/hostname-moved-temporarily /etc/hostname  → restored original
11. cat ~/hostname-symlink                     → symlink immediately healed, printed "NEW"
12. readlink ~/hostname-symlink                → /etc/hostname
13. realpath ~/hostname-symlink                → /etc/hostname
14. basename /etc/hostname                     → hostname
15. dirname /etc/hostname                      → /etc
16. pushd /var/log && pwd && popd && pwd       → confirmed stack push/pop behavior
17. ls -lt ~/YK-linux-command-mastery-challenge → confirmed newest-first sort by
                                                    modification time

## Result
Live-demonstrated the real difference between a hard link and a symbolic link:
renaming the original /etc/hostname left the hard link completely unaffected
(same underlying data, same inode), while the symlink broke immediately
(dangling — pointing at a path that no longer existed), then healed the moment
the original path was restored.

## Explanation for a peer

A hard link and a symbolic link both let you access the same file through more
than one name, but they work completely differently under the hood.

A hard link is a second name pointing directly at the same actual data on disk.
There's no "original" and no "copy" — they're both equally real, and Linux
tracks this by giving them the same inode number. If you delete or rename one
of the names, the file's data is unaffected — it's still fully accessible
through whichever other name still exists.

A symbolic link is a small pointer file that stores a path, like a sticky note
saying "go look over there." It has its own separate inode number. If the
original file is moved, renamed, or deleted, the symlink doesn't know — it
just keeps pointing at a path that no longer leads anywhere, becoming a
"dangling" link.

I proved this directly: I created both a hard link and a symlink to
/etc/hostname, then temporarily renamed the original file. The hard link kept
working perfectly. The symlink broke immediately with "No such file or
directory." The moment I renamed the file back, the symlink started working
again on its own.

## Problem encountered and fix
- tree wasn't installed by default — required installing it via apt, same
  pattern as locate/plocate on Day 4.
- Creating a hard link to /etc/hostname failed without sudo (Operation not
  permitted), even though reading the file didn't require elevated permissions —
  needed sudo specifically for the link creation.
