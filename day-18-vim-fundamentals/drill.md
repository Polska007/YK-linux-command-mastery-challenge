````markdown
# Day 18: Vim Fundamentals - Practice Drill

## Practice Drill Task
Open a new file in vim, type three lines of text, save it, reopen it, delete the middle line, undo the deletion, then save and quit.

## Commands Run (in order)

```bash
# Install vim (not already present on system)
sudo apt install vim

# Open new file in vim
vim day18-practice.txt

# Press 'i' to enter insert mode, then type three lines:
# Line 1: This is my first vim practice file
# Line 2: Learning vim fundamentals today
# Line 3: Day 18 of the 30-day Linux challenge

# Press Esc to exit insert mode

# Save the file
:w

# Quit vim
:q

# Reopen the file
vim day18-practice.txt

# Navigate to line 2 (middle line) using 'j' key

# Delete the middle line
dd

# Undo the deletion
u

# Save and quit
:wq
````

## Output / Result

After completing the drill, the file `day18-practice.txt` contains all three original lines:

```javascript
This is my first vim practice file
Learning vim fundamentals today
Day 18 of the 30-day Linux challenge
```

## Problems Encountered and Fixes

1. __Vim not installed:__ The system did not have vim installed. Fixed by running `sudo apt install vim` before starting the drill.

2. __Understanding insert mode:__ Initially tried to type immediately after opening vim, but nothing appeared. Learned that vim opens in command mode and requires pressing `i` to enter insert mode before typing.

3. __Missing colon in save command:__ Initially typed just `w` instead of `:w` and nothing happened. Realized the colon is required before vim commands.

---

```
```

