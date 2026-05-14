# /reset - Context Reset and Cleanup

$ARGUMENTS

---

## Purpose
When the chat gets too long, or the AI's background folders get bloated with gigabytes of old screenshots and artifacts, use this workflow to physically clean the disk and re-orient the AI to the absolute truth of the codebase.

## Behavior
When `/reset` is triggered, you MUST execute the following steps:

1. **Clean the Disk (// turbo-all)**
   Execute the cleanup script to free up disk space:
   ```bash
   bash .agent/skills/context-reset/scripts/nuke_cache.sh
   ```

2. **Re-orient to the Codebase**
   - Read the output of the script carefully to understand the current `git status` and recent commits.
   - Use your file viewing tools to read the `README.md` and `ARCHITECTURE.md` (if they exist) to re-familiarize yourself with the core project.

3. **Acknowledge**
   - Tell the user how much space was cleared (if observable).
   - Summarize the current state of the repository based on the Git status.
   - Ask the user what feature they would like to tackle next with this fresh context.
