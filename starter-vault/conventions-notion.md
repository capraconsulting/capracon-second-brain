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

## Linking rules

The value of this vault is in **real** connections. Manufactured links produce a graph that looks rich but is padded with agent guesses you will later mistake for knowledge you put there yourself.

- ALWAYS use `@page` mentions (inline page links) for internal references, never raw URLs or markdown links.
- **Link when the connection is real.** A page with substantial content and 1 honest `@mention` beats a page with thin content and 7 invented mentions. Do not add mentions to hit a count.
- **Search before concluding a page is isolated.** If a draft has 0 mentions, search Notion again for synonyms and related names. If nothing relevant exists, leave the page unlinked — that is not a failure.
- The `related` property is **optional**. Use it only for relationships the body does not already express via inline `@mentions`. Do not duplicate.
- **Backlinks only when reciprocal.** Update an older page to link back only if the reverse link is also meaningful. Notion's Backlinks panel shows inverse links automatically — do not manually add inverse mentions that are not genuinely relevant on both sides.

### Ghost-link discipline (CRITICAL)

A ghost-link in Notion is an `@page` mention to a page that does not exist yet (Notion offers "Create new page" inline — the mention resolves once you do). Ghost-mentions themselves are fine as forcing functions.

What is **not** fine: writing a paraphrased gloss next to a ghost-mention that makes a factual claim the source cannot back. Example: writing `@Pilot to Production — why 75% of AI pilots don't scale` when the source actually said "25% moved 40%+ into production." The inverted number is an agent interpretation that now lives in the vault as if it were fact.

Acceptable patterns:
1. **Bare ghost-mention:** `@Pilot to Production` with no gloss.
2. **Stub with direct source quote:** create the target page immediately with 1-2 lines quoting or citing the source, attributed.

Never write an agent-authored paraphrase next to a ghost-mention whose target page is empty. That is how hallucinations enter the vault disguised as linked knowledge.

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
- NEVER write an agent-authored paraphrase next to a ghost-mention. Bare mention, or real stub.
- ALWAYS search before creating.
- LINK when the connection is real, not to hit a count.
- PREFER short, atomic pages (one idea per page) over long documents.

---

## Philosophy (Zettelkasten-lite)

- One idea per page.
- Let complexity emerge through links, not page length.
- The graph becomes useful when there are many links. Link liberally.
- Connections > hierarchy for organization.
