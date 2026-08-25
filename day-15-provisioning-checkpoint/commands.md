# Commands - Day 15 (Checkpoint)

## id <user>
Checks a user's identity and group memberships — used here to verify an account does NOT already exist before creating one.

## getent passwd <user>
A second, independent way to confirm a user account's existence (or absence) by querying the user database directly.

## useradd -m -G
Creates a user with a home directory (-m) and immediate secondary group assignment (-G) in a single command — a faster, single-line alternative to Day 11's multi-step useradd + usermod -aG approach.

## passwd <user>
Sets a user's password, subject to the system's password quality policy.

## apt list --installed
Lists every installed package — used as a baseline check to see which required tools are already present before installing anything new.

## apt list --upgradable
Lists packages with available updates — a quick system-health check before provisioning new software.

## apt update && apt install -y
Chains an index refresh directly into an automated install, using -y to skip the confirmation prompt — the pattern a real onboarding script would use.

## dpkg -l | grep
Verifies specific packages are genuinely installed by filtering dpkg's own installed-package list.

## apt autoremove
Cleans up any orphaned dependency packages left over from the provisioning process.

## history
Shows the full command history for the session — used here to produce a single, complete documented record of the entire provisioning sequence.
