---
description: Process unorganized notes and ideas
---

Process unorganized notes in the vault.

## Scan Locations

1. `Notes/` - quick captures and ideas
2. Root level `.md` files (except CLAUDE.md, README.md)
3. Any notes missing proper frontmatter

## For Each Unprocessed Note

1. **Assess the content**:
   - Is it a fleeting idea or substantial note?
   - What type should it be?
   - What tags apply?

2. **Present options**:
   - **Keep & organize**: Add frontmatter, suggest folder, suggest links
   - **Merge**: Combine with existing note (specify which)
   - **Expand**: This idea needs development (I'll work on it)
   - **Archive**: Move to archive or delete
   - **Skip**: Leave for later

3. **Wait for my decision** before proceeding to next note

## Output Format

```
## Note: <filename>

**Content preview**: <first 2-3 lines>

**Assessment**: <your analysis>

**Recommendation**: <Keep/Merge/Expand/Archive>
- Suggested type: <type>
- Suggested tags: <tags>
- Suggested folder: <folder>
- Related notes: [[Note1]], [[Note2]]

What would you like to do? (keep/merge/expand/archive/skip)
```

## Rules

- Process one note at a time
- Wait for my input before moving to the next
- Don't auto-organize without my approval
- Respect existing frontmatter (only fix if broken)
