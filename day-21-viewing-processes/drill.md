
---

## **FILE 2: drill.md**

```markdown
# Day 21: Viewing Processes - Practice Drill

## Practice Drill Task
Find the PID of a running process by name, view it in top, show it as part of the process tree, and identify which process is using port 80.

## Commands Run (in order)

```bash
# Step 1: Find PID of a running process by name
pgrep gnome-shell

# Step 2: View that specific process in top (snapshot)
top -n 1 -p $(pgrep gnome-shell | head -1)

# Step 3: Show the process in the process tree
pstree | grep gnome-shell

# Step 4: Check which process is using port 80
sudo lsof -i :80 2>/dev/null || echo "No process using port 80 or permission denied"
