
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

## Output / Result

### jobs output

```javascript
[1]-  Running                 nohup sleep 300 &
[2]+  Running                 nohup sleep 300 &
```

### nohup.out

```javascript
(empty file - sleep produces no output, but file exists)
```

## Problems Encountered and Fixes

1. __Forgot ampersand with nohup:__ Initially ran 'nohup sleep 200' without '&', which ran it in foreground. Had to suspend with Ctrl+Z, then resume with 'bg %2'. Learned that the '&' is essential for running nohup in background from the start.

2. __Understanding job numbers:__ When I ran 'bg 2%' instead of 'bg %2', bash gave an error "no such job". The correct syntax is '%' before the job number, not after.

3. __nohup.out is empty:__ Expected to see output in nohup.out, but since 'sleep' doesn't produce any output, the file is empty. This is normal - the file exists to capture output if the command produces any.
