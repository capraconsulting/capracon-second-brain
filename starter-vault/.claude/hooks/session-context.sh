#!/bin/bash
# Loads vault context at session start
# Shows recent activity to help Claude understand current state

set -e

cd "$CLAUDE_PROJECT_DIR" 2>/dev/null || exit 0

echo "## Vault Context"
echo ""

# Count notes by folder (match starter-vault's Title-cased folder names)
echo "### Note Counts"
for dir in Personal Projects Meetings Learning Reference Notes; do
    if [[ -d "$dir" ]]; then
        count=$(find "$dir" -name "*.md" 2>/dev/null | wc -l | tr -d ' ')
        echo "- **$dir/**: $count notes"
    fi
done
echo ""

# Show recently modified files (last 7 days)
echo "### Recently Modified (7 days)"
recent=$(find . -name "*.md" -mtime -7 -not -path "./.obsidian/*" -not -path "./Templates/*" -not -name "README.md" -not -name "CLAUDE.md" -not -name "AGENTS.md" 2>/dev/null | head -10)
if [[ -n "$recent" ]]; then
    echo "$recent" | while read -r file; do
        # Get relative path without ./
        relpath="${file#./}"
        echo "- [[$relpath]]"
    done
else
    echo "- No recent changes"
fi
echo ""

# Show any uncommitted changes
if git status --porcelain 2>/dev/null | grep -q .; then
    echo "### Uncommitted Changes"
    git status --porcelain 2>/dev/null | head -5 | while read -r line; do
        echo "- $line"
    done
fi

exit 0
