# Day 20 Practice Drill (Checkpoint)

## Task
From a raw log file, build one pipeline that filters for 'error' entries,
extracts the timestamp column, sorts the results, and removes duplicates,
all in a single chained command.

## File used
app.log — a real, realistic 10-line application log with mixed INFO,
WARNING, and ERROR entries, created with a heredoc.

## Commands run (in order)
1. grep "ERROR" app.log → filtered 5 ERROR lines from 10 total
2. grep -r "ERROR" (empty result folders) → correctly returned nothing,
   since the term genuinely wasn't present
3. grep -r "Phase" ~/YK-linux-command-mastery-challenge/day-1*/ → real
   recursive search across 11 files/folders, confirming the command works
   properly on genuine multi-file, multi-folder data
4. grep "error" app.log (no -i) → correctly returned nothing (case-sensitive,
   file uses all-caps ERROR)
5. grep -i "error" app.log → correctly matched all 5 lines regardless of case
6. grep -i "error" app.log | sort → first real pipe chain; output unchanged
   visually since timestamps were already chronologically/alphabetically ordered
7. grep -i "error" app.log | uniq → demonstrated uniq's real limitation:
   removed nothing, since the two genuinely duplicate messages weren't
   consecutive in the file
8. cut -d' ' -f1,2 app.log → extracted date+time from all 10 lines
9. grep -i "error" app.log | cut -d' ' -f1,2 → correctly narrowed to just
   the 5 ERROR timestamps
10. grep -i "error" app.log | awk '{print $1}' → extracted just the date
    field, demonstrating awk's simpler whitespace-based field splitting
11. grep -i "error" app.log | sed 's/ERROR/CRITICAL/g' → real find-and-replace
    on piped data, all 5 ERROR labels replaced with CRITICAL
12. grep -i "error" app.log | cut -d' ' -f1,2 | sort | uniq → the drill's
    actual final required pipeline, all four operations chained together

## Result
Built the complete required pipeline successfully: filtered for error
entries (case-insensitive), extracted the timestamp column, sorted the
results, and removed duplicates — all in a single chained command using
grep, cut, sort, and uniq together.

## Problem encountered and fix
None significant for the final pipeline itself — the exercise deliberately
demonstrated uniq's real limitation (consecutive-only deduplication) before
combining it correctly with sort in the final required command, and
demonstrated 2>/dev/null's actual purpose (suppressing stderr specifically)
by comparing output with and without it.
