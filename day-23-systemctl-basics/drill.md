Day 23 Practice Drill
Exact Practice Drill
> Pick a service, stop it, confirm it is inactive, restart it, enable it to auto-start at boot in a single combined command, and confirm both its active and enabled state.
Service used
```text
cups.service - CUPS Scheduler
```
Commands I ran
1. Inspect the initial service state
```bash
sudo systemctl status cups
```
Relevant result:
```text
Loaded: loaded (/lib/systemd/system/cups.service; enabled; vendor preset: enabled)
Active: active (running)
Status: "Scheduler is running..."
```
2. Stop the service
```bash
sudo systemctl stop cups
```
3. Confirm the stopped state
```bash
sudo systemctl status cups
```
Relevant result:
```text
Active: inactive (dead)
cups.service: Deactivated successfully.
Stopped CUPS Scheduler.
```
I also checked the short runtime state:
```bash
systemctl is-active cups
```
Result:
```text
inactive
```
4. Restart the service
```bash
sudo systemctl restart cups
```
5. Confirm the restarted state
```bash
systemctl is-active cups
```
Result:
```text
active
```
6. Test configuration reload
```bash
sudo systemctl reload cups
```
Result:
```text
Failed to reload cups.service: Job type reload is not applicable for unit cups.service.
```
I confirmed that starting CUPS did not change its reload capability:
```bash
sudo systemctl start cups
sudo systemctl reload cups
```
Result:
```text
Failed to reload cups.service: Job type reload is not applicable for unit cups.service.
```
7. Practise enable and disable
```bash
sudo systemctl enable cups
sudo systemctl disable cups
```
Relevant disable result:
```text
Removed /etc/systemd/system/sockets.target.wants/cups.socket.
Removed /etc/systemd/system/printer.target.wants/cups.service.
Removed /etc/systemd/system/multi-user.target.wants/cups.path.
Removed /etc/systemd/system/multi-user.target.wants/cups.service.
```
8. Enable automatic startup and start the service in one command
```bash
sudo systemctl enable --now cups
```
Relevant result:
```text
Created symlink /etc/systemd/system/printer.target.wants/cups.service → /lib/systemd/system/cups.service.
Created symlink /etc/systemd/system/multi-user.target.wants/cups.service → /lib/systemd/system/cups.service.
Created symlink /etc/systemd/system/sockets.target.wants/cups.socket → /lib/systemd/system/cups.socket.
Created symlink /etc/systemd/system/multi-user.target.wants/cups.path → /lib/systemd/system/cups.path.
```
9. Confirm the active state
```bash
systemctl is-active cups
```
Result:
```text
active
```
10. Confirm the enabled state
```bash
systemctl is-enabled cups
```
Result:
```text
enabled
```
Problem encountered and correction
`cups.service` rejected `systemctl reload` because that operation is not supported by the unit. I did not treat the error as a stopped-service problem after testing it again while CUPS was running. I continued with the supported Day 23 operations and verified the service's final active and enabled states.
