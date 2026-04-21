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

## The five supported paths

| Path | Knowledge base | Agent | Default |
|------|----------------|-------|---------|
| **A** | Obsidian (local markdown) | Claude Code | Yes (matches talk) |
| **B** | Notion | Claude/ChatGPT + Notion MCP | |
| **C** | M365 SharePoint | Copilot | |
| **D** | Plain folder of `.md` | Any agent (Cursor, Windsurf, Cline, Codex) | |
| **E** | Confluence (Atlassian Cloud / DC) | Claude/ChatGPT + Atlassian Rovo MCP | |

A user picks one via the quiz in `START_HERE.md`. Each path needs its own `docs/0X-bootstrap-*.md`.

## Repo structure (target)

```
.
├── README.md                         # Public entry point
├── AGENTS.md                         # You are here
├── CLAUDE.md                         # Points at AGENTS.md (for Claude Code convention)
├── CONTEXT.md                        # Full background: talk + Slack thread + decisions
├── ROADMAP.md                        # TODOs with ownership
├── SETUP.md                          # Participant fills this in at bootstrap: vault path / Notion page URL / etc. Source of truth for "where does my vault live".
├── START_HERE.md                     # What the participant's agent reads
├── docs/
│   ├── 01-pick-your-stack.md         # Stack quiz script
│   ├── 02-bootstrap-obsidian.md      # Path A (default)
│   ├── 03-bootstrap-notion.md        # Path B
│   ├── 04-bootstrap-sharepoint.md    # Path C
│   ├── 04b-bootstrap-confluence.md   # Path E
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
        ├── obsidian-vault/           # Core vault conventions (also drives starter-vault/CLAUDE.md)
        ├── youtube-transcribe/       # Challenge 1
        ├── skill-creator/            # Challenge 2 guide
        ├── brainstorming/            # Challenge 2 scoping helper (obra/superpowers)
        ├── pptx/                     # Bonus: vault -> slides
        ├── xlsx/                     # Bonus: vault -> spreadsheet
        └── docx/                     # Bonus: vault -> Word doc
```

## Current state (as of 18.04.2026, paths B / C / E filled in)

**All five bootstrap paths drafted.** Participant-facing flow is complete end-to-end:

- `README.md`, `AGENTS.md`, `CLAUDE.md`, `CONTEXT.md`, `ROADMAP.md` -- handoff docs
- `START_HERE.md` -- stack-quiz entry point (5 paths)
- `docs/01-pick-your-stack.md` -- branching logic
- `docs/02-bootstrap-obsidian.md` -- Path A (full)
- `docs/03-bootstrap-notion.md` -- Path B (hosted Notion MCP default, local MCP fallback)
- `docs/04-bootstrap-sharepoint.md` -- Path C (declarative Copilot agent default, Work IQ SharePoint MCP power-user)
- `docs/04b-bootstrap-confluence.md` -- Path E (Atlassian Rovo MCP default, `sooperset/mcp-atlassian` fallback, raw REST escape hatch)
- `docs/05-bootstrap-plain.md` -- Path D (full)
- `docs/06-challenges.md` -- Challenge 1 (YouTube capture) + Challenge 2 (build `copy-to-clipboard` + `devils-advocate` skills), all 5 paths covered
- `docs/07-going-further.md` -- inspo, links, next steps
- `starter-vault/CLAUDE.md` + `AGENTS.md` -- vault conventions (simplified from Magnus' personal vault)
- `starter-vault/Templates/{Note,Learning,Person,Meeting}.md`
- `starter-vault/` folder skeleton with `.gitkeep` stubs
- `.claude/skills/` -- 7 skills bundled: `obsidian-vault`, `youtube-transcribe`, `skill-creator`, `brainstorming`, `pptx`, `xlsx`, `docx`

See `ROADMAP.md` for what is still open. Main TODOs: dry-run on a non-crew colleague, skills verification after fresh clone, QR code / URL slide, wifi-dies backup.

## Conventions for AI sessions

1. **Never use em dashes (—).** Use `--`, commas, parentheses, colons. This is a hard user preference from Magnus.
2. **Norwegian or English?** Workshop is in Norwegian (Capra is Oslo-based). Participant-facing docs should be in Norwegian. Internal/crew docs (this file, `ROADMAP.md`) can be bilingual.
3. **Tool-agnostic.** If a doc only works for Claude, split it or generalize.
4. **Small PRs, commit often.** (Once git is initialized.)
5. **Frontmatter in all starter-vault `.md` files** (following Magnus' vault conventions -- see `starter-vault/CLAUDE.md` once written).
6. **Read `SETUP.md` before asking the participant where anything lives.** If it has real values, use them. If it still has `<TODO>` placeholders, the participant has not completed bootstrap yet -- route them through `START_HERE.md`.

## Source of truth

Full context, including the Slack thread that shaped this, the talk agenda, and the design rationale, lives in **Magnus' personal Obsidian vault**:
`~/dev/personal/vault/Projects/CapraCon 2026 Workshop - Vibe Code Your Second Brain.md`

If you (future AI session) need context and have read access to that vault, read that note. Otherwise, `CONTEXT.md` in this repo has the key excerpts.

## Crew contacts

- **Magnus Rødseth** -- facilitator, owns repo, paths A (Obsidian), D (plain), and E (Confluence, authored 18.04.2026)
- **Rune Lind** -- tech arkitekt, path C (SharePoint)
- **Vemund Santi** -- tech lead, path B (Notion) and share-out moderator

> Path E has no dedicated floor-walker on workshop day. If a participant picks E, the nearest crew member should roam; Magnus is the fallback since he authored the bootstrap doc.

## When in doubt

Ask Magnus. Or open a TODO in `ROADMAP.md` with your question and move on.
