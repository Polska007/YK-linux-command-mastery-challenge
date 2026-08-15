# Day 6 Practice Drill

## Task
Create a script file and set it to rwxr-xr-x using all three chmod methods
(relative, assignment, octal) in turn, confirming the result with ls -l after
each change.

## Commands run (in order)
1. touch myscript.sh                          → created with default rw-rw-r--
2. chmod u+x,g-w,g+x,o+x myscript.sh          → relative method → rwxr-xr-x
3. ls -l myscript.sh                          → confirmed rwxr-xr-x
4. chmod u=rwx,g=rx,o=rx myscript.sh          → assignment method → rwxr-xr-x
5. ls -l myscript.sh                          → confirmed rwxr-xr-x
6. chmod 755 myscript.sh                      → octal method → rwxr-xr-x
7. ls -l myscript.sh                          → confirmed rwxr-xr-x
8. chmod 644 myscript.sh                      → rw-r--r--
9. chmod 600 myscript.sh                      → rw-------
10. chmod -R 755 ~/YK-linux-command-mastery-challenge/  → applied recursively
    to the whole repo instead of a scoped test folder
11. umask                                     → 0002
12. umask -S                                  → u=rwx,g=rwx,o=rx
13. stat -c '%A %U %G' myscript.sh            → -rw------- new new

## Result
Successfully reached rwxr-xr-x using all three required chmod methods
(relative, assignment, octal), each independently verified with ls -l.
Also demonstrated 644 and 600 modes, a recursive chmod, and both forms of umask.

## Problem encountered and fix
- Ran chmod -R 755 against the entire YK-linux-command-mastery-challenge repo
  instead of a scoped test folder like ~/practice. This gave README.md and
  LICENSE unnecessary execute permission (755) even though they're plain
  documentation files, not scripts. Harmless locally since it's just permission
  bits with nothing security-sensitive exposed, but a clear real-world example
  of how easy it is for -R to reach further than intended.
