# Commands - Day 3

## cat
Prints a file's entire contents to the terminal at once, no pausing or scrolling control.

## less
Opens a file in an interactive pager — view one screen at a time, search, scroll, and quit with q.

## head
Shows the first 10 lines of a file by default — a quick peek at the top.

## head -n
Same as head, but lets you specify exactly how many lines to show.

## tail
Shows the last 10 lines of a file by default — useful since new log entries are usually appended at the bottom.

## tail -f
Follows a file live, streaming new lines to the screen as they're written. Exit with Ctrl+C.

## wc
Counts lines, words, and bytes in a file, in that order.

## wc -l
Same as wc, but shows only the line count — commonly used with piped input from other commands.

## file
Identifies a file's actual type/format by inspecting its content, not its name or extension.

## stat
Shows a file's full metadata: exact size, permissions (symbolic and octal), owner, group, inode, and three separate timestamps (access, modify, change).
