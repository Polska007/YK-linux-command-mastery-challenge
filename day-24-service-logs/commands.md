# Day 24 Commands: Deeper Service Management & Logs

## 1. systemctl list-units --type=service

### Syntax

```bash
systemctl list-units --type=service
```

### What it does

Shows all currently loaded services and their state.

### Example

```bash
systemctl list-units --type=service
```

### What I learned

This provides a quick overview of active services running on the system.

---

## 2. systemctl list-units --state=failed

### Syntax

```bash
systemctl list-units --state=failed
```

### What it does

Shows services or units currently in a failed state.

### Example

```bash
systemctl list-units --state=failed
```

### What I learned

I discovered that vboxadd.service was the only failed unit on my system.

---

## 3. systemctl daemon-reload

### Syntax

```bash
sudo systemctl daemon-reload
```

### What it does

Reloads systemd unit files after configuration changes.

### Example

```bash
sudo systemctl daemon-reload
```

### What I learned

The command completed silently and did not change the status of the failed service.

---

## 4. journalctl

### Syntax

```bash
journalctl
```

### What it does

Displays historical logs stored in the systemd journal.

### Example

```bash
journalctl
```

### What I learned

The journal contains extensive operating system and application activity records.

---

## 5. journalctl -f

### Syntax

```bash
journalctl -f
```

### What it does

Follows journal entries in real time.

### Example

```bash
journalctl -f
```

### What I learned

I was able to observe new log entries as applications were launched.

---

## 6. journalctl -u

### Syntax

```bash
journalctl -u <service>
```

### What it does

Displays logs for a specific service.

### Example

```bash
sudo journalctl -u cups
```

### What I learned

I could view all start and stop activities related to the CUPS service.

---

## 7. journalctl --since

### Syntax

```bash
journalctl --since today
```

### What it does

Filters logs from a specific time period.

### Example

```bash
sudo journalctl --since today
```

### What I learned

This makes it easier to isolate activity that occurred on a specific day.

---

## 8. journalctl -p err

### Syntax

```bash
sudo journalctl -p err --since today
```

### What it does

Displays only error-level log messages.

### Example

```bash
sudo journalctl -p err --since today
```

### What I learned

I identified several system errors including VirtualBox-related failures and watchdog timeout events.

---

## 9. tail -f /var/log/syslog

### Syntax

```bash
sudo tail -f /var/log/syslog
```

### What it does

Monitors the system log in real time.

### Example

```bash
sudo tail -f /var/log/syslog
```

### What I learned

I observed systemd reload events, AppArmor events, and application activity as they occurred.

---

## 10. tail -f /var/log/auth.log

### Syntax

```bash
sudo tail -f /var/log/auth.log
```

### What it does

Monitors authentication and authorization logs in real time.

### Example

```bash
sudo tail -f /var/log/auth.log
```

### What I learned

I was able to see my own sudo activities and root session events being logged.
