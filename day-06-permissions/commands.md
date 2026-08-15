## Day 6 — Reading & Setting Permissions

### 1. ls -l (permission string)
- Purpose: Shows a file's permission string — a 10-character block encoding file type plus owner/group/others read-write-execute permissions.
- Example: `ls -l myscript.sh`
- What I learned: The very first character is the file type (- for regular file), not part of the permissions themselves — the three groups of three that follow are owner, group, then others, in that exact order.
- Mistake/surprise: None.

### 2. chmod (relative +/-)
- Purpose: Adds or removes specific permission bits relative to current permissions, targeting owner (u), group (g), others (o), or all (a).
- Example: `chmod u+x,g-w,g+x,o+x myscript.sh`
- What I learned: Multiple who/permission changes can be combined into a single comma-separated command instead of running chmod repeatedly.
- Mistake/surprise: None — reached the target rwxr-xr-x cleanly on the first try.

### 3. chmod (assignment =)
- Purpose: Sets a category's permissions to exactly what's specified, fully overwriting what was there before for that category.
- Example: `chmod u=rwx,g=rx,o=rx myscript.sh`
- What I learned: Unlike the relative method, this doesn't care what the permissions were beforehand — it declares the final state outright.
- Mistake/surprise: None — reached the same rwxr-xr-x result as the relative method, just via a different approach.

### 4. chmod 755 (octal)
- Purpose: Sets permissions using a 3-digit numeric code — 7 (rwx) for owner, 5 (r-x) for group, 5 (r-x) for others.
- Example: `chmod 755 myscript.sh`
- What I learned: This is the fastest of the three methods once the read=4/write=2/execute=1 math becomes second nature.
- Mistake/surprise: None — all three methods (relative, assignment, octal) landed on the exact same rwxr-xr-x result, confirmed independently with ls -l each time.

### 5. chmod 644 (octal)
- Purpose: Common mode for non-executable files — rw- for owner, r-- for group, r-- for others.
- Example: `chmod 644 myscript.sh`
- What I learned: This strips execute permission entirely across all categories, even if the file had it moments before.
- Mistake/surprise: None.

### 6. chmod 600 (octal)
- Purpose: Restrictive, privacy-focused mode — rw- for owner only, nothing for group or others.
- Example: `chmod 600 myscript.sh`
- What I learned: This is the kind of mode I'd reach for on something sensitive, like an SSH key or credentials file, since group and others get zero access.
- Mistake/surprise: None.

### 7. chmod -R
- Purpose: Applies a permission change recursively to a directory and everything inside it.
- Example: `chmod -R 755 ~/YK-linux-command-mastery-challenge/`
- What I learned: -R reaches every file and subfolder under the target path, not just the top-level directory itself.
- Mistake/surprise: Ran this against my entire GitHub repo instead of a scoped test folder, which gave README.md and LICENSE unnecessary execute permission (755) even though they're plain documentation files. Harmless here since it's just local permission bits, but a genuinely useful lesson in how -R can reach further than intended if the target path isn't scoped carefully.

### 8. umask
- Purpose: Shows the default permission mask subtracted from new files/directories when they're created.
- Example: `umask` → `0002`
- What I learned: A umask value is a subtraction, not a grant — it represents what gets removed from the theoretical maximum (666 for files, 777 for directories).
- Mistake/surprise: This explained something from earlier today — my very first touch-created file started as rw-rw-r-- (664) instead of the more commonly seen rw-r--r-- (644), because this system's umask (0002) only strips write from others, not from group as well.

### 9. umask -S
- Purpose: Shows the umask in symbolic form — the actual resulting permissions new items will receive, rather than what's being subtracted.
- Example: `umask -S` → `u=rwx,g=rwx,o=rx`
- What I learned: This is a more intuitive way to see the practical effect of the umask without doing octal subtraction math in my head.
- Mistake/surprise: None.

### 10. stat -c '%A %U %G'
- Purpose: Prints only specific stat fields — permission string, owner, and group — in one compact line, instead of the full multi-line stat block.
- Example: `stat -c '%A %U %G' myscript.sh` → `-rw------- new new`
- What I learned: This kind of custom-format stat output would be genuinely useful in a script that needs to check permissions programmatically, without parsing the full verbose output.
- Mistake/surprise: None.
