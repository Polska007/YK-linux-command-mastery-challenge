# Commands - Day 4

## find -name
Searches a directory tree for files/folders matching a filename pattern.

## find -type
Filters find results by item type — f for files, d for directories, l for symlinks.

## find -size
Filters find results by file size, using +/- to mean greater/less than a threshold.

## find -mtime
Filters find results by modification time, measured in whole days ago.

## find -perm
Filters find results by exact permission mode — useful for security audits.

## locate
Searches for files by name almost instantly, using a pre-built index rather than scanning the live filesystem.

## updatedb
Manually rebuilds locate's search index/database, so recently created files show up immediately.

## du
Reports disk usage recursively, listing every subdirectory and file it walks through.

## du -sh
Same as du, but summarized to a single total (-s) in human-readable form (-h) — the practical everyday version.

## df -h
Reports overall disk usage per mounted filesystem/partition, in human-readable form — the big-picture view, unlike du's file/folder-level detail.
