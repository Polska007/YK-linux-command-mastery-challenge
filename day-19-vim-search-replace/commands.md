# Commands - Day 19

## gg / G
gg jumps to the first line of the file; G (capital) jumps to the last line.

## :10 (go to line)
Jumps directly to a specific line number.

## / (search forward)
Starts a forward search from the cursor's current position downward.

## ? (search backward)
Starts a backward search from the cursor's current position upward.

## n / N
Repeats the last search — n in the same direction it was started, N in the opposite direction — used to jump between multiple matches.

## :%s/old/new/g
Find-and-replace across the entire file (%), replacing every occurrence per line (g), not just the first match on each line.

## dw
Deletes from the cursor to the start of the next word.

## x
Deletes the single character under the cursor.

## o / O
o opens a new line below the current one and enters insert mode; O does the same above the current line.

## ZZ
Saves and quits in one action, equivalent to :wq but without needing the colon or Enter.
