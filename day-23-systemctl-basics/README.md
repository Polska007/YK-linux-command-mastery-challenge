Day 23: Init Systems & systemctl Basics
Phase 5 - Process & Service Management | Day 23 of 30
Commands covered today
See `commands.md` for all 10 commands with syntax and my own explanation of what each one does and when I would reach for it.
What I practiced
I used the CUPS printing service to practise controlling a systemd service. I stopped the service, confirmed that it was inactive, restarted it, enabled it to start automatically at boot, and verified both its running and boot-time states.
What surprised me
I discovered that `cups.service` does not support `systemctl reload`; systemd returned `Job type reload is not applicable for unit cups.service`, so a service must explicitly support reloading for that command to work.
Evidence
Screenshot or terminal transcript of the drill is stored in `evidence/`.
Related
Previous day: Day 22 - Process Signals
Next day: Day 24 - Service Logs
LinkedIn
LinkedIn article/post: Pending publication
