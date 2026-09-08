# Day 27: Remote Access & File Transfer

# Phase 6 - Networking, Scripting & SSH Mastery | Day 27 of 30

# Commands covered today
See commands.md for all 10 commands with syntax and my own explanation
of what each one does and when I would reach for it.

# What I practiced
Generated a new SSH keypair and installed it on a real AWS EC2 instance —
including working through a genuine obstacle where ssh-copy-id reported
success without actually installing the key, requiring manual
verification and a workaround. Proved passwordless login worked, then
transferred a real file to and from the server three different ways
(scp, sftp, rsync), set up a ~/.ssh/config shortcut, and reviewed the
server's actual SSH hardening configuration.

# What surprised me
ssh-copy-id reported "all keys were skipped because they already exist
on the remote system" when the key genuinely wasn't there yet. Trusting
that message would have left the drill incomplete without me realizing
it — checking the remote authorized_keys file directly was the only way
to catch it. A real reminder that a tool's summary message isn't always
the ground truth; verifying the actual state directly matters more.

# Evidence
Screenshot or terminal transcript of the drill in evidence/.

# Related
Previous day: ../day-26-networking-basics/
Next day: ../day-28-bash-scripting/
