# Day 30 Capstone: Full System Command Mastery Review

## Task
Ship one Bash script that connects to a remote server over SSH, deploys
a file with the correct ownership and permissions, restarts the relevant
service, verifies it is healthy using systemctl and journalctl, and logs
the entire run. Then walk a peer through it end to end, using only
commands from this challenge.

## Environment
Real remote target: a freshly Terraform-provisioned AWS EC2 Ubuntu
24.04 instance (the original Day 14/27 instance had been destroyed via
Terraform, so a new one was launched for this final drill). A safe,
custom "heartbeat" systemd service was created on the remote host
specifically for this capstone, to avoid any risk to real services.

## Deliverable 1: deploy.hearbeat.sh (deployment script)
See deploy.hearbeat.sh in this folder for the full script.

Summary of what it does:
1. Creates an updated local version of a small heartbeat script
2. Deploys it to the remote server via scp
3. Checks the transfer's exit code, aborting if it failed
4. SSHes in to move the file into place, set correct ownership (root:root)
   and permissions (755), and restart the service
5. Verifies health with systemctl is-active and journalctl
6. Logs every step, with timestamps, to deploy_log.txt

## Deliverable 2: system_healthcheck.sh (operational review script)
See system_healthcheck.sh in this folder. Combines:
- uptime and free -h
- ps aux filtered for key processes (sshd, cron, cups)
- systemctl is-active for three services
- journalctl -p err --since today (recent error-level log entries)
- A security audit: last, who, and history | grep sudo

## Commands run (in order) — deployment script
1. First run: REMOTE_HOST mistakenly set to "ubuntu" instead of "ec2test"
   → scp failed twice with real, logged failures
2. Diagnosed via cat on the script, found the typo
3. sed -i 's/REMOTE_HOST="ubuntu"/REMOTE_HOST="ec2test"/' deploy.hearbeat.sh
   → fixed live using sed, confirmed with grep
4. ./deploy.hearbeat.sh (corrected run) → full success: file transferred,
   ownership/permissions applied, service restarted, journalctl confirmed
   "Heartbeat v2" genuinely running with the new deployed code
5. cat deploy_log.txt → confirmed the complete, honest log including both
   earlier real failures and the final success

## Commands run (in order) — health check + remaining requirements
6. ./system_healthcheck.sh → full report generated: uptime, memory, key
   processes, three service statuses (all active), recent journal errors
   (including a real, benign VirtualBox kernel driver warning), and a
   full security audit (last logins, current session, sudo history)
7. grep "FAILED\|succeeded" deploy_log.txt | awk '{print $1, $2, $NF}' |
   sed 's/succeeded\./SUCCESS/; s/Aborting\./FAILURE/' → produced a
   clean, three-line timeline: two real failures, one real success
8. find ~ -maxdepth 1 -name "*.txt" -mtime +0 → identified four genuine
   stale files left over from earlier days (Day 6, 7, 9, and 27)
9. crontab -e → scheduled the health check to run daily at 6am, added
   alongside the existing Day 25 test job and Day 29 hourly watchdog job
10. crontab -l → confirmed all three scheduled jobs present

## Result
Every task-based requirement for Day 30 was completed with genuine,
real evidence rather than a rehearsed run: a working remote deployment
script (built on a freshly re-provisioned EC2 instance after the
original was destroyed via Terraform), a combined operational health
report, real log parsing, real stale file identification, and a properly
scheduled recurring health check — all using only commands and
techniques covered across the previous 29 days.

## Problem encountered and fix
- The original EC2 instance from Day 14/27 had been destroyed via
  Terraform before this capstone began — required provisioning a new
  instance and updating ~/.ssh/config to point at it.
- deploy.hearbeat.sh initially had REMOTE_HOST set to "ubuntu" instead
  of "ec2test" (a leftover typo from early script creation), causing
  two genuine, fully-logged deployment failures before being diagnosed
  and fixed live with sed.
- A stray "2find" typo was caught instantly by the shell's suggestion
  feature before running the corrected find command.

## Peer Walkthrough

"This script deploys an updated version of a small service to a remote
server, checks that it worked, and keeps a record of everything it did.
Let me walk you through it top to bottom.

First, it defines a few variables at the top — which remote host to
connect to, where the file goes, and where to write its own log. That
log function is just a helper: every important step gets timestamped
and written both to the screen and to a file, so there's a permanent
record even if nobody's watching it run.

It starts by creating a new version of the file locally — in this case,
a tiny script that just prints a heartbeat message. Then it uses scp to
securely copy that file over SSH to the remote server's /tmp folder. It
checks the exit code right after — $? — so if the copy genuinely
failed, the script stops immediately instead of pretending everything's
fine and making things worse.

Once the file's on the server, it opens an SSH session and runs a small
block of remote commands: move the file into its real location, set the
correct owner (root:root) and permissions (755, so it's executable but
not writable by everyone), then restart the actual service so it picks
up the new file.

After that, it checks the service's health two ways: systemctl is-active
tells you if it's currently running, and journalctl pulls the actual
recent log lines, so you can literally see the new version's message
appear in the system's own logs — real proof it took effect, not just
an assumption.

Every single one of those steps gets logged with a timestamp. If you
open the log file afterward, you can see exactly what happened, in
order — including, honestly, two real failed attempts I had along the
way, from a typo in the server's address. Those are still in the log,
because the whole point of logging is to have an honest record, not
just a highlight reel.

The commands in here — scp, ssh, chmod, chown, systemctl, journalctl,
functions, exit codes, and logging — aren't new. They're the same
commands from Days 6, 7, 23, 25, 27, and 29 of this whole challenge.
This script is really just those pieces, finally put together into one
thing that does something real."
