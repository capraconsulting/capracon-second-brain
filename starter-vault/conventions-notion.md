# Vault Instructions (Notion)

> **For Path B participants.** Copy this page into your Notion workspace as a page called **"Vault Instructions"** inside the "Second Brain" parent. Your agent (Claude / ChatGPT / Cursor / ...) should read it to learn the conventions. This file is the Notion-adapted sibling of `starter-vault/CLAUDE.md`; both derive from the same taxonomy (defined in `CLAUDE.md` and mirrored here).

This is an AI-driven second brain hosted in Notion. When the user asks you to "save", "note", "capture", "remember", or "log" something, write a page here following the rules below.

---

## Vault structure

The Second Brain parent page contains:

| Child | Kind | What it is for |
|-------|------|----------------|
| Personal | page | Private notes, journal entries, personal subpages |
| Projects | page | Active project docs, one subpage per project |
| Meetings | database | Meeting notes with attendees and dates |
| Learning | database | Book / article / video / course / podcast takeaways |
| Reference | page | How-to guides, cheatsheets, reusable knowledge |
| Notes | page | Atomic ideas, quick captures, decisions, brags |

Use the databases (`Meetings`, `Learning`) where structured queries matter. Plain pages everywhere else.

---

## Properties (REQUIRED)

For database rows: set the database properties. For plain subpages: put a small callout block at the top of the page with the same fields.

### Common fields

- `type` -- one of: `note`, `project`, `meeting`, `daily`, `resource`, `person`, `decision`, `learning`, `how-to-guide`, `brag`
- `created` -- auto (Notion's Created time)
- `tags` -- multi-select (see **Tags** below)
- `related` -- `@page` mentions to 2-3 other pages

### Type-specific extras

| Type | Extras |
|------|--------|
| `project` | `status` = planning / active / on-hold / completed / archived; `due` date |
| `meeting` | `date`, `attendees` |
| `person` | `last_contact` date |
| `decision` | `status` = active; `revisit` date |
| `learning` | `source` URL, `author`, `status` = draft / active / completed |
| `how-to-guide` | `last_updated` |
| `brag` | `date` |

### Tags (hierarchical, slash-encoded)

Notion multi-select is flat, so keep the slash syntax literally:

- Status: `status/todo`, `status/in-progress`, `status/done`, `status/waiting`
- Source: `source/book`, `source/article`, `source/video`, `source/podcast`, `source/course`
- Area: `area/work`, `area/health`, `area/finance`

Philosophy: tags answer *"what kind of thing is this?"*, links answer *"what is this related to?"*

---

## Where things go

| Content | Type | Destination |
|---------|------|-------------|
| Atomic idea, concept, snippet | note | Notes (subpage) |
| Book / article / video summary | learning | Learning (database row) |
| Decision with options / rationale | decision | Notes (subpage) |
| Meeting notes | meeting | Meetings (database row) |
| Person profile | person | Personal > People (subpage) |
| Project documentation | project | Projects (subpage) |
| Work achievement / win | brag | Notes (subpage) |
| How-to / SOP for yourself | how-to-guide | Reference (subpage) |
| Reference material | resource | Reference (subpage) |

---

## Linking rules (CRITICAL)

The value of this vault is in **connections**, not isolated pages.

- ALWAYS use `@page` mentions (inline page links) for internal references, never raw URLs or markdown links.
- ALWAYS include 2-3+ outgoing `@page` mentions per page.
- ALWAYS populate the `related` property (2-3 entries).
- After creating a page, update 1-2 existing related pages to link back. Notion's Backlinks panel auto-shows inverse links, but only if the forward link exists.
- Link across page-type boundaries: projects -> people, learnings -> decisions.

If a page has 0-1 outgoing links, it is an orphan. Orphans pull the graph apart.

---

## Before creating any page

**SEARCH FIRST.** The vault may already contain what the user is asking for.

1. Search Notion for keywords from the topic (Notion search or MCP `search` tool).
2. Check existing page titles for similar / related pages.
3. Try synonyms.
4. If a page exists, update it. Do not create a duplicate.

---

## Date format

- In page properties: use Notion's native Date type.
- In page titles where a date is needed: `YYYY-MM-DD Human Topic` (ISO for sorting).

---

## Hard rules

- NEVER create a page without setting `type` (and `status` where applicable).
- NEVER use markdown `[text](URL)` for links to other pages in this vault. Use `@page` mentions.
- ALWAYS search before creating.
- ALWAYS add `@page` mentions and populate `related`.
- PREFER short, atomic pages (one idea per page) over long documents.

---

## Philosophy (Zettelkasten-lite)

- One idea per page.
- Let complexity emerge through links, not page length.
- The graph becomes useful when there are many links. Link liberally.
- Connections > hierarchy for organization.
