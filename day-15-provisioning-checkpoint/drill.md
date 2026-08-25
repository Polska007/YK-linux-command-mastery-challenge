# Day 15 Practice Drill (Checkpoint)

## Task
Provision a complete new team member account (user, groups, password) and
install the three tools they need for their role, in a single documented
sequence.

## Scenario
New team member: ykazeem, provisioned as a DevOps engineer needing git,
curl, and htop.

## Commands run (in order, per history)
1. id ykazeem                         → confirmed: no such user (safe to proceed)
2. getent passwd ykazeem              → confirmed empty, second verification
3. sudo useradd -m docker -G docker && sudo /bin/bash
                                       → FAILED: docker was misplaced as the
                                          username argument instead of the
                                          group; error: "group docker exists"
4. sudo useradd -m -G docker -s /bin/bash ykazeem
                                       → corrected, account created successfully
5. id ykazeem                         → confirmed: home dir, Bash shell,
                                          primary group ykazeem, secondary
                                          group docker
6. sudo passwd ykazeem                → first full attempt: rejected 3 times
                                          (too short, then dictionary word
                                          twice), exhausted retry limit
7. sudo passwd ykazeem (2nd attempt)  → succeeded on first try
8. apt list --installed | grep -E "git|curl|htop"
                                       → confirmed git and curl already
                                          installed; htop absent
9. sudo apt list --upgradable         → confirmed only snapd outstanding,
                                          system otherwise healthy
10. sudo apt update && sudo apt install ytop -y
                                       → typo, "ytop" is not a real package
11. sudo apt update && sudo apt install htop -y
                                       → corrected, htop installed successfully
12. dpkg -l | grep -E "git|curl|htop" → confirmed all three tools show ii
                                          (installed) status
13. sudo apt autoremove               → 0 to remove, clean result
14. history | tail -30                → produced the full documented sequence

## Result
Successfully provisioned a complete new team member account end-to-end:
user created with home directory and Bash shell, added to the docker
group, password set (after real policy enforcement), and all three
required tools (git, curl, htop) confirmed installed — two already
present, one freshly installed. The full sequence is captured and
documented via the session's command history.

## Problem encountered and fix
- useradd argument order mistake: ran `useradd -m docker -G docker`,
  which placed "docker" as the username instead of the group, colliding
  with an existing group of the same name. Corrected to
  `useradd -m -G docker -s /bin/bash ykazeem`.
- Password for ykazeem was rejected three times in a row (too short, then
  a dictionary word twice) before exhausting the retry limit — succeeded
  on a completely fresh attempt.
- Typo'd "ytop" instead of "htop" on the first install attempt — apt
  correctly could not find that package; corrected on the next command.

## Phase 3 reflection
This checkpoint pulled together everything from Days 11-14 into one real,
end-to-end task: user creation, group assignment, password policy, and
package management, all in a single realistic onboarding scenario rather
than isolated command drills. The useradd argument-order mistake in
particular was a good reminder that flag/argument position matters just
as much as knowing the right flag exists.
</parameter>
