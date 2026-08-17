# Day 8 Practice Drill

## Task
Attempt a command that fails for lack of permission, re-run it instantly with
sudo !!, then list exactly which commands your account is permitted to run as
another user.

## Commands run (in order)
1. cat /etc/shadow                    → Permission denied
2. sudo cat /etc/shadow               → succeeded, revealed root's password
                                          is locked (! in the hash field)
3. sudo -i / whoami / pwd / exit      → entered and exited a full root shell,
                                          confirmed identity (root) and home
                                          directory (/root) while inside
4. sudo -u www-data whoami            → confirmed identity switched to
                                          www-data for that one command only
5. cat /etc/gshadow                   → Permission denied
6. sudo !!                            → shell echoed "sudo cat /etc/gshadow"
                                          and ran it successfully — confirmed
                                          sudo:*::new, explaining sudo access
7. sudo -l                            → (ALL : ALL) ALL — full sudo access
8. su root                            → Authentication failure (root's
                                          password is locked, no valid
                                          password exists to enter)
9. visudo (without sudo)              → Permission denied
10. sudo !! → sudo visudo             → opened successfully, exited without
                                          changes, confirmed "unchanged"
11. su - root                         → Authentication failure (same reason
                                          as plain su root — the dash doesn't
                                          change whether auth succeeds)
12. whoami                            → new
13. id                                → uid=1000(new) gid=1000(new)
                                          groups=1000(new),27(sudo),
                                          997(docker),999(vboxsf)

## Result
- Command failed for lack of permission (cat /etc/gshadow), immediately
  re-run successfully with sudo !! ✅
- Exact list of what the account is permitted to run as another user,
  confirmed via sudo -l: (ALL : ALL) ALL — unrestricted, any command,
  as any user ✅

## Problem encountered and fix
- su root and su - root both failed with Authentication failure — traced
  back to /etc/shadow showing root:!:... (the ! means root's password is
  locked entirely on this system, forcing all privileged access through
  sudo instead of direct root login).
- Tried a nonexistent command, "show user" — not a real Linux command;
  the shell suggested unrelated mail utility packages, a different kind
  of failure from a permissions issue.
</parameter>
