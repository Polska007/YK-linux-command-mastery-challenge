# Day 20: Text Processing & Pipes (Checkpoint)

# Phase 4 - Environment, Vim & Text Processing | Day 20 of 30 (Checkpoint)

# Commands covered today
See commands.md for all 10 commands with syntax and my own explanation
of what each one does and when I would reach for it.

# What I practiced
Built a realistic application log file and worked through grep (plain,
recursive, and case-insensitive), sort, uniq, cut, awk, and sed
individually before combining four of them into the drill's actual
required pipeline: filtering for errors, extracting timestamps, sorting,
and deduplicating, all in one chained command.

# What surprised me
uniq only removes duplicates that are directly next to each other — I
proved this by running it on my error lines and watching it remove
nothing at all, even though two messages were genuinely repeated,
because they weren't adjacent. That's exactly why sort always comes
before uniq in real pipelines: sorting groups identical lines together
first, which is what actually makes uniq useful.

# Evidence
Screenshot or terminal transcript of the drill in evidence/.

# Related
Previous day: ../day-19-vim-search-replace/
Next day: ../day-21-viewing-processes/
