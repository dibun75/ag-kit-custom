#!/bin/bash
echo "🧹 Commencing Context Reset & Cleanup..."

# Calculate size before
BEFORE_SIZE=$(du -sh ~/.gemini/antigravity/brain 2>/dev/null | cut -f1)
echo "Current Brain Size: $BEFORE_SIZE"

echo "🗑️  Deleting .tempmediaStorage directories..."
find ~/.gemini/antigravity/brain -type d -name ".tempmediaStorage" -exec rm -rf {} + 2>/dev/null

echo "🗑️  Deleting heavy task artifacts (e.g., Store Metadata Tasks)..."
find ~/.gemini/antigravity/brain -type d -name "Store Metadata Tasks" -exec rm -rf {} + 2>/dev/null

# Calculate size after
AFTER_SIZE=$(du -sh ~/.gemini/antigravity/brain 2>/dev/null | cut -f1)
echo "✅ Cleanup Complete! New Brain Size: $AFTER_SIZE"

echo "---------------------------------------------------"
echo "🌲 FRESH CONTEXT INITIALIZED"
echo "---------------------------------------------------"
echo ">> RECENT COMMITS:"
git log -n 5 --oneline
echo ""
echo ">> CURRENT STATUS:"
git status -s
echo "---------------------------------------------------"
