# Day 14: DNF/YUM & Alternative Installs

# Phase 3 - Users, Groups & Package Management | Day 14 of 30

# Commands covered today
See commands.md for all 10 commands with syntax and my own explanation
of what each one does and when I would reach for it.

# What I practiced
Spun up a real Amazon Linux 2023 EC2 instance specifically to run this
day's drill on genuine RHEL-family territory, rather than working
conceptually on my Ubuntu VM. Installed, verified, and removed a real
package (cowsay) using dnf and rpm -qa, confirmed yum is literally an
alias for dnf on this system, and confirmed add-apt-repository and apt
itself genuinely don't exist here — directly comparing every step against
Day 13's identical workflow on Ubuntu.

# What surprised me
Running yum --version and seeing it explicitly report "Installed:
dnf-0:4.14.0..." was a genuinely concrete way to see that yum isn't just
similar to dnf on a modern system — it IS dnf, just invoked under a
legacy name for backward compatibility. I also didn't expect dnf's output
to be this much more structured than apt's — full transaction tables with
explicit check/test/run phases, versus apt's simpler line-by-line style.

# Evidence
Screenshot or terminal transcript of the drill in evidence/.

# Related
Previous day: ../day-13-apt-package-management/
Next day: ../day-15-provisioning-checkpoint/
