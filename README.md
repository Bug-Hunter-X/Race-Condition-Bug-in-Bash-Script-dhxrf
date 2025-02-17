# Race Condition Bug in Bash Script

This repository demonstrates a race condition bug in a bash script. The script attempts to create a file, write to it in the background, and then immediately read from it.  Because of the asynchronous nature of the write operation, the read operation might not find the full content, resulting in an incomplete or empty output.

The `bug.sh` file contains the buggy code, and `bugSolution.sh` provides a solution that addresses the race condition.

## Bug Description
The core issue is a race condition where the `cat` command attempting to read the file may execute before the `echo` command finishes writing to the file, resulting in incomplete or empty file content.

## Solution
The solution involves ensuring the background process completes before attempting to read the file.  This is achieved using `wait`.