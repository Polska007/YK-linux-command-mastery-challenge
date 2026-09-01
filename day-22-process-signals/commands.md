

## **FILE 1: commands.md**

```markdown
# Day 22: Controlling Processes with Signals - Command Reference

## 1. kill

### Syntax
```bash
kill <PID>
```

### What it does
Sends the TERM (terminate) signal to a process, asking it to exit gracefully. The process can clean up before exiting.

### Example
```bash
kill 5876
```

### What I learned
The default signal is TERM, which allows the process to perform cleanup. The process shows "Terminated" when it exits gracefully.

---

## 2. kill -9

### Syntax
```bash
kill -9 <PID>
```

### What it does
Sends the KILL (SIGKILL) signal, forcing the process to terminate immediately. The process cannot catch or ignore this signal.

### Example
```bash
kill -9 5891
```

### What I learned
This is a forceful termination - the process cannot clean up. The message shows "Killed" instead of "Terminated". Use only when graceful termination fails.

---

## 3. kill -HUP

### Syntax
```bash
kill -HUP <PID>
```

### What it does
Sends the HUP (hangup) signal. Many daemons use this to reload configuration files without stopping the service.

### Example
```bash
kill -HUP 1234
```

### What I learned
This signal is useful for reloading configurations. Not all processes respond to HUP - it's mainly used with services that are programmed to handle it.

---

## 4. killall

### Syntax
```bash
killall <process_name>
```

### What it does
Kills all processes with the specified name by name, not by PID.

### Example
```bash
killall sleep
```

### What I learned
This is convenient when you want to kill all instances of a process at once. Be careful as it affects all processes with that name system-wide.

---

## 5. pkill

### Syntax
```bash
pkill <process_name>
```

### What it does
Kills processes by name with more flexible matching options than killall.

### Example
```bash
pkill sleep
```

### What I learned
Similar to killall but with more pattern matching capabilities. Can use -f flag to match against full command line.

---

## 6. fg

### Syntax
```bash
fg
```
or
```bash
fg %<job_number>
```

### What it does
Brings a suspended or background job to the foreground, making it the active process in the current terminal.

### Example
```bash
sleep 100 &
# Press Ctrl+Z to suspend
fg %1
```

### What I learned
The job becomes the foreground process and the terminal waits for it. Use 'jobs' command to see available job numbers.

---

## 7. bg

### Syntax
```bash
bg %<job_number>
```

### What it does
Resumes a suspended job in the background, allowing it to continue running without blocking the terminal.

### Example
```bash
sleep 100 &
# Press Ctrl+Z to suspend
bg %1
```

### What I learned
The job continues running in the background and you get your terminal prompt back immediately.

---

## 8. Ctrl+Z (suspend)

### Syntax
Press Ctrl+Z

### What it does
Suspends (pauses) the currently running foreground process and returns control to the shell.

### Example
```bash
sleep 100
# Press Ctrl+Z
```

### What I learned
This stops the process and puts it in the background as a suspended job. Different from Ctrl+C which terminates the process.

---

## 9. nohup

### Syntax
```bash
nohup <command> &
```

### What it does
Runs a command that ignores the SIGHUP (hangup) signal, allowing it to continue running even after you log out.

### Example
```bash
nohup sleep 300 &
```

### What I learned
The process survives logout. Output is redirected to nohup.out by default. Essential for long-running tasks that must not be interrupted.

---

## 10. disown

### Syntax
```bash
disown %<job_number>
```

### What it does
Removes a background job from the shell's job table, preventing it from receiving SIGHUP when you log out.

### Example
```bash
sleep 100 &
disown %1
```

### What I learned
After disown, the job no longer appears in 'jobs' list but continues running. Another way to make processes survive logout.
```

---

## **FILE 2: drill.md**

```markdown
# Day 22: Controlling Processes with Signals - Practice Drill

## Practice Drill Task
Start a long-running command in the background, suspend it, resume it in the background, then start a second one that survives you logging out, using nohup.

## Commands Run (in order)

```bash
# Start first sleep process in background
sleep 100 &

# Suspend the process with Ctrl+Z

# Resume it in the background
bg %1

# Start second process with nohup to survive logout
nohup sleep 300 &

# Verify both jobs are running
jobs

# Verify nohup output file exists
cat nohup.out
```

## Output / Result

### jobs output
```
[1]-  Running                 nohup sleep 300 &
[2]+  Running                 nohup sleep 300 &
```

### nohup.out
```
(empty file - sleep produces no output, but file exists)
```

## Problems Encountered and Fixes

1. **Forgot ampersand with nohup:** Initially ran 'nohup sleep 200' without '&', which ran it in foreground. Had to suspend with Ctrl+Z, then resume with 'bg %2'. Learned that the '&' is essential for running nohup in background from the start.

2. **Understanding job numbers:** When I ran 'bg 2%' instead of 'bg %2', bash gave an error "no such job". The correct syntax is '%' before the job number, not after.

3. **nohup.out is empty:** Expected to see output in nohup.out, but since 'sleep' doesn't produce any output, the file is empty. This is normal - the file exists to capture output if the command produces any.
```

---

## **FILE 3: README.md**

```markdown
# Day 22: Controlling Processes with Signals

# Phase 5 - Process & Service Management | Day 22 of 30

# Commands covered today

See commands.md for all 10 commands with syntax and my own explanation
of what each one does and when I would reach for it.

# What I practiced

Today's practice drill involved controlling processes using signals. I started a long-running sleep command in the background, suspended it with Ctrl+Z, resumed it in the background using bg, then started a second process with nohup that would survive logout. I learned how to move processes between foreground and background, and how to use nohup to keep processes running after disconnecting from the terminal.

# What surprised me

I was surprised that I initially forgot the ampersand (&) when using nohup, which caused it to run in the foreground instead of the background. I also learned that the syntax for bg requires the percent sign before the job number (%1, not 1%), which I got wrong the first time. The nohup.out file being empty also surprised me until I realized sleep doesn't produce any output - the file just needs to exist to capture output if there is any.

# Evidence

Terminal output showing the completed drill is in evidence/.

# Related

Previous day: ../day-21-viewing-processes/

Next day: ../day-23-systemctl-basics/
```

---

Copy these into the appropriate files in your `day-22-process-signals/` folder. Let me know once you've created them!
