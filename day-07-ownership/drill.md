# Day 7 Practice Drill

## Task
Create a shared project folder, apply the SGID bit so new files inherit its
group, then audit the whole system for unexpected SUID binaries.

## Commands run (in order)
1. touch ownership-test.txt / sudo chown root ownership-test.txt   → chown demo
2. chown root: root myscript.sh   → FAILED (space after colon parsed as two args)
3. sudo chown root:root myscript.sh   → corrected, both owner+group set
4. sudo chown new:new ownership-test.txt   → restored ownership
5. sudo chown -R root:root ~/YK-linux-command-mastery-challenge/  → applied to
   entire live repo instead of a scoped test folder — every file temporarily
   owned by root, would have locked out normal user access
6. sudo chown -R new:new ~/YK-linux-command-mastery-challenge/   → restored
7. sudo chgrp docker ownership-test.txt / sudo chgrp new ownership-test.txt
8. sudo chmod u+s myscript.sh   → SUID set, showed as capital S (no execute bit
   present underneath, since file was 600 from Day 6)
9. mkdir ~/shared-project
10. sudo chgrp docker ~/shared-project (initial), later group ended up as `new`
11. sudo chmod g+s ~/shared-project   → SGID applied, confirmed drwxrwsr-x
12. touch ~/shared-project/testfile.txt   → confirmed inherited group `new`
    matching the folder's own group (SGID inheritance verified)
13. sudo chmod +t ~/shared-project   → sticky bit applied, confirmed drwxrwsr-t
14. sudo find / -perm /4000 -type f 2>/dev/null   → system-wide SUID audit;
    found /home/new/myscript.sh listed among legitimate system binaries —
    a genuine unexpected SUID finding
15. sudo chmod u-s myscript.sh   → remediated, removed SUID from the personal script
16. getfacl ownership-test.txt   → baseline ACL, no custom entries
17. setfacl -m u:root:rwx ownership-test.txt   → added explicit ACL entry for root
18. getfacl ownership-test.txt   → confirmed user:root:rwx and mask::rwx entries
19. ls -l ownership-test.txt   → confirmed trailing + indicating active ACLs

## Result
Successfully created a shared project folder with SGID applied and file
inheritance verified. Ran a full system SUID audit and found a genuine
unexpected result — a personal test script with SUID mistakenly set — which
was then correctly remediated.

## Problem encountered and fix
- chown root: root myscript.sh (space after colon) failed, parsed as two
  separate arguments — corrected to chown root:root with no space.
- chown -R root:root was run against the entire live GitHub repo instead of a
  scoped test folder, temporarily giving root ownership of every file in the
  project — restored immediately with chown -R new:new, but a strong real
  lesson in how -R combined with root ownership can lock a user out of their
  own files.
- The SUID audit surfaced a genuine unexpected finding: myscript.sh (a
  personal test file from Day 6) had SUID set from this day's own testing,
  which would be flagged as suspicious in a real audit — removed it after
  confirming the finding.
