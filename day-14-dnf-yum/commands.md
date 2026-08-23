# Commands - Day 14

## dnf update
Refreshes package metadata and applies available upgrades in one combined step (unlike apt's separate update/upgrade). Confirmed on Amazon Linux 2023: system was already current, reported "Nothing to do. Complete!"

## dnf install
Installs a new package and its dependencies. Confirmed live: installed cowsay on Amazon Linux 2023, structured transaction-table output distinct from apt's line-by-line style.

## dnf remove
Uninstalls a package. Confirmed live: removed cowsay cleanly, verified gone via rpm -qa afterward. Behaves closer to apt purge than apt remove.

## dnf search
Searches package names/descriptions for a term. Confirmed live: searched "editor", results grouped into Name & Summary Matched / Name Matched / Summary Matched sections — more structured than apt search's flat list.

## yum install
The older predecessor to dnf. Confirmed live via yum --version: output explicitly showed "Installed: dnf-0:4.14.0..." proving yum is a direct alias for dnf on this modern Amazon Linux system, not a separate tool.

## rpm -qa
Queries all installed packages. Confirmed live: rpm -qa | grep cowsay returned the exact installed package string both before and after removal (present, then empty) — the drill's core required verification step.

## snap install
Installs a universal Snap package, working identically across any distro. Not re-demonstrated on Amazon Linux since its behavior doesn't depend on the underlying distro's package manager.

## add-apt-repository
Confirmed live to NOT exist on Amazon Linux: "command not found" — genuine proof this is an Ubuntu/Debian-only tool, with no equivalent by that name on RHEL-family systems.

## dpkg -i
Installs a package directly from a local .deb file. Not applicable on Amazon Linux (RPM-based); the direct equivalent is rpm -ivh for local .rpm files.

## pip / npm install
Language-specific package managers, independent of the underlying system's package manager. Not re-demonstrated on Amazon Linux since behavior is identical regardless of distro.
