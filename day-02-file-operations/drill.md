# Day 2 Practice Drill

## Task
Create a nested folder structure practice/2026/april in one command, create three
empty files inside it, copy the folder to a backup location, rename one file, then
safely delete only the empty directories left behind.

## Commands run (in order)
1. mkdir -p pratice/2026/april          (typo: "pratice" instead of "practice")
2. touch file1.txt file2.txt file3.txt   (created one level too high, in 2026/ not april/)
3. mv file1.txt file2.txt file3.txt april/
4. rm notes.txt                          (cleanup of an unrelated example file)
5. mkdir ~/pratice/2026/backup
6. cp -r april backup/
7. ls -r backup/                         (wrong flag — reverse sort, not recursive)
8. ls -R Backup/                         (typo: wrong case, folder not found)
9. ls -R backup/                         (correct — confirmed nested copy)
10. mv file1.txt file1-renamed.txt        (inside april/, correct rename step)
11. mv pratice practice                   (renamed top-level folder to fix the earlier typo)
12. rm file2.txt                          (accidental — not part of the drill's instructions)
13. rmdir april                           (failed: run from inside april/ itself, so it looked
                                            for a subfolder named "april" inside april/, which
                                            doesn't exist — got "No such file or directory")
14. find ~/practice -type d -empty        → no output (no empty directories existed)
15. mkdir ~/practice/2026/empty-test
16. rmdir ~/practice/2026/empty-test/     (succeeded — real rmdir behavior demonstrated)
17. ls ~/practice/2026                    → april, backup (empty-test correctly removed)

## Result
- practice/2026/april/ ends with 2 files: file1-renamed.txt, file3.txt
  (file2.txt was deleted with `rm`, outside the scope of the original drill)
- practice/2026/backup/april/ retains the original 3 files from before the rename/delete:
  file1.txt, file2.txt, file3.txt
- No empty directories existed under practice/ at check time, so rmdir was demonstrated
  separately on a throwaway folder (empty-test) to confirm its safe-delete behavior

## Problem encountered and fix
1. Typo'd the top-level folder as "pratice" — fixed later with `mv pratice practice`.
2. Created the three files one directory level too high — moved into april/ with mv.
3. Used `ls -r` instead of `ls -R` to check the recursive copy — corrected to -R.
4. Accidentally ran `rm file2.txt`, which wasn't part of the drill — left as an honest
   record rather than silently restoring the file.
5. Ran `rmdir april` from inside the april folder itself, so it searched for a
   non-existent subfolder and failed with the wrong error message ("No such file or
   directory" instead of "Directory not empty"). Real rmdir behavior was instead
   confirmed using a throwaway empty folder (empty-test).

