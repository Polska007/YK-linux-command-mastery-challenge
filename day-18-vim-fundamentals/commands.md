## __DAY 18 — VIM FUNDAMENTALS__

### __Command Journal Entry__

__1. vim <file>__

- __Purpose:__ Opens the Vim text editor and loads the specified file. If the file doesn't exist, Vim creates a new empty file with that name.
- __Example:__ `vim day18-practice.txt`
- __What I learned:__ Vim starts in command mode by default, not insert mode. I had to install Vim first with `sudo apt install vim` since it wasn't on the system.
- __Mistake/Surprise:__ I initially expected to be able to type immediately after opening Vim, but nothing happened until I pressed `i` to enter insert mode.

__2. i (insert mode)__

- __Purpose:__ Switches Vim from command mode to insert mode, allowing normal text input.
- __Example:__ Pressed `i` after opening a new file to start typing three lines of text.
- __What I learned:__ The `-- INSERT --` indicator appears at the bottom when insert mode is active.
- __Mistake/Surprise:__ None—this was straightforward once I understood Vim's modal nature.

__3. Esc (command mode)__

- __Purpose:__ Exits insert mode and returns to command mode, where keys act as navigation and editing commands instead of text input.
- __Example:__ Pressed `Esc` after typing three lines to prepare for saving.
- __What I learned:__ One press of `Esc` is sufficient to exit insert mode; the `-- INSERT --` indicator disappears.
- __Mistake/Surprise:__ I almost forgot to press `Esc` before trying to save with `:w`.

__4. :w__

- __Purpose:__ Writes (saves) the current file to disk without quitting Vim.
- __Example:__ Typed `:w` and pressed Enter. The message `"day18-practice.txt" [New] 4L, 105B written` appeared.
- __What I learned:__ The colon (`:`) is required before the command. The status line confirms how many lines and bytes were written.
- __Mistake/Surprise:__ I initially typed just `w` without the colon and nothing happened—the colon is essential.

__5. :q__

- __Purpose:__ Quits Vim and returns to the shell prompt. Refuses to quit if there are unsaved changes.
- __Example:__ Typed `:q` after saving to exit Vim and return to the terminal.
- __What I learned:__ If you try to quit with unsaved changes, Vim warns you with "No write since last change."
- __Mistake/Surprise:__ None—this worked as expected.

__6. :wq / :x__

- __Purpose:__ Saves the file and quits Vim in a single command. Both `:wq` and `:x` accomplish the same thing.
- __Example:__ Used `:wq` at the end of the drill to save the restored file and exit.
- __What I learned:__ This is more efficient than typing `:w` then `:q` separately.
- __Mistake/Surprise:__ None—straightforward save-and-quit.

__7. :q!__

- __Purpose:__ Force quits Vim without saving any unsaved changes. Use this to discard modifications.
- __Example:__ Opened a test file, made a change, then used `:q!` to exit without saving.
- __What I learned:__ This is useful when you want to abandon changes completely.
- __Mistake/Surprise:__ None—important to remember this exists so I don't lose work accidentally.

__8. dd__

- __Purpose:__ Deletes the entire current line in normal mode. The cursor must be positioned on the line to delete.
- __Example:__ Navigated to line 2 and pressed `dd` to delete "Learning vim fundamentals today."
- __What I learned:__ After deletion, the cursor moves to the next line, and the line count decreases.
- __Mistake/Surprise:__ I initially moved the cursor with `j` (down arrow) to reach line 2. I learned that `dd` deletes the whole line, not just from the cursor position onward.

__9. yy / p__

- __Purpose:__ `yy` (yank) copies the current line into Vim's clipboard. `p` (put) pastes the copied content below the current line.
- __Example:__ Yanked a line with `yy`, then pressed `p` to paste it below.
- __What I learned:__ Yanking doesn't change your position; you stay on the same line. Pasting inserts the copied content below.
- __Mistake/Surprise:__ None—this was intuitive after trying it. I learned that uppercase `P` would paste above instead.

__10. u / Ctrl+r__

- __Purpose:__ `u` undoes the last change. `Ctrl+r` redoes an undone change (opposite of undo).
- __Example:__ After deleting the middle line with `dd`, pressed `u` to restore it. The status showed "1 more line; before #1."
- __What I learned:__ Undo and redo work in sequence. Multiple undos can be redone with repeated `Ctrl+r` presses.
- __Mistake/Surprise:__ The undo worked immediately and the line reappeared with a confirmation message at the bottom.

