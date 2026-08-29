# Commands - Day 20 (Checkpoint)

## grep
Searches text for lines matching a pattern.

## grep -r
Searches recursively through an entire directory tree, checking every file inside.

## grep -i
Case-insensitive search — matches regardless of uppercase/lowercase.

## sort
Sorts lines of text, alphabetically by default, without modifying the original file.

## sort -n
Sorts numerically instead of alphabetically — necessary for correct ordering of actual numeric data.

## uniq
Removes consecutive duplicate lines only — does not catch duplicates that aren't directly adjacent, which is why it's commonly paired with sort first.

## cut -d',' -f
Extracts specific fields/columns from each line based on a chosen delimiter character.

## awk '{print $1}'
Prints a specific field, automatically split by whitespace by default — often simpler syntax than cut for whitespace-delimited data.

## sed 's/old/new/g'
Performs find-and-replace on piped/streamed text — the shell equivalent of Vim's :%s/old/new/g.

## pipe chains (|)
Feeds one command's output directly into the next command's input, allowing multiple simple tools to be combined into one powerful sequence.
