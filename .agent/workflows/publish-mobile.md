# /publish-mobile - Mobile App Publishing Workflow

$ARGUMENTS

---

## Purpose
This command orchestrates the multi-day process of preparing a mobile app for the Google Play Store and Apple App Store. It enforces monetization and store compliance rules and tracks progress using a stateful checklist.

## Required Skills
- `app-store-deployment`
- `mobile-monetization`

---

## Behavior

When `/publish-mobile` is triggered, the AI must:

1. **Check for Checklist:** Check if `PUBLISHING_TRACKER.md` exists in the project root.
2. **Initialize Tracker (If Missing):** If it does not exist, the AI must copy the contents of `.agent/templates/publishing_checklist.md` into a new `PUBLISHING_TRACKER.md` file in the project root.
3. **Status Check:** Read the current state of `PUBLISHING_TRACKER.md` and identify the first unchecked step (`[ ]`).
4. **Action:** 
   - State the current Phase and Next Step.
   - If it's a **Human Task**: Explain exactly what the user needs to do in the dashboards, providing links or reference info from the skills.
   - If it's an **AI Task**: Ask the user for any necessary keys (like AdMob IDs) and offer to implement the code/XML changes immediately.

---

## Output Format

```markdown
## 🚀 Mobile Publishing Workflow

**Current Phase:** [Phase Name]
**Next Step:** [Description of the next unchecked task]

[If Human Task]: Here are the instructions to complete this...
[If AI Task]: I am ready to implement this in the codebase. Please provide [X] so I can proceed.
```
