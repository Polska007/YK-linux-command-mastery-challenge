# Day 25 Practice Drill (Checkpoint)

## Task
Build a one-screen operational snapshot of a server covering uptime,
memory, the status of three key services, and any scheduled cron jobs.

## Operational Snapshot — findings

### Uptime
23:07:18 up 42 min, 1 user, load average: 0.03, 0.04, 0.06
Confirmed identical to the summary line at the top of w's output.

### Memory (free -h)
Total: 20Gi | Used: 1.1Gi | Available: 18Gi | Swap: 2.0Gi (0B used)
Healthy — no memory pressure, swap completely unused.

### Broader system health (vmstat / iostat)
vmstat: 98% CPU idle, 0% waiting on I/O, 2 runnable processes.
iostat: 97.92% CPU idle, 0.11% iowait. sysstat package was not installed
by default — installed live to get iostat working.

### Service Status (three key services)
1. cups.service — active (running), enabled, PID 862
2. cron.service — active (running), enabled, PID 764
3. ssh.service — NOT initially present ("could not be found"); installed
   openssh-server live, which generated new SSH host keys and enabled the
   service automatically. Confirmed active (running) and enabled afterward.
   journalctl -u ssh --since today confirmed sshd listening on port 22 —
   the exact port opened in the firewall back on Day 9, now finally in use.

### Liveness check
kill -0 5626 (sshd's PID) → exit code 0, confirming the process is alive.

### Scheduled Cron Jobs (crontab -l)
Initially: "no crontab for new" (none existed).
Added one real job via crontab -e:
  0 3 * * * /usr/bin/echo "daily check" >> /home/new/crontest.log
Confirmed present with a follow-up crontab -l.

## Result
Built a complete, real one-screen operational snapshot: uptime, memory,
three service statuses (one requiring live installation), and cron job
status — moving from "none scheduled" to a genuine, confirmed entry.

## Problem encountered and fix
- ssh.service didn't exist on this system at all — installed
  openssh-server on the fly to properly demonstrate a real service's
  full status/logs/liveness lifecycle.
- iostat wasn't available until the sysstat package was installed —
  same "not installed by default" pattern seen with tree and locate
  earlier in the challenge.
