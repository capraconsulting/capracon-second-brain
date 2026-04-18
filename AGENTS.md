# AGENTS.md -- Handoff doc for AI sessions working on this repo

> **Read this first.** This doc exists so any AI session (Claude, Codex, Copilot, Cursor, Windsurf, ...) can pick up where the previous one left off.

## What this repo is

A workshop companion for **CapraCon 2026**: *"Vibe Code Your Second Brain"* -- a 105-minute workshop (14:00 -- 15:45) for up to 25 people. It springboards from [Magnus Rødseth's CapraCon talk](https://vault.magnusrodseth.com) on the same topic.

The repo itself is the **deliverable**: participants point their own agent at it during the workshop, and the agent bootstraps their second brain setup.

## Audience & level

**Beginner-intermediate.** Not pure beginners (they've seen the talk right before). Not advanced (separate track planned for e.g. Claude Code via AWS Bedrock). Target: people who currently "just prompt in their IDE with no context" and want to level up.

## Non-goals

- Not an app. No frontend, no backend, no deploy target.
- Not Obsidian-specific. Must work for Notion, SharePoint, plain markdown too.
- Not Claude-specific. Must work with Codex, Copilot, Cursor, Windsurf.
- No Playwright MCP demo.
- No AWS Bedrock / Azure routing material (separate initiative).
- No LinkedIn-scraping exercise. `Personal/People/` stays empty in starter-vault.

## The four supported paths

| Path | Knowledge base | Agent | Default |
|------|----------------|-------|---------|
| **A** | Obsidian (local markdown) | Claude Code | Yes (matches talk) |
| **B** | Notion | Claude/ChatGPT + Notion MCP | |
| **C** | M365 SharePoint | Copilot | |
| **D** | Plain folder of `.md` | Any agent (Cursor, Windsurf, Cline, Codex) | |

A user picks one via the quiz in `START_HERE.md`. Each path needs its own `docs/0X-bootstrap-*.md`.

## Repo structure (target)

```
.
├── README.md                         # Public entry point
├── AGENTS.md                         # You are here
├── CLAUDE.md                         # Points at AGENTS.md (for Claude Code convention)
├── CONTEXT.md                        # Full background: talk + Slack thread + decisions
├── ROADMAP.md                        # TODOs with ownership
├── START_HERE.md                     # What the participant's agent reads
├── docs/
│   ├── 01-pick-your-stack.md         # Stack quiz script
│   ├── 02-bootstrap-obsidian.md      # Path A (default)
│   ├── 03-bootstrap-notion.md        # Path B
│   ├── 04-bootstrap-sharepoint.md    # Path C
│   ├── 05-bootstrap-plain.md         # Path D
│   ├── 06-challenges.md              # The two workshop challenges
│   └── 07-going-further.md           # Neste steg, inspo, links
├── starter-vault/                    # Empty Obsidian vault skeleton
│   ├── CLAUDE.md                     # Simplified version of Magnus' vault CLAUDE.md
│   ├── AGENTS.md                     # Duplicate for Codex/Copilot
│   ├── Personal/People/              # (empty, intentionally)
│   ├── Projects/
│   ├── Meetings/
│   ├── Learning/
│   ├── Reference/
│   ├── Notes/
│   ├── Templates/
│   │   ├── Note.md
│   │   ├── Learning.md
│   │   └── Person.md
│   └── Attachments/
└── .claude/
    └── skills/
        ├── youtube-transcribe/       # Copied from ~/dev/personal/vault/.claude/skills/youtube-transcribe
        └── skill-creator/            # Copied from ~/.claude/skills/skill-creator
```

## Current state (as of 18.04.2026)

**Scaffolded only.** Directory structure exists. `README.md`, `AGENTS.md`, `CLAUDE.md`, `CONTEXT.md`, `ROADMAP.md` written. Everything else is a TODO.

See `ROADMAP.md` for the punch list.

## Conventions for AI sessions

1. **Never use em dashes (—).** Use `--`, commas, parentheses, colons. This is a hard user preference from Magnus.
2. **Norwegian or English?** Workshop is in Norwegian (Capra is Oslo-based). Participant-facing docs should be in Norwegian. Internal/crew docs (this file, `ROADMAP.md`) can be bilingual.
3. **Tool-agnostic.** If a doc only works for Claude, split it or generalize.
4. **Small PRs, commit often.** (Once git is initialized.)
5. **Frontmatter in all starter-vault `.md` files** (following Magnus' vault conventions -- see `starter-vault/CLAUDE.md` once written).

## Source of truth

Full context, including the Slack thread that shaped this, the talk agenda, and the design rationale, lives in **Magnus' personal Obsidian vault**:
`~/dev/personal/vault/Projects/CapraCon 2026 Workshop - Vibe Code Your Second Brain.md`

If you (future AI session) need context and have read access to that vault, read that note. Otherwise, `CONTEXT.md` in this repo has the key excerpts.

## Crew contacts

- **Magnus Rødseth** -- facilitator, owns repo, path A (Obsidian) and D (plain)
- **Rune Lind** -- tech arkitekt, path C (SharePoint)
- **Vemund Santi** -- tech lead, path B (Notion) and share-out moderator

## When in doubt

Ask Magnus. Or open a TODO in `ROADMAP.md` with your question and move on.
