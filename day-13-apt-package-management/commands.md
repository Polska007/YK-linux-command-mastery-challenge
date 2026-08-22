# Commands - Day 13

## apt update
Refreshes the local package index — the cached list of what's available from configured repositories. Does not install or change anything itself.

## apt upgrade
Installs newer versions of upgradable packages, conservatively — won't remove packages or pull in complex new dependencies to do so.

## apt full-upgrade
A more aggressive upgrade that will remove packages if necessary to resolve dependencies, unlike plain upgrade.

## apt install
Installs a new package and its dependencies.

## apt remove
Uninstalls a package's program files but leaves its configuration files behind.

## apt purge
Uninstalls a package completely, including its configuration files — full removal with no trace left behind.

## apt autoremove
Removes packages that were installed automatically as dependencies but are no longer needed by anything currently installed.

## apt search
Searches package names and descriptions for a given term.

## apt show
Displays detailed metadata about a package — version, size, dependencies, maintainer, description — without installing or removing it.

## dpkg -l / dpkg -L
dpkg -l lists installed packages matching a pattern; dpkg -L lists every actual file a specific installed package placed on the filesystem.
