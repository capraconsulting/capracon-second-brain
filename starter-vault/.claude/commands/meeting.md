---
description: Create a meeting note with attendees and agenda
argument-hint: [meeting title]
---

Create a meeting note for "$ARGUMENTS".

## Ask Me For

1. **Date** (default: today)
2. **Attendees** (names or roles)
3. **Meeting type** (standup, 1:1, planning, review, other)

## File Location

`Meetings/YYYY-MM-DD - <Meeting Title>.md`

## Frontmatter

```yaml
---
type: meeting
created: DD.MM.YYYY
tags: [meeting, <meeting-type>]
attendees:
  - <attendee1>
  - <attendee2>
---
```

## Template Structure

```markdown
# <Meeting Title>

**Date**: DD.MM.YYYY
**Attendees**: [[Person 1]], [[Person 2]]

## Agenda

- 

## Notes



## Action Items

- [ ] @<person> - <action>

## Follow-up

- [[Related Note]]
```

## Rules

- Use wiki links for attendees if they have notes
- Keep agenda section for pre-meeting, notes for during
- Action items should have owner assigned
