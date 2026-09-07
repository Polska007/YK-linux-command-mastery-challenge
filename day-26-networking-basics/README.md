# Day 26: Networking Basics

# Phase 6 - Networking, Scripting & SSH Mastery | Day 26 of 30

# Commands covered today
See commands.md for all 10 commands with syntax and my own explanation
of what each one does and when I would reach for it.

# What I practiced
Identified my machine's real IP address and default gateway, tested
genuine internet connectivity with ping, fetched HTTP headers only with
curl -I, downloaded a real file with wget, and listed every listening
port with ss -tulnp after discovering netstat isn't even installed on
this system anymore. Finished with hostname and hostnamectl to confirm
full system identity.

# What surprised me
Seeing sshd actually listening on port 22 in ss -tulnp connected three
separate days of this challenge into one real, working story: the
firewall rule I opened on Day 9, long before SSH was even installed; the
actual SSH installation on Day 25 while building an operational
snapshot; and today's networking check confirming it's genuinely
listening and reachable. Also didn't expect netstat, a command I assumed
was standard, to be completely absent by default — a real, live
confirmation that ss has fully taken its place on modern systems.

# Evidence
Screenshot or terminal transcript of the drill in evidence/.

# Related
Previous day: ../day-25-operational-snapshot-checkpoint/
Next day: ../day-27-ssh-file-transfer/
