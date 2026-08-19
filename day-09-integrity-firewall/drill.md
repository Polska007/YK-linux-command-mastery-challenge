# Day 9 Practice Drill

## Task
Generate a SHA-256 checksum for a downloaded file to verify its integrity,
make a file immutable with chattr, then open only port 22 and port 443 on
the firewall.

## Commands run (in order)
1. md5um ~/YK-linux-command-mastery-challenge/    → typo, corrected to md5sum
2. sudo apt install md5sum                        → failed, md5sum is part of
                                                       coreutils, not a
                                                       separately installable package
3. md5sum ~/YK-linux-command-mastery-challenge/   → failed: Is a directory
4. md5sum README.md                               → succeeded, 32-char MD5 hash
5. sha25sum google-chrome-stable_current_amd64.deb → typo, corrected to sha256sum
6. sha256sum google-chrome-stable_current_amd64.deb → succeeded, 64-char
                                                        SHA-256 hash on a real
                                                        downloaded file
7. gpg --gen-key                                  → generated real RSA 3072-bit
                                                        keypair (test4gpg <test@123>)
8. echo "..." > secret-message.txt                → created test file
9. gpg --encrypt --recipient test@123 secret-message.txt → produced
                                                        secret-message.txt.gpg (507 bytes)
10. gpg --decrypt secret-message.txt.gpg          → successfully decrypted,
                                                        original message recovered exactly
11. sudo chattr +i secret-message.txt             → made file immutable
12. rm secret-message.txt                         → failed: Operation not
                                                        permitted (proved immutability)
13. lsattr secret-message.txt                     → confirmed 'i' flag visible
14. sudo chattr -i secret-message.txt             → removed immutable flag (cleanup)
15. sudo ufw enable                               → firewall activated
16. sudo ufw port 22                              → invalid syntax, corrected
                                                        to ufw allow
17. sudo ufw allow 22                             → Rule added (v4 + v6)
18. sudo ufw allow 443                            → Rule added (v4 + v6)
19. ufw status (no sudo)                          → failed: need root
20. sudo ufw status                               → confirmed exactly ports
                                                        22 and 443 allowed, nothing else

## Result
- SHA-256 checksum generated for a genuine downloaded file
  (google-chrome-stable_current_amd64.deb) ✅
- File made immutable with chattr, proven by a failed rm attempt and
  confirmed visually with lsattr ✅
- Firewall enabled with exactly ports 22 and 443 allowed, verified with
  ufw status showing no other open ports ✅

## Problem encountered and fix
- Multiple typos (md5um, sha25sum) — both caught instantly by the shell's
  command suggestion feature.
- Attempted sudo apt install md5sum, not realizing md5sum ships as part of
  coreutils (already installed by default), not a standalone package.
- Attempted ufw port 22 (invalid syntax) before correctly using ufw allow 22.
