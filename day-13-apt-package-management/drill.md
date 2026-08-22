# Day 13 Practice Drill

## Task
Refresh the package index, search for and install a small utility, inspect
its package details, then purge it completely along with its configuration
files.

## Commands run (in order)
1. sudo apt update                    → refreshed index, 24 packages upgradable
2. sudo apt upgrade                   → most packages upgraded; a real error
                                          occurred during a VirtualBox Guest
                                          Additions kernel module rebuild
                                          triggered by a new kernel install
                                          (gcc-12 not found) — core upgrade
                                          still succeeded
3. apt list --upgradable              → confirmed only 1 package (snapd) remained
4. sudo apt full-upgrade              → removed 5 obsolete old-kernel packages
                                          (6.8.0-134), freeing 665 MB
5. apt search "text editor"           → explored search before choosing a
                                          drill package
6. sudo apt install cowsay            → installed successfully; flagged 6
                                          orphaned packages via apt autoremove hint
7. cowsay "Day 13..."                 → confirmed the package genuinely works
8. apt show cowsay                    → full package metadata inspected
9. apt search cowsay                  → confirmed installed, plus related packages
10. dpkg -l | grep cowsay             → confirmed ii (installed) status
11. dpkg -L cowsay                    → listed every real file the package placed
12. sudo apt purge cowsay             → fully removed, 93.2 kB freed
13. dpkg -l | grep cowsay / which cowsay → confirmed complete removal, no trace
14. apt autoremove (no sudo)          → failed: Permission denied
15. sudo !! → sudo apt autoremove     → removed 6 genuinely orphaned packages,
                                          freeing 106 MB

## Result
Full drill completed end-to-end: index refreshed, a small utility (cowsay)
searched, installed, tested, inspected via two different tools (apt show
and dpkg -L), then purged completely with verified zero leftovers.

## Problem encountered and fix
- A real error during apt upgrade: VirtualBox Guest Additions failed to
  rebuild its kernel module for the new kernel because gcc-12 wasn't
  installed. Investigated and confirmed this was an isolated side-effect,
  not a failure of the core package upgrade itself.
- Ran apt autoremove without sudo, correctly failed with a permission
  error — fixed immediately with sudo !!.
