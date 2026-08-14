# Commands - Day 5 (Checkpoint)

## tree
Displays a directory's structure as a visual, indented tree instead of a flat list.

## tree -L
Limits tree's output to a specific depth level, preventing an overwhelming full recursive dump.

## ln (hard link)
Creates a second directory entry pointing to the exact same underlying data on disk — same inode, no original/copy distinction.

## ln -s (symbolic link)
Creates a pointer file referencing another file's path. Breaks (dangles) if the target is moved or deleted.

## readlink
Shows the immediate target path stored inside a symbolic link.

## realpath
Resolves a path to its fully canonical, absolute form, following through any symlink chains.

## basename
Strips a path down to just the final filename/folder component, removing the leading directory path.

## dirname
The opposite of basename — returns just the directory path, stripping the final component.

## pushd / popd
Navigate using a directory stack — pushd moves and remembers where you came from, popd returns you to it.

## ls -lt
Long-format directory listing sorted by modification time, newest first.
