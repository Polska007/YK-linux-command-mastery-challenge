# Day 14 Practice Drill

## Task
On an Amazon Linux or RHEL box, install a package with dnf, confirm it with
rpm -qa, then compare the workflow against the equivalent apt steps from
Day 13.

## Environment
Real Amazon Linux 2023 EC2 instance (not conceptual — confirmed via the
system's own MOTD banner and package manager behavior).

## Commands run (in order)
1. sudo apt update                    → confirmed apt genuinely does not
                                          exist on this system
2. sudo dnf update                    → refreshed metadata, system already
                                          current: "Nothing to do. Complete!"
3. sudo dnf install cowsay            → installed successfully, structured
                                          transaction-table output
4. cowsay --v / cowsay -v             → both failed, cowsay doesn't support
                                          a version flag on this build
5. cowsay "Day 14..."                 → confirmed working, identical visual
                                          output to Day 13's Ubuntu version
6. dnf search editor                  → results grouped into three relevance
                                          sections, more structured than apt search
7. rpm -qa | grep cowsay              → confirmed cowsay-3.04-17.amzn2023.0.2.noarch
                                          installed — drill's core requirement
8. yum --version                      → output explicitly showed dnf as the
                                          underlying installed package, proving
                                          yum is a direct alias for dnf here
9. add-apt-repository --help          → command not found, confirming this
                                          tool doesn't exist on RHEL-family systems
10. sudo dnf remove cowsay            → removed cleanly, structured "Erasing" output
11. rpm -qa | grep cowsay             → confirmed empty result, complete removal verified

## Comparison to Day 13 (apt on Ubuntu)

| Task | dnf (Amazon Linux) | apt (Ubuntu, Day 13) |
|------|---------------------|------------------------|
| Refresh + upgrade | dnf update (combined, one step) | apt update && apt upgrade (separate) |
| Install a package | dnf install cowsay | apt install cowsay |
| Search packages | dnf search editor (grouped by relevance) | apt search (flat list) |
| Verify installed | rpm -qa \| grep cowsay | dpkg -l \| grep cowsay |
| Remove a package | dnf remove (full removal) | apt remove (keeps config) / apt purge (full) |
| Output style | Structured transaction tables throughout | Line-by-line progress messages |
| Legacy tool alias | yum → confirmed to literally BE dnf underneath | (no equivalent legacy alias) |
| Add repository | dnf config-manager --add-repo (conceptual) | add-apt-repository (confirmed absent on RHEL) |

## Result
Completed a full, real install → verify → remove lifecycle on genuine
Amazon Linux 2023, directly paralleling Day 13's Ubuntu/apt sequence.
Confirmed several real distro-family boundaries live: apt absent on
Amazon Linux, add-apt-repository absent on Amazon Linux, and yum
genuinely aliasing to dnf under the hood rather than being a separate tool.

## Problem encountered and fix
- Initially ran sudo apt update out of habit on a fresh Amazon Linux
  session — correctly failed with "command not found," a good real
  demonstration of the distro-family boundary before switching to dnf.
- cowsay --v and cowsay -v both failed — this particular build of cowsay
  doesn't support a version flag at all, a tool-specific quirk rather than
  a syntax error.
</parameter>
