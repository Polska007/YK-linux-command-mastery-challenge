
```markdown
# Day 21: Viewing Processes - Command Reference

## 1. ps aux

### Syntax
```bash
ps aux
```

### What it does
Displays a snapshot of all currently running processes on the system. The 'a' shows processes for all users, 'u' displays the process owner, and 'x' shows processes not attached to a terminal.

### Example
```bash
ps aux
```

### What I learned
This gives a comprehensive view of every process running on the system, including the user who owns each process, CPU and memory usage, and the full command that started it.

---

## 2. ps -ef

### Syntax
```bash
ps -ef
```

### What it does
Displays all processes in full-format listing with more columns including UID, PID, PPID (parent PID), C, STIME, TTY, TIME, and CMD. The '-e' selects all processes and '-f' provides full format.

### Example
```bash
ps -ef
```

### What I learned
This format shows the parent-child relationship between processes via the PPID column, which helps understand how processes are spawned.

---

## 3. ps -u

### Syntax
```bash
ps -u <username>
```

### What it does
Displays processes owned by a specific user. Useful for monitoring what a particular user is running.

### Example
```bash
ps -u new
```

### What I learned
This filters the process list to show only processes belonging to one user, making it easier to track user-specific activity.

---

## 4. top

### Syntax
```bash
top
```

### What it does
Displays a real-time, dynamic view of running system processes that updates continuously. Shows CPU and memory usage statistics.

### Example
```bash
top -n 1
```

### What I learned
Using '-n 1' makes top run only one iteration and exit, which is useful for capturing a snapshot without manually quitting. The default behavior shows continuously updating data.

---

## 5. htop

### Syntax
```bash
htop
```

### What it does
An interactive process viewer with a more user-friendly, colorful interface than top. Shows CPU and memory usage with visual bars and allows direct interaction with processes.

### Example
```bash
htop
```

### What I learned
Htop provides a more intuitive visual display with color-coded bars for resource usage and allows killing processes or changing priority directly from the interface.

---

## 6. pgrep

### Syntax
```bash
pgrep <process_name>
```

### What it does
Looks up the PID (Process ID) of a running process by its name. Quick way to find a process ID without parsing ps output.

### Example
```bash
pgrep gnome-shell
```

### What I learned
This is much faster than grepping through ps output when you just need to find the PID of a specific process by name.

---

## 7. pstree

### Syntax
```bash
pstree
```

### What it does
Displays running processes as a tree structure, showing parent-child relationships between processes. Helps visualize the process hierarchy.

### Example
```bash
pstree | grep gnome-shell
```

### What I learned
This shows how processes are spawned from each other, making it clear which process is the parent and which are children.

---

## 8. lsof -i

### Syntax
```bash
lsof -i
```

### What it does
Lists all open network connections and the processes that opened them. Shows which process is using which port.

### Example
```bash
lsof -i :80
```

### What I learned
This command specifically filters for network connections only. Without the '-i' flag, lsof shows all open files including regular files, directories, and devices.

---

## 9. jobs

### Syntax
```bash
jobs
```

### What it does
Lists background jobs running in the current shell session.

### Example
```bash
jobs
```

### What I learned
This only shows processes started in the current terminal session, not system-wide processes.

---

## 10. nice / renice

### Syntax
```bash
nice -n <priority> <command>
renice <priority> -p <PID>
```

### What it does
'nice' runs a command with modified CPU priority (nice value from -20 to +19). Lower values mean higher priority. 'renice' changes the priority of a running process.

### Example
```bash
nice -n 10 sleep 100 &
ps -u new -o pid,ni,comm | grep sleep
```

### What I learned
The nice value appears in the NI column of ps output. Most regular processes have a nice value of 0, while multimedia processes like pipewire often have negative values for higher priority.
```

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
```

## Output / Result

### Step 1: pgrep gnome-shell
```
3438
3504
```

### Step 2: top -n 1 -p 3438
```
top - 16:49:20 up  1:53,  1 user,  load average: 0.02, 0.08, 0.08
Tasks:   1 total,   1 running,   0 sleeping,   0 stopped,   0 zombie
%Cpu(s):  3.8 us,  1.3 sy,  0.0 ni, 94.9 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st
MiB Mem :  20486.6 total,  15574.5 free,   1785.0 used,   3127.2 buff/cache
MiB Swap:  2048.0 total,  2048.0 free,      0.0 used.  18387.9 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND                                                                                          
   3438 new       20   0 5487244 436948 159260 R  15.0   2.1   2:50.39 gnome-shell
```

### Step 3: pstree | grep gnome-shell
```
        |         |-gnome-shell-+-Xwayland
        |         |             `-19*[{gnome-shell}]
        |         |-gnome-shell-cal---5*[{gnome-shell-cal}]
```

### Step 4: lsof -i :80
```
No process using port 80 or permission denied
```

## Problems Encountered and Fixes

1. **lsof -i returned nothing:** Initially ran lsof -i without filtering and it showed no output. Learned that lsof -i specifically filters for network connections only. On this desktop system, no process was using port 80, which is expected.

2. **Understanding the difference between pgrep and grep:** Initially tried using pgrep to filter pstree output, but pgrep is for finding PIDs by process name from running processes, while grep is for filtering text output. Corrected by using pstree | grep gnome-shell instead.

3. **Nice value verification:** The sleep process created with nice -n 10 was not in the first 10 lines of ps output. Had to use grep to find it specifically in the full list.
```

---

## **FILE 3: README.md**

```markdown
# Day 21: Viewing Processes

# Phase 5 - Process & Service Management | Day 21 of 30

# Commands covered today

See commands.md for all 10 commands with syntax and my own explanation
of what each one does and when I would reach for it.

# What I practiced

Today's practice drill involved finding the PID of a running process by name using pgrep, viewing that specific process in top with a filtered snapshot, showing it as part of the process tree using pstree, and checking which process is using port 80 with lsof. I learned how to use different tools to view and monitor processes from multiple perspectives - by PID, by user, as a tree hierarchy, and by network connections.

# What surprised me

I was surprised that lsof -i returned no output for port 80 - I expected to see some process using it. I learned that on a desktop system, common services like web servers aren't always running. I also found it interesting that pipewire and pulseaudio have negative nice values (-11), giving them higher priority than regular processes for better audio performance.

# Evidence

Terminal output showing the completed drill is in evidence/.

# Related

Previous day: ../day-20-text-processing-checkpoint/

Next day: ../day-22-process-signals/
```

---

Copy each file content into its respective file in the `day-21-viewing-processes/` folder. Let me know once you've created them, and then we'll proceed with the GitHub commit and LinkedIn article.
