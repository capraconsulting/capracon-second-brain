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

## Linking rules

SharePoint has no native wiki-link syntax. Use **sharing URLs** or **Related lookup** entries to cross-link.

The value of this site is in **real** connections. Manufactured links produce a library that looks rich but is padded with agent guesses you will later mistake for knowledge you put there yourself.

- **Link when the connection is real.** A document with substantial content and 1 honest cross-link beats a document with thin content and 7 invented ones. Do not add links to hit a count.
- **Search before concluding a doc is isolated.** If a draft has 0 cross-links, search the site again for synonyms and related names. If nothing relevant exists, leave it unlinked — that is not a failure.
- The `Related` lookup column is **optional**. Use it only for relationships the body does not already express via inline sharing URLs. Do not duplicate.
- **Backlinks only when reciprocal.** Update an older document to link back only if the reverse link is also meaningful.

### Ghost-link discipline (CRITICAL)

A ghost-link in SharePoint is a sharing URL or `Related` entry that points to a document or page that does not exist yet. Ghost-links themselves are fine as forcing functions.

What is **not** fine: writing a paraphrased gloss next to a ghost-link that makes a factual claim the source cannot back. Example of what to avoid: `Pilot to Production — why 75% of AI pilots don't scale` (with a broken sharing URL) when the source actually said "25% moved 40%+ into production." The inverted number is an agent interpretation that now lives in the site as if it were fact.

Acceptable patterns:
1. **Bare ghost-link:** the URL or `Related` entry with no paraphrased gloss next to it.
2. **Stub document with direct source quote:** create the target document immediately with 1-2 lines quoting or citing the source, attributed.

Never let Copilot write an agent-authored paraphrase next to a ghost-link whose target is empty. That is how hallucinations enter the site disguised as linked knowledge.

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
- NEVER write an agent-authored paraphrase next to a ghost-link. Bare link, or real stub.
- ALWAYS search before creating.
- LINK when the connection is real, not to hit a count.
- PREFER short, atomic documents (one idea per document) over long reports.
- Column **internal names** differ from display names. List the columns first before asking an agent to set fields.

---

## Philosophy (Zettelkasten-lite)

- One idea per document.
- Let complexity emerge through links, not document length.
- The graph becomes useful when there are many links. Link liberally.
- Connections > folders for organization.
