# Commands - Day 26

## ip a
Shows every network interface on the machine and its assigned IP address(es) — the modern replacement for ifconfig.

## ip route
Shows the system's routing table, including the default gateway used for traffic with no more specific route.

## ping -c
Sends a limited, counted number of ICMP echo requests to test basic connectivity to a host.

## curl
Fetches a URL's content — flexible tool for displaying content or working with APIs.

## curl -I
Fetches only the HTTP headers of a response, without downloading the full body.

## wget
Downloads files from a URL and saves them directly to disk.

## netstat -tulnp
Lists all listening TCP/UDP ports along with the process using each — largely deprecated on modern systems in favor of ss.

## ss -tulnp
The modern replacement for netstat — same purpose, generally faster and more actively maintained.

## hostname
Shows the machine's network hostname.

## hostnamectl
Shows detailed system info: hostname, OS, kernel version, architecture, and virtualization platform.
