# Vault Instructions (Confluence)

> **For Path E participants.** Save this page in your Confluence "Second Brain" space as **"Vault Instructions"**. Your agent (Claude / ChatGPT via Atlassian Rovo MCP, sooperset, or raw REST) should read it to learn the conventions. This file is the Confluence-adapted sibling of `starter-vault/CLAUDE.md`; both derive from the same taxonomy.

This is an AI-driven second brain hosted in Confluence. When the user asks you to "save", "note", "capture", "remember", or "log" something, create a page in this space following the rules below.

---

## Vault structure

The "Second Brain" space contains these top-level pages (each is a parent for its children):

| Page | What it is for |
|------|----------------|
| Personal | Private notes, journal entries, personal subpages |
| Projects | Active project docs, one subpage per project |
| Meetings | Meeting notes with attendees and dates |
| Learning | Book / article / video / course / podcast takeaways |
| Reference | How-to guides, cheatsheets, reusable knowledge |
| Notes | Atomic ideas, quick captures, decisions, brags |

---

## Metadata (REQUIRED on every page)

Confluence has two places to put structured metadata: **labels** (flat, space-wide, searchable) and **content properties** (JSON blobs, agent-friendly, not visible in the UI). Use both.

### Labels to apply

Every page gets:

- **One type label**: `note`, `project`, `meeting`, `daily`, `resource`, `person`, `decision`, `learning`, `how-to-guide`, `brag`
- **One status label (where applicable)**:
  - `learning`: `draft`, `active`, `completed`
  - `project`: `planning`, `active`, `on-hold`, `completed`, `archived`
  - `decision`: `active`
  - other types: no status
- **Tag labels** (multiple per page; pre-populate these, add more as needed):
  - Source: `source/book`, `source/article`, `source/video`, `source/podcast`, `source/course`
  - Status tags: `status/todo`, `status/in-progress`, `status/done`, `status/waiting`
  - Area: `area/work`, `area/health`, `area/finance`

Labels are flat per space. Encode hierarchy with slashes literally.

Philosophy: tags answer *"what kind of thing is this?"*, links answer *"what is this related to?"*

### Content properties (agent-set, for fields that do not fit as labels)

Use `PUT /wiki/rest/api/content/{id}/property/{key}`:

- `author` -- string (for `learning` pages)
- `source` -- URL string (for `learning` pages)
- `last_contact` -- ISO date (for `person` pages)
- `last_updated` -- ISO date (for `how-to-guide` pages)
- `revisit` -- ISO date (for `decision` pages)
- `due` -- ISO date (for `project` pages)

For fields humans should see (not just agents), use the **Page Properties macro** at the top of the page instead of content properties.

---

## Where things go

| Content | Type | Parent page |
|---------|------|-------------|
| Atomic idea, concept, snippet | note | Notes |
| Book / article / video summary | learning | Learning |
| Decision with options / rationale | decision | Notes |
| Meeting notes | meeting | Meetings |
| Person profile | person | Personal (create `People` subpage if none) |
| Project documentation | project | Projects |
| Work achievement / win | brag | Notes |
| How-to / SOP for yourself | how-to-guide | Reference |
| Reference material | resource | Reference |

---

## Linking rules (CRITICAL)

The value of this space is in **connections**, not isolated pages.

- ALWAYS use **inline page links** for internal references, never raw URLs or markdown links.
- **Easiest shortcut via the MCP**: feed markdown content with a regular link target (`[Display text](https://<site>.atlassian.net/wiki/spaces/.../pages/<id>)`). Confluence auto-resolves the URL to a proper `<ac:link><ri:page ... /></ac:link>` reference on save, no hand-written storage-format XML needed. Confirmed in dogfood 22.04.2026.
- Direct storage-format form, for reference: `<ac:link><ri:page ri:content-title="Target Page Title"/><ac:link-body>Display text</ac:link-body></ac:link>` (omit `ac:link-body` to auto-use the page title). In ADF, use an `inlineCard` block with the page URL.
- ALWAYS include 2-3+ outgoing inline page links per page.
- After creating a page, Confluence's Backlinks panel shows the inverse automatically (no manual bidirectional work required, unlike Obsidian).
- Link across type boundaries: projects -> people, learnings -> decisions.

A page with 0-1 outgoing links is an orphan. Orphans pull the graph apart.

---

## Before creating any page

**SEARCH FIRST.** The space may already contain what the user is asking for.

1. Use the MCP search (Rovo or sooperset) with keywords from the topic.
2. Check existing page titles under the relevant parent.
3. Try synonyms.
4. If a page exists, update it. Do not create a duplicate.

---

## Date format

- In content properties: ISO-8601 (`YYYY-MM-DD`).
- In page titles where a date is needed: `YYYY-MM-DD Human Topic`.

---

## Hard rules

- NEVER create a page without applying the type label (and status label where applicable).
- NEVER use plain HTML `<a>` tags or markdown `[text](URL)` for links to other pages in this space. Use storage-format `ac:link` / ADF `inlineCard`.
- ALWAYS search before creating.
- ALWAYS add 2-3 inline page links.
- PREFER short, atomic pages (one idea per page) over long documents.
- `PUT /wiki/api/v2/pages/{id}` requires `"version": { "number": N+1 }`. Labels remain v1 only: `/wiki/rest/api/content/{id}/label`.

---

## Philosophy (Zettelkasten-lite)

- One idea per page.
- Let complexity emerge through links, not page length.
- The graph becomes useful with many links. Link liberally.
- Connections > hierarchy for organization.
