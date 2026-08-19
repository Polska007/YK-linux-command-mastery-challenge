# Day 09: Integrity, Encryption & Firewalling

# Phase 2 - Permissions, Ownership & Security | Day 9 of 30

# Commands covered today
See commands.md for all 10 commands with syntax and my own explanation
of what each one does and when I would reach for it.

# What I practiced
Generated MD5 and SHA-256 checksums on real files, including an actual
downloaded .deb package. Created a real GPG keypair and ran a full
encrypt-then-decrypt round trip on a test message, confirming the original
content came back exactly. Made a file immutable with chattr and proved it
by attempting (and failing) to delete it, then confirmed the flag visually
with lsattr. Finished by enabling ufw and allowing only ports 22 and 443,
verified with ufw status.

# What surprised me
Trying to delete my own file after setting it immutable failed with
"Operation not permitted" — even with full ownership and root access
available via sudo, chattr's immutable flag genuinely overrides everything
until it's explicitly removed. It's a completely different, stronger kind
of lock than anything chmod can do. I also didn't expect SHA-256 to be
exactly double the length of MD5's output on the same file — a clear,
visual way to see the difference in algorithm strength.

# Evidence
Screenshot or terminal transcript of the drill in evidence/.

# Related
Previous day: ../day-08-privilege-escalation/
Next day: ../day-10-security-audit-checkpoint/
