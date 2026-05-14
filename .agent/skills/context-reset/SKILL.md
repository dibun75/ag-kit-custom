---
name: context-reset
description: Hard reset for AI context and disk cleanup of heavy artifacts in .gemini directory.
---

# Context Reset Skill

This skill provides a mechanism to clean up your development environment's AI cache and reset the AI's internal context to the source of truth (the actual codebase). 

## Why it exists

Long coding sessions produce thousands of temporary files, screenshots (`.tempmediaStorage`), and heavy task artifacts (like "Store Metadata Tasks") inside the `~/.gemini/antigravity/brain` directory. These can quickly bloat to hundreds of megabytes or even gigabytes. 

Furthermore, as the session grows, the AI relies more on chat history and might lose track of the true state of your repository.

## The Workflow: `/reset`

You should trigger the `/reset` workflow to clear this state.

When triggered, the AI will:
1. Run `nuke_cache.sh` to physically delete heavy folders from the `brain` directory.
2. Read the Git status and recent commit log.
3. Actively scan the codebase directory structure and verify files to re-orient accurately.

### Scripts

- `scripts/nuke_cache.sh`: The core bash script that targets and forcefully removes known bloated directories (`.tempmediaStorage` and `Store Metadata Tasks`) from `~/.gemini/antigravity/brain`. It then prints out a fresh git context summary.
