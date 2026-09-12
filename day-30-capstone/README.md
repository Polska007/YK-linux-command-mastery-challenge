# Day 30: Capstone — Full System Command Mastery Review

# Phase 6 - Networking, Scripting & SSH Mastery | Day 30 of 30 (Capstone)

# What this day covers
The final capstone: a real, working deployment script (deploy.hearbeat.sh)
that connects to a remote server over SSH, deploys an updated file with
correct ownership and permissions, restarts a service, and verifies its
health with systemctl and journalctl — logging the entire run. Alongside
it, a system health-check script (system_healthcheck.sh) combining
process, service, and log review with a full security audit. See
drill.md for the complete breakdown, real troubleshooting story, and a
full peer walkthrough of how the deployment script works.

# What I practiced
Nearly every command from the last 29 days, brought together into two
real, working scripts: SSH connections and config shortcuts, scp file
transfer, remote chmod/chown, systemctl service management, journalctl
log verification, exit code checking, log parsing with grep/awk/sed,
find for identifying stale files, and cron scheduling — with the
original EC2 target having been destroyed via Terraform partway through
this challenge, requiring a fresh instance to be provisioned before the
capstone could even begin.

# What surprised me
The most honest part of this final day was the log file itself —
deploy_log.txt captured two genuine failed deployment attempts before
the actual success, all timestamped and left in the record rather than
cleaned up. That felt like the right way to close out 30 days: not a
polished, perfect final run, but real evidence of exactly how
troubleshooting a real deployment actually goes.

# Evidence
Screenshot or terminal transcript of the drill in evidence/, plus the
actual scripts (deploy.hearbeat.sh, system_healthcheck.sh) and real log
files (deploy_log.txt) included directly in this folder.

# Related
Previous day: ../day-29-functions-automation/
This is the final day of the 30-Day Linux Command Mastery Challenge.
