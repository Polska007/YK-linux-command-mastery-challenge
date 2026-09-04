Day 23 Commands: Init Systems & systemctl Basics
1. systemctl start
Syntax
```bash
sudo systemctl start <service-name>
```
What it does
I use this to start a service immediately in the current session.
Example
```bash
sudo systemctl start cups
```
What I learned
A successful start may return no terminal output, so I should verify the result with `systemctl status` or `systemctl is-active`.
2. systemctl stop
Syntax
```bash
sudo systemctl stop <service-name>
```
What it does
I use this to stop a running service immediately.
Example
```bash
sudo systemctl stop cups
```
What I learned
After stopping CUPS, its status changed to `inactive (dead)`, and systemd reported that it was deactivated successfully.
3. systemctl restart
Syntax
```bash
sudo systemctl restart <service-name>
```
What it does
I use this to stop and then start a service again in one operation.
Example
```bash
sudo systemctl restart cups
```
What I learned
After restarting CUPS, `systemctl is-active cups` returned `active`.
4. systemctl reload
Syntax
```bash
sudo systemctl reload <service-name>
```
What it does
I use this to ask a running service to reread its configuration without a full restart, provided the service supports reloading.
Example
```bash
sudo systemctl reload cups
```
What I learned
CUPS on my system does not support reload. Systemd returned: `Job type reload is not applicable for unit cups.service`.
5. systemctl enable
Syntax
```bash
sudo systemctl enable <service-name>
```
What it does
I use this to configure a service to start automatically when the system boots.
Example
```bash
sudo systemctl enable cups
```
What I learned
Enabling CUPS synchronized its startup state with the SysV service script.
6. systemctl disable
Syntax
```bash
sudo systemctl disable <service-name>
```
What it does
I use this to prevent a service from starting automatically at boot.
Example
```bash
sudo systemctl disable cups
```
What I learned
Disabling CUPS removed its startup symlinks. This changes its boot-time state but does not necessarily stop a running instance.
7. systemctl enable --now
Syntax
```bash
sudo systemctl enable --now <service-name>
```
What it does
I use this to enable a service for future boots and start it immediately with one command.
Example
```bash
sudo systemctl enable --now cups
```
What I learned
The command created the CUPS startup symlinks, while later checks confirmed that the service was both active and enabled.
8. systemctl status
Syntax
```bash
systemctl status <service-name>
```
What it does
I use this to inspect detailed information about a service, including its loaded state, running state, process details, and recent log messages.
Example
```bash
sudo systemctl status cups
```
What I learned
The CUPS status output showed whether the service was `active (running)` or `inactive (dead)` and displayed its recent start and stop events.
9. systemctl is-active
Syntax
```bash
systemctl is-active <service-name>
```
What it does
I use this when I need a short check of whether a service is currently running.
Example
```bash
systemctl is-active cups
```
What I learned
The command returned `inactive` after I stopped CUPS and `active` after I restarted it.
10. systemctl is-enabled
Syntax
```bash
systemctl is-enabled <service-name>
```
What it does
I use this to check whether a service is configured to start automatically at boot.
Example
```bash
systemctl is-enabled cups
```
What I learned
After `systemctl enable --now cups`, the command returned `enabled`.
