# Commands - Day 28

## #!/bin/bash (shebang)
The first line of a script, telling the system which interpreter should run the file.

## chmod +x script.sh
Makes a script file executable, required before it can be run directly.

## ./script.sh
Runs an executable script located in the current directory — the ./ prefix is needed since the current directory isn't normally part of PATH.

## VAR=value
Assigns a value to a variable. No spaces are allowed around the = sign in Bash.

## $() command substitution
Captures a command's output and stores it in a variable — the modern, preferred alternative to backticks.

## read -p
Prompts the user for input with an inline prompt message, storing the response in a variable.

## if / elif / else / fi
Conditional logic — runs different code blocks depending on whether a test evaluates true or false.

## -gt / -lt / -eq
Numeric comparison operators used inside test conditions: greater than, less than, and equal to.

## for loop
Iterates over a fixed list of items, running a block of code once per item.

## while loop
Repeats a block of code as long as a given condition remains true.
