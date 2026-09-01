
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
