#!/bin/bash
# Validates that markdown files have frontmatter
# Used as a PostToolUse hook for Write|Edit

set -e

# Read JSON input from stdin
INPUT=$(cat)

# Extract file path from tool input
FILE_PATH=$(echo "$INPUT" | jq -r '.tool_input.file_path // .tool_input.filePath // empty')

# Skip if not a markdown file or no file path
if [[ -z "$FILE_PATH" ]] || [[ ! "$FILE_PATH" =~ \.md$ ]]; then
    exit 0
fi

# Skip templates (they have Templater syntax, not real frontmatter)
if [[ "$FILE_PATH" =~ templates/ ]]; then
    exit 0
fi

# Skip CLAUDE.md and README.md
BASENAME=$(basename "$FILE_PATH")
if [[ "$BASENAME" == "CLAUDE.md" ]] || [[ "$BASENAME" == "README.md" ]]; then
    exit 0
fi

# Check if file exists
if [[ ! -f "$FILE_PATH" ]]; then
    exit 0
fi

# Check for frontmatter (file should start with ---)
if ! head -1 "$FILE_PATH" | grep -q "^---"; then
    echo "Warning: $BASENAME is missing frontmatter. Notes should have YAML frontmatter with type, created, and tags fields." >&2
    # Exit 0 - just warn, don't block
    exit 0
fi

exit 0
