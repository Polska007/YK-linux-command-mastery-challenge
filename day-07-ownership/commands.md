# Commands - Day 7

## chown
Changes which user owns a file or directory.

## chown user:group
Changes both the owner and group simultaneously, separated by a colon.

## chown -R
Applies an ownership change recursively to a directory and everything inside it.

## chgrp
Changes only the group ownership of a file, leaving the user owner untouched.

## chmod u+s (SUID)
Sets the Set User ID bit on an executable, making it run with the file owner's permissions rather than the executing user's.

## chmod g+s (SGID)
Sets the Set Group ID bit. On directories, causes new files created inside to inherit the directory's group automatically.

## chmod +t (sticky bit)
Restricts deletion within a shared, writable directory so users can only delete/rename files they themselves own.

## find -perm /4000
Searches for files with the SUID bit set, system-wide — a standard security audit technique.

## getfacl
Displays a file's Access Control List, showing standard permissions plus any additional user/group-specific grants.

## setfacl -m
Modifies a file's ACL, adding a specific permission entry for an individual user or gro
