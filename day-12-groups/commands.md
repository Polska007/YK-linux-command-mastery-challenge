# Commands - Day 12

## groupadd
Creates a new group — starts empty, with no members.

## groupdel
Deletes a group. Fails if the group is still set as any user's primary group.

## gpasswd -a
Adds a user to a group.

## gpasswd -d
Removes a user from a group.

## getent group
Queries the group database (backed by /etc/group on a standard local system) for a specific group's entry.

## getent passwd
Queries the user account database (backed by /etc/passwd) for a specific user's entry.

## groups
Shows which groups a user belongs to.

## id -Gn
Shows a user's group memberships by name, via the id command instead of groups.

## newgrp
Temporarily switches the active primary group for the current shell session, affecting what new files inherit.

## cat /etc/group
Directly reads the raw group database file — the underlying source every other group-lookup tool ultimately reads from.
