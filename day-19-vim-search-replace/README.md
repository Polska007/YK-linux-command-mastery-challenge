# Day 19: Vim Navigation & Search/Replace

# Phase 4 - Environment, Vim & Text Processing | Day 19 of 30

# Commands covered today
See commands.md for all 10 commands with syntax and my own explanation
of what each one does and when I would reach for it.

# What I practiced
Generated a real 50-line config file, then used Vim to jump directly to a
specific line, search forward and backward for a keyword, hop between
every match, and run a file-wide find-and-replace — confirmed with Vim's
own "50 substitutions on 50 lines" message. Also practiced basic editing
(x, dw, undo, o) and saved everything in one action with ZZ.

# What surprised me
Coming from nano, Vim felt noticeably less intuitive at first — everything
depends on which mode you're in, and normal-mode commands do nothing (or
type garbage) if you're accidentally still in insert mode. But the
file-wide substitute command in particular showed real power nano simply
doesn't have — replacing 50 matches across an entire file in a single
line of input, with an exact confirmation of how many changes were made.

# Evidence
Screenshot or terminal transcript of the drill in evidence/.

# Related
Previous day: ../day-18-vim-fundamentals/
Next day: ../day-20-text-processing-checkpoint/
