# Day 12: Groups & Access Circles

# Phase 3 - Users, Groups & Package Management | Day 12 of 30

# Commands covered today
See commands.md for all 10 commands with syntax and my own explanation
of what each one does and when I would reach for it.

# What I practiced
Created a group, added and removed real users with gpasswd, and confirmed
membership four independent ways: getent group, groups, id -Gn, and reading
/etc/group directly. Used newgrp to temporarily switch my active primary
group and proved a file created during that session permanently kept the
temporary group's ownership even after the session ended. Finished by
deleting the group entirely once it had no primary-group dependents.

# What surprised me
newgrp's effect on a new file is permanent even though the group switch
itself is only temporary — the file I created while "inside" a newgrp devs
session kept devs as its owning group forever, even after my shell
reverted back to my normal groups. It made the distinction between a
session-level setting and a file-level fact really concrete.

# Evidence
Screenshot or terminal transcript of the drill in evidence/.

# Related
Previous day: ../day-11-user-management/
Next day: ../day-13-apt-package-management/
