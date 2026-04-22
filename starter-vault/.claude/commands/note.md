---
description: Create a new note with proper frontmatter
argument-hint: [title]
---

Create a new note titled "$ARGUMENTS" following vault conventions.

## Requirements

1. **Ask me** for:
   - Note type: `note`, `project`, `resource`, or other
   - Tags (suggest relevant ones based on title)
   - Target folder (suggest based on type)

2. **Create the note** with proper frontmatter:
   ```yaml
   ---
   type: <selected-type>
   created: DD.MM.YYYY
   tags: [<selected-tags>]
   ---
   ```

3. **Use wiki links** `[[like this]]` for any internal references

4. **Folder mapping**:
   - `note` / `resource` -> Notes/
   - `project` -> Projects/
   - `daily` -> Personal/
   - `meeting` -> Meetings/

5. After creating, suggest 2-3 existing notes that might be worth linking to.
