---
description: Find and suggest related notes to link
argument-hint: [note name or path]
---

Analyze "$ARGUMENTS" and suggest related notes to link.

## Process

1. **Read the target note** (or current context if no argument)

2. **Search the vault** for related content:
   - Similar tags
   - Overlapping topics/keywords
   - Same type or project
   - Temporal proximity (for daily/meeting notes)

3. **Present suggestions** in priority order:
   - Strong connections (should definitely link)
   - Moderate connections (consider linking)
   - Weak connections (optional, for discoverability)

4. **For each suggestion**, explain:
   - Why it's related
   - Where in the note to add the link
   - Suggested link text if not obvious

## Output Format

```
## Strong Connections
- [[Note Name]] - <reason>
  Suggested placement: <where in the note>

## Moderate Connections
- [[Note Name]] - <reason>

## Weak Connections (optional)
- [[Note Name]] - <reason>
```

## Rules

- Only suggest notes that actually exist
- Prefer bidirectional linking opportunities
- Don't suggest links that already exist in the note
