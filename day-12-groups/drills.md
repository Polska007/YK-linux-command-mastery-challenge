# Day 12 Practice Drill

## Task
Create a group named devs, add two users to it, confirm membership with
getent, remove one member, then delete the group entirely.

## Commands run (in order)
1. sudo groupadd devs                      → group created, GID 1006, no members
2. sudo gpasswd -a testuser4 devs          → tried gppassword, gpassword,
                                                gpasswrd first (all invalid),
                                                corrected to gpasswd
3. sudo useradd -m -s /bin/bash testuser5  → second user created
4. sudo gpasswd -a testuser5 devs          → added successfully
5. getent group devs                       → confirmed devs:x:1006:testuser4,testuser5
6. getent passwd testuser4 / testuser5     → confirmed both real accounts
7. groups testuser4 / testuser5            → third confirmation of membership
8. id -Gn testuser4 / testuser5            → fourth confirmation of membership
9. sudo gpasswd -a new devs                → temporarily added own account to
                                                demonstrate newgrp
10. echo "groups; touch newgrp-test.txt; ls -l newgrp-test.txt" | newgrp devs
    → confirmed devs became active primary group; new file inherited
      devs as its group owner
11. ls -l newgrp-test.txt (after session ended) → confirmed group ownership
      on the file persisted even after newgrp's session ended
12. groups (after) → confirmed own default groups reverted, devs no longer active
13. rm newgrp-test.txt / sudo gpasswd -d new devs → cleanup, doubling as a
      live demo of gpasswd -d
14. sudo gpasswd -d testuser5 devs         → removed one real drill member
15. getent group devs                      → confirmed only testuser4 remained
16. grep devs /etc/group                   → confirmed raw file matches getent's output
17. sudo groupdel devs                     → group deleted entirely
18. getent group devs                      → confirmed empty result, group fully gone

## Result
Full drill completed end-to-end: group created, two real users added,
membership independently confirmed via four different methods (getent,
groups, id -Gn, and the raw /etc/group file), one member removed, and the
group deleted completely with no error.

## Problem encountered and fix
- getent devs (missing the "group" database argument) failed with
  "Unknown database: devs" — corrected to getent group devs, repeated twice
  across the session before it fully stuck as muscle memory.
- Guessed three incorrect command names (gppassword, gpassword, gpasswrd)
  before landing on the correct gpasswd.
