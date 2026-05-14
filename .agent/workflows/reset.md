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
   - Actively explore the codebase: Use your directory listing tools to map out the current structure of `lib/` and other key folders.
   - Read core documentation (like `README.md` or `ARCHITECTURE.md`) but *do not trust them blindly*. Verify the actual code structure yourself.
   - Wait for the user to state their next goal, then read the specific files required for that task.

3. **Acknowledge**
   - Tell the user how much space was cleared (if observable).
   - Summarize the current state of the repository based on the Git status.
   - Ask the user what feature they would like to tackle next with this fresh context.
