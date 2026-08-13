# Day 4 Practice Drill

## Task
Find every .conf file under /etc, find every file larger than 1MB in /var, then
report total disk usage of /home and remaining free space on the root filesystem.

## Commands run (in order)
1. find /etc -name "*.conf"           → large list of .conf files, with a few
                                          Permission denied entries (e.g. /etc/cups/ssl)
2. find /etc -type d -name "conf.d"   → 6 conf.d directories found under /etc
3. find /var -size +1M                → run without sudo, many permission errors,
                                          but still surfaced a valid list of files >1MB
4. find /var -size +1G                → no real matches, confirming nothing that
                                          large exists in accessible parts of /var
5. sudo find /var/log -mtime -1       → clean run, showed all actively-used log
                                          files modified in the last 24 hours
6. find /etc -perm 644                → hundreds of files matching exactly 644
7. locate syslog                      → failed initially: locate not installed
8. sudo apt update && sudo apt install plocate -y  → installed plocate
9. locate syslog                      → instant results after installing plocate
10. sudo updatedb                     → rebuilt the locate index, silent success
11. du /home                          → ran without -sh by mistake, produced
                                          hundreds of lines (mostly node_modules)
12. du -sh /home                      → correct summary: 5.1G /home
13. df -h                             → root filesystem (/dev/sda3): 25G total,
                                          22G used, 2.0G available, 92% used

## Result
- .conf files under /etc: confirmed via find -name, large list returned
- Files >1MB in /var: confirmed via find -size +1M
- /home disk usage: 5.1G (via du -sh)
- Root filesystem free space: 2.0G available, 92% used (via df -h)

## Problem encountered and fix
- locate wasn't installed on the system by default — required installing plocate
  via apt before it would work at all.
- Initially ran plain du /home instead of du -sh /home, producing an overwhelming
  multi-hundred-line listing instead of the clean single-line summary — re-ran
  with the correct flags.
- Ran find /var -size +1M without sudo, producing many Permission denied lines
  mixed into otherwise valid results.
