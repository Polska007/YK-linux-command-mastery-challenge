# Day 10 Practice Drill (Checkpoint)

## Task
Produce a one-page mini security audit of a server: who has logged in
recently, who is logged in right now, which accounts have never logged in,
and every sudo command run in this session.

## Mini Security Audit — Findings

### SUID Audit
sudo find / -perm /4000 -type f 2>/dev/null — confirmed only legitimate
system binaries present (passwd, sudo, su, mount, etc.). The unexpected
finding from Day 7 (myscript.sh) is gone — that fix held permanently.

### Recent Login History (last)
Extensive session history from Jul 20, 2026 (VM creation) through today.
Every session ended in "crash" rather than a clean logout — expected
behavior for a personal VM that gets closed/powered off rather than
gracefully shut down each time.

### Currently Logged In (w / who)
One active session confirmed: user "new" on tty2, running a GNOME desktop
session, up 3h42m at time of check. A second terminal session (pts/1) was
observed live via w mid-command (running sudo apt update), then closed
before the who check — demonstrating w's real-time snapshot nature versus
a static check.

### Never Logged In (lastlog)
Every system service account correctly shows "Never logged in", as
expected. Notable finding: the real user account "new" ALSO showed "Never
logged in" in lastlog, despite last showing dozens of real sessions for
that user. Investigated and explained: lastlog reads from a separate
database (/var/log/lastlog) that isn't always updated by direct
console/TTY logins the way PAM-authenticated logins (like SSH) are — a
real, legitimate blind spot worth flagging in any audit relying on
lastlog alone.

### Password Status (passwd -S / chage -l)
Account "new": password active (P), last changed today (Aug 19, 2026),
never expires, no account expiry set. No forced password rotation policy
in place — acceptable for a personal learning VM, but would be flagged as
a weaker practice in a production security audit.

### Failed Login Attempts (lastb)
Three failed root login attempts found, all from pts/0, within an 8-minute
window on Aug 17. Investigated and confirmed: self-initiated testing
(attempting su root before the concept was formally covered on Day 8),
not a genuine security incident.

### Sudo Command History (history | grep sudo)
Full sudo history retrieved, spanning from initial VM/Docker setup through
today's entire audit sequence — confirms a complete, traceable record of
every privileged command run in this session.

## Problem encountered and fix
- Initially ran sudo passwd new instead of the intended read-only
  sudo passwd -S new, actually changing the account's live password
  (re-entered the same current password both times, so no real change
  occurred, but a genuine reminder to slow down before any command
  prompting for new input twice).
- Two failed attempts at history | grep sudo due to reversed pipe syntax
  (history grep | sudo) — corrected on the third try.
