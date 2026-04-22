# Vault Instructions (SharePoint / M365 Copilot)

> **For Path C participants.** Save this as a SharePoint page (or a `.docx` in the site root) called **"Conventions"** inside the "Second Brain" site. Copilot (declarative agent, plain Copilot Chat, or Work IQ MCP) should ground on it. This file is the SharePoint-adapted sibling of `starter-vault/CLAUDE.md`; both derive from the same taxonomy.

This is an AI-driven second brain hosted in SharePoint. When the user asks you to "save", "note", "capture", "remember", or "log" something, create a document in this site following the rules below.

---

## Vault structure

The "Second Brain" site contains one **document library** per folder:

| Library | What it is for |
|---------|----------------|
| Personal | Private notes, journal entries (optional; consider OneDrive instead) |
| Projects | Active project docs, one doc per project |
| Meetings | Meeting notes with attendees and dates |
| Learning | Book / article / video / course / podcast takeaways |
| Reference | How-to guides, cheatsheets, reusable knowledge |
| Notes | Atomic ideas, quick captures, decisions, brags |
| Attachments | Images, PDFs, diagrams |

If site creation is blocked, fall back to a OneDrive folder tree with the same names.

---

## Metadata columns (REQUIRED on every document)

Each library has four custom columns:

| Column | Type | Purpose |
|--------|------|---------|
| Type | Choice | See **Type values** below |
| Tags | Choice (multi) or Managed Metadata | See **Tag values** below |
| Status | Choice | See **Status values** below (only for types that use status) |
| Related | Lookup (to this library) | Cross-links to other docs (closest thing to `[[wiki links]]`) |

`Created` and `Modified` are auto-populated; do not try to set them.

### Type values

`note`, `project`, `meeting`, `daily`, `resource`, `person`, `decision`, `learning`, `how-to-guide`, `brag`

### Status values (only applies to certain types)

- `learning`: `draft`, `active`, `completed`
- `project`: `planning`, `active`, `on-hold`, `completed`, `archived`
- `decision`: `active`
- other types: no status

Full union: `draft`, `active`, `planning`, `on-hold`, `completed`, `archived`.

### Tag values (pre-populate the Choice column; add more as needed)

- Source: `source/book`, `source/article`, `source/video`, `source/podcast`, `source/course`
- Status tags: `status/todo`, `status/in-progress`, `status/done`, `status/waiting`
- Area: `area/work`, `area/health`, `area/finance`

SharePoint Choice columns are flat, so keep the slash syntax literally as the option value.

Philosophy: tags answer *"what kind of thing is this?"*, links answer *"what is this related to?"*

---

## Where things go

| Content | Type | Destination |
|---------|------|-------------|
| Atomic idea, concept, snippet | note | Notes library |
| Book / article / video summary | learning | Learning library |
| Decision with options / rationale | decision | Notes library |
| Meeting notes | meeting | Meetings library |
| Person profile | person | Personal library |
| Project documentation | project | Projects library |
| Work achievement / win | brag | Notes library |
| How-to / SOP for yourself | how-to-guide | Reference library |
| Reference material | resource | Reference library |

---

## Linking rules (CRITICAL)

SharePoint has no native wiki-link syntax. Use **sharing URLs** or **Related lookup** entries to cross-link.

- ALWAYS add 2-3+ outgoing links per document: sharing URL or a value in the `Related` lookup column.
- After creating a doc, update 1-2 existing related docs to link back.
- Link across library boundaries: projects -> people, learnings -> decisions.

A doc with no outgoing links is an orphan. Orphans pull the graph apart.

---

## Before creating any document

**SEARCH FIRST.** The site may already contain what the user is asking for.

1. Search the site via Copilot grounding (`"search the Second Brain site for X"`).
2. Check existing document titles in the target library.
3. Try synonyms.
4. If a doc exists, update it. Do not create a duplicate.

---

## Date format

- In metadata: use the Date column type.
- In document titles where a date is needed: `YYYY-MM-DD Human Topic`.

---

## Hard rules

- NEVER create a document without setting `Type` (and `Status` where applicable).
- ALWAYS search before creating.
- ALWAYS add cross-links (sharing URLs or Related entries).
- PREFER short, atomic documents (one idea per document) over long reports.
- Column **internal names** differ from display names. List the columns first before asking an agent to set fields.

---

## Philosophy (Zettelkasten-lite)

- One idea per document.
- Let complexity emerge through links, not document length.
- The graph becomes useful when there are many links. Link liberally.
- Connections > folders for organization.
