# Vault Instructions

This is an AI-driven second brain. Treat this folder as the user's knowledge base. When they ask you to "save", "note", "capture", "remember", or "log" something, write a note in here following the rules below.

If you are not Claude: this file and `AGENTS.md` contain identical instructions. Use whichever your agent reads by default.

---

## Vault Structure

```
Personal/       # Personal notes, journal
  People/       # People you interact with (starts empty)
Projects/       # Active project docs
Meetings/       # Meeting notes with action items
Learning/       # Book / video / article / course takeaways
Reference/      # How-to guides, reusable knowledge
Notes/          # Atomic ideas, quick captures, decisions, brags
Templates/      # Note templates (copy when creating new notes)
Attachments/    # Images, PDFs, diagrams
```

---

## Frontmatter (REQUIRED on every note)

```yaml
---
type: <type>
created: DD.MM.YYYY
tags: []
related: []
---
```

### Valid types

`note` · `project` · `meeting` · `daily` · `resource` · `person` · `decision` · `learning` · `how-to-guide` · `brag`

### Type-specific extra fields

| Type | Extra fields |
|------|--------------|
| `project` | `status: planning\|active\|on-hold\|completed\|archived`, `due: YYYY-MM-DD` |
| `meeting` | `date: DD.MM.YYYY`, `attendees: []` |
| `person` | `last_contact: DD.MM.YYYY` |
| `decision` | `status: active`, `revisit: YYYY-MM-DD` |
| `learning` | `source:`, `author:`, `status: draft\|active\|completed` |
| `how-to-guide` | `last_updated: DD.MM.YYYY` |
| `brag` | `date: DD.MM.YYYY` |

### Tags

Hierarchical, cross-cutting. Examples:

- Status: `#status/todo`, `#status/in-progress`, `#status/done`, `#status/waiting`
- Source: `#source/book`, `#source/article`, `#source/video`, `#source/podcast`
- Area: `#area/work`, `#area/health`, `#area/finance`

Philosophy: tags answer *"what kind of thing is this?"* - links answer *"what is this related to?"*

---

## Where Things Go

| Content | Type | Folder | Template |
|---------|------|--------|----------|
| Atomic idea, concept, snippet | `note` | `Notes/` | `Note.md` |
| Book / article / video summary | `learning` | `Learning/` | `Learning.md` |
| Decision with options / rationale | `decision` | `Notes/` | `Note.md` (adapt) |
| Meeting notes | `meeting` | `Meetings/` | `Meeting.md` |
| Person profile | `person` | `Personal/People/` | `Person.md` |
| Project documentation | `project` | `Projects/` | `Note.md` (adapt) |
| Work achievement / win | `brag` | `Notes/` | `Note.md` (adapt) |
| How-to / SOP for yourself | `how-to-guide` | `Reference/` | `Note.md` (adapt) |
| Reference material | `resource` | `Reference/` | `Note.md` |

---

## File Naming

- General: `Human Readable Name.md` (title case with spaces)
- Meetings: `YYYY-MM-DD Meeting Topic.md`
- Daily: `YYYY-MM-DD.md`

---

## Linking Rules (CRITICAL)

The value of this vault is in **connections**, not isolated notes.

- **ALWAYS** use `[[wiki links]]` for internal references, never markdown links
- **ALWAYS** include 2-3+ outgoing `[[wikilinks]]` per note
- **ALWAYS** populate `related: []` in frontmatter with 2-3 related note names
- After creating a note, update 1-2 existing related notes to link back (bidirectional)
- Link across folders: connect projects to people, learnings to decisions, etc.

If a note has 0-1 outgoing links, it is an orphan. Orphans pull the graph apart. Always search the vault for related content before finishing a note.

---

## Before Creating Any Note

**SEARCH FIRST.** The vault may already contain what the user is asking for.

1. Grep the vault for keywords from the topic
2. Check filenames for similar or related notes
3. Search synonyms and related terms
4. If a note exists, update it. Do not create a duplicate.

---

## Date Format

- In frontmatter / display: `DD.MM.YYYY` (e.g. `18.04.2026`)
- In filenames: `YYYY-MM-DD` (for sorting)

---

## Hard Rules

- NEVER create a note without frontmatter
- NEVER use markdown-style `[text](link)` for internal links
- ALWAYS search before creating
- ALWAYS add wiki links and populate `related:`
- PREFER short, atomic notes (one idea per note) over long documents

---

## Philosophy (Zettelkasten-lite)

- One idea per note
- Let complexity emerge through links, not note length
- The graph becomes useful when there are many links. Link liberally.
- Connections > folders for organization

---

## For Non-Claude Agents

This file applies to any agent reading the vault. GitHub Copilot reads from `.github/copilot-instructions.md` - you may need to concatenate this file there. Cursor reads `.cursorrules`, Windsurf reads `.windsurfrules`. Codex reads `AGENTS.md` (a duplicate of this file in the vault root).
