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

## Linking Rules

The value of this vault is in **real** connections. Manufactured links are worse than no links: they produce a graph that looks rich but is padded with agent guesses, which you will later mistake for knowledge you put there yourself.

- **ALWAYS** use `[[wiki links]]` for internal references, never markdown links
- **Link when the connection is real.** A note with substantial content and 1 honest link is better than a note with thin content and 7 invented links. Do not add links to hit a count.
- **Search before concluding a note is isolated.** If a draft seems to have 0 links, search the vault again: the target may exist under a different name or a synonym. If nothing relevant exists, leave the note unlinked. That is not a failure.
- **Link across folders when it is genuine** (projects to people, learnings to decisions). Do not stretch.
- `related:` in frontmatter is **optional**. Use it only for relationships the body does not already express via inline `[[wikilinks]]`. Do not duplicate.
- **Backlinks only when reciprocal.** Update an older note to link back only if the reverse link is also meaningful. Forced bidirectional links are ghost-links with extra steps.

### Ghost-link discipline (CRITICAL)

A ghost-link is a `[[wikilink]]` pointing to a file that does not exist yet. Ghost-links themselves are fine: Obsidian tracks them in the Unresolved Links pane, and they can act as forcing functions for notes you plan to write later.

What is **not** fine: writing a paraphrased gloss next to a ghost-link that makes a factual claim. Example of what to avoid: an agent writing `- [[Pilot to Production]] — why 75% of AI pilots don't scale` when the source actually said "25% moved 40%+ of experiments into production." The inverted 75% number is an agent interpretation, not a fact from the source, but it now lives in the vault as if it were one. Six months from now you will quote it to a colleague and you will be wrong.

Two acceptable patterns:

1. **Bare ghost-link.** Just `[[Pilot to Production]]` with no gloss. The link is a placeholder; you will write content when you have something honest to say.
2. **Stub with direct fact.** Create `Pilot to Production.md` immediately with 1-2 lines that quote or cite the source directly, with attribution (e.g. "Deloitte 2026, p. 8: 25% of enterprises have moved 40%+ of AI experiments into production").

Never: an agent-authored paraphrase living next to a ghost-link, where the target file is empty and the gloss is the only content. That is how hallucinations enter the vault disguised as linked knowledge.

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
- NEVER write an agent-authored paraphrase next to a ghost-link. Bare link, or real stub.
- ALWAYS search before creating
- LINK when the connection is real, not to hit a count
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
