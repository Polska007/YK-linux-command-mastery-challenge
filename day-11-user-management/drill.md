# Day 11 Practice Drill

## Task
Create a new user with a home directory and Bash shell, set their password,
add them to a secondary group, rename the account, then remove it along
with its home directory.

## Commands run (in order)
1. sudo useradd testuser1              → bare account, no home directory
2. sudo useradd -m testuser2           → home directory created, default shell /bin/sh
3. sudo useradd -m -s /bin/bash draftuser → home dir + Bash shell (drill's account)
4. sudo adduser testuser4              → interactive creation, all optional fields skipped
5. sudo passwd draftuser               → set password (rejected once for length,
                                            once for mismatch, succeeded on 3rd entry)
6. sudo usermod -aG docker draftuser   → added to docker group, confirmed with groups
7. sudo usermod -s /bin/bash testuser2 → changed shell from /bin/sh to /bin/bash
8. sudo usermod -l draftuser2 draftuser → renamed account; home dir path stayed
                                            /home/draftuser (did not auto-rename)
9. sudo userdel testuser2              → account deleted, home directory orphaned
                                            (confirmed still present, owned by raw UID)
10. sudo userdel -r draftuser2         → account and home directory fully removed,
                                            confirmed gone from /home/

## Result
Full drill completed end-to-end: created a user with home dir + Bash shell,
set their password, added a secondary group, renamed the account, and fully
removed it including its home directory.

## Problem encountered and fix
- Guessed nonexistent commands "userrm" and "userdelete" before recalling
  the correct command is userdel.
- Tried to read /etc/passwd by executing it directly (/etc/passwd, sudo /e)
  instead of using it as an argument to a reading command like grep or cat —
  corrected to grep draftuser2 /etc/passwd.
- Password for draftuser was rejected twice (too short, then a mismatch)
  before succeeding on the third entry.
