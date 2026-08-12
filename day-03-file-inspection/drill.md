# Day 3 Practice Drill

## Task
Pick any log file on the system. View it fully with cat, page through it with less,
show the first and last 15 lines, count its lines, identify its file type, and
inspect its full metadata with stat.

## File used
/var/log/syslog

## Commands run (in order)
1. cat /var/log/syslog            → Permission denied initially, required sudo
2. sudo cat /var/log/syslog       → full file dumped to screen
3. less /var/log/syslog           → opened interactively; initially struggled to quit
4. sudo head /var/log/syslog      → first attempt without sudo failed (Permission denied)
5. sudo head -n 20 /var/log/syslog → mistakenly used 20 instead of the required 15
6. sudo head -n 15 /var/log/syslog → corrected, first 15 lines
7. sudo tail /var/log/syslog      → last 10 lines (default)
8. sudo tail -n 15 /var/log/syslog → last 15 lines
9. sudo tail -f /var/log/syslog   → followed live; caught the terminal's own
                                     session appearing in the log in real time;
                                     exited with Ctrl+C
10. sudo wc /var/log/syslog       → 15266 lines, 207839 words, 1785599 bytes
11. sudo wc -l /var/log/syslog    → 15570 lines (count grew since step 10, since
                                     the file is actively being written to)
12. sudo file /var/log/syslog     → ASCII text, with very long lines (1860)
13. sudo stat /var/log/syslog     → full metadata, confirmed syslog/adm ownership
                                     and 0640 permissions explain the earlier
                                     Permission denied errors

## Result
Successfully read, paged through, counted, identified, and inspected the full
metadata of /var/log/syslog using all 10 of Day 3's commands.

## Problem encountered and fix
- Every read command initially failed with Permission denied until sudo was used —
  confirmed later via stat that the file is owned by syslog:adm with 0640 permissions.
- Struggled to quit less on the first attempt — didn't realize q was the exit key.
- Ran head -n 20 instead of the required head -n 15 — corrected and re-ran.
