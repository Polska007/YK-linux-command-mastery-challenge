# Day 16 Practice Drill

## Task
Set a temporary environment variable, confirm it exists, unset it, then add
a directory to your PATH for the current session only and prove the shell
can now find a script inside it.

## Commands run (in order)
1. export MYCHALLENGE="Day 16 test variable"
2. echo $  → typo (missing variable name), printed a literal $
3. echo $MYCHALLENGE  → corrected, confirmed "Day 16 test variable"
4. export | grep MYCHALLENGE  → confirmed declare -x, genuinely exported
5. unset MYCHALLENGE
6. echo $MYCHALLENGE  → confirmed empty, variable genuinely gone
7. env | wc -l / printenv | wc -l  → both returned 49, confirming identical data
8. echo 'export SOURCETEST="I persisted"' > testsource.sh; chmod +x; ./testsource.sh
   → ran normally, echo $SOURCETEST afterward was empty (child process only)
9. source ./testsource.sh; echo $SOURCETEST → "I persisted", proving source
   affects the current shell, unlike running the script normally
10. echo $PATH → captured baseline PATH before modification
11. mkdir ~/mytools; echo 'echo "Hello..."' > ~/mytools/greet.sh; chmod +x
12. greet.sh (before adding to PATH) → command not found
13. export PATH=$PATH:~/mytools → appended, confirmed via echo $PATH
    that original PATH was fully intact plus the new directory at the end
14. greet.sh (after) → "Hello from my custom PATH script!" — proved the
    shell could now find and run the script by name alone
15. cat /etc/environment → confirmed the system-wide default PATH is
    shorter/simpler than the session's customized PATH

## Result
- Temporary variable set, confirmed via echo and export -x, then fully
  unset and confirmed gone ✅
- Directory added to PATH for the session only, proven definitively with
  a before/after test: command not found, then found and executed
  successfully after the PATH change ✅

## Problem encountered and fix
- Typo'd echo $ with no variable name, which just printed a literal $
  instead of a value — corrected to echo $MYCHALLENGE.
</parameter>
