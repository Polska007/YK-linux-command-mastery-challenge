# Day 24 Practice Drill

## Exact Practice Drill

> List every failed service on the box, then pull today's logs for one specific service, filtered to errors only, and follow it live for one minute.

## Failed Service Audit

Command:

```bash
systemctl list-units --state=failed
```

Result:

```text
● vboxadd.service loaded failed failed vboxadd.service
```

## Service Selected

```text
cups.service
```

## Service Log Review

Command:

```bash
sudo journalctl -u cups --since today
```

Relevant Output:

```text
Starting CUPS Scheduler...
Started CUPS Scheduler.
Stopping CUPS Scheduler...
cups.service: Deactivated successfully.
Stopped CUPS Scheduler.
```

## Error Log Review

Command:

```bash
sudo journalctl -p err --since today
```

Relevant Findings:

```text
Failed to start vboxadd.service
vmwgfx seems to be running on an unsupported hypervisor
watchdog timeout events
```

## Live Journal Monitoring

Command:

```bash
journalctl -f
```

Observed:

```text
Started GNOME Terminal Server
Started Application launched by gnome-session-binary
session opened for user root
```

## Live System Log Monitoring

Command:

```bash
sudo tail -f /var/log/syslog
```

Observed:

```text
systemd reload events
Cleanup of Temporary Directories
AppArmor audit messages
Firefox Snap events
```

## Live Authentication Monitoring

Command:

```bash
sudo tail -f /var/log/auth.log
```

Observed:

```text
sudo session opened for user root
sudo session closed for user root
journalctl commands executed via sudo
tail commands executed via sudo
```

## Issue Encountered

As a standard user:

```bash
journalctl -u cups --since today
```

returned:

```text
-- No entries --
```

After rerunning with sudo:

```bash
sudo journalctl -u cups --since today
```

the service logs became visible.

## Outcome

Successfully identified failed services, reviewed service-specific logs, filtered errors, and monitored logs in real time using both journalctl and traditional log files.
