# Day 26 Practice Drill

## Task
Identify your machine's IP address and default gateway, test connectivity
to a public host, fetch a URL's headers only, and list every port
currently listening.

## Commands run (in order)
1. ip a → confirmed IP address 10.0.2.15 on enp0s3, plus lo and docker0
   interfaces
2. ip route → confirmed default gateway 10.0.2.2 via enp0s3
3. ping -c 4 8.8.8.8 → 4/4 packets received, 0% packet loss, ~22-39ms
   round-trip times
4. curl -I https://www.google.com → fetched headers only, HTTP/2 200,
   server: gws, no page body downloaded
5. wget https://raw.githubusercontent.com/torvalds/linux/master/README
   → genuinely downloaded a real 6034-byte file to disk
6. sudo netstat -tulnp → command not found; confirmed netstat is genuinely
   absent on this modern Ubuntu install
7. sudo ss -tulnp → confirmed sshd listening on port 22 (IPv4 and IPv6),
   cupsd on port 631 (localhost only), systemd-resolve on port 53
8. hostname → NEW
9. hotsnamectl → typo, corrected
10. hostnamectl → confirmed Ubuntu 22.04.5 LTS, kernel 6.8.0-138,
    Virtualization: oracle, Hardware Vendor: innotek GmbH (VirtualBox),
    definitively confirming the VM environment used throughout this
    entire challenge

## Result
- IP address identified: 10.0.2.15 ✅
- Default gateway identified: 10.0.2.2 ✅
- Connectivity tested to a public host: 8.8.8.8, 0% packet loss ✅
- URL headers fetched: curl -I on google.com ✅
- Every listening port identified: ss -tulnp showed sshd (22), cupsd
  (631, localhost only), systemd-resolve (53), avahi-daemon (mDNS) ✅

## Problem encountered and fix
- netstat is not installed by default on this system at all — genuine
  confirmation that it's been superseded by ss on modern Ubuntu.
- Typo'd "hotsnamectl" instead of "hostnamectl" — corrected on the next attempt.

## Connecting the dots
This day tied together several earlier days into one coherent story:
the firewall rule opened on Day 9 (port 22), the SSH service installed
live on Day 25, and today's confirmation that sshd is genuinely listening
and reachable on that exact port — three separate days' work now visibly
functioning together as a real, working system.
