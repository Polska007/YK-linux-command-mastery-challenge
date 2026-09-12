#!/bin/bash
# Day 30 Capstone: System Health-Check Script

echo "===== SYSTEM HEALTH CHECK ====="
echo "Run at: $(date)"
echo ""

echo "--- Uptime & Load ---"
uptime

echo ""
echo "--- Memory ---"
free -h

echo ""
echo "--- Key Processes (ps) ---"
ps aux | grep -E "sshd|cron|cups" | grep -v grep

echo ""
echo "--- Service Status (systemctl) ---"
for svc in ssh cron cups; do
    status=$(systemctl is-active "$svc")
    echo "$svc: $status"
done

echo ""
echo "--- Recent Journal Entries (journalctl) ---"
sudo journalctl -p err --since today --no-pager | tail -10

echo ""
echo "--- Security Audit ---"
echo "Last logins:"
last -n 5
echo "Currently logged in:"
who
echo "Recent sudo commands:"
history | grep sudo | tail -5

echo ""
echo "===== END OF REPORT ====="
