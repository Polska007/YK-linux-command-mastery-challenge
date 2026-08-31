
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
