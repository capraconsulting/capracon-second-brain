# CONTEXT.md -- Design rationale

> For attendees who want to understand why the workshop is shaped the way it is. Safe to skip if you just want to build.

## The talk this springboards from

**Title:** *"Vibe Coding Your Own AI Second Brain"*
**Event:** CapraCon 2026, theme *"Mennesket og maskinen"*
**Speaker:** Magnus Rødseth
**Length:** ~30 min

### Talk agenda

1. **The Why -- "Your Brain Is Leaking"** (5 min). Ebbinghaus forgetting curve, scattered knowledge, Tiago Forte's second brain. The Pensieve metaphor (Dumbledore's memory basin).
2. **The What -- "Pick Your Weapon"** (5 min). Obsidian, Notion, Logseq, Apple Notes. The MCP revolution means any tool can be AI-augmented. Magnus picked Obsidian because markdown + wiki links + local-first.
3. **The How -- "Hooking Up Your Agent"** (5-7 min). Power-user path: Claude Code + skills + hooks + subagents. Easy path: Copilot in M365, or "drag a folder into Claude".
4. **The Tour -- "Inside My Brain"** (7-10 min). Vault structure, frontmatter conventions, CLAUDE.md-as-instruction-manual. Live workflow examples: YouTube learning capture, debugging knowledge, people notes, the commute-idea-to-Pensieve-app origin.
5. **The Demo** (7-10 min). Playwright MCP drives the browser while Magnus narrates.
6. **The So What -- "Mennesket og maskinen"** (5 min). Be playful. Talk to the model. *"You're not replaced by AI, you're replaced by a human using AI better than you."* -- Jensen Huang.

### The Pensieve app (demo'd during the talk)

Mobile web app at [vault.magnusrodseth.com](https://vault.magnusrodseth.com). Next.js + Vercel AI SDK + Claude Sonnet + Dexie IndexedDB + Octokit for GitHub API. Reads / writes a vault via GitHub. Source: [github.com/magnusrodseth/vault-website](https://github.com/magnusrodseth/vault-website). Fork it, remix it, or use it as a reference for your own mobile front-end.

---

## Design decisions (and why)

### Decision 1: Repo as the deliverable, not an app

The repo *is* the workshop material. You point your own agent at it. This matches the talk's core message -- "agent with access to a folder" -- and scales from solo newbie to enterprise-locked Copilot user without code changes.

### Decision 2: Five paths, default A (Obsidian + Claude Code)

- **A:** Obsidian + Claude Code -- matches the talk
- **B:** Notion -- common in consulting / client orgs that live in a Notion workspace
- **C:** M365 SharePoint + Copilot -- for enterprise-locked attendees
- **D:** Plain markdown + any agent -- anti-lockin fallback, works with Codex / Cursor / Windsurf
- **E:** Confluence + Atlassian Rovo MCP -- for the Atlassian-client slice. Rovo MCP is GA, free, OAuth-based; roughly Notion-parity on setup friction. Community `sooperset/mcp-atlassian` fallback covers locked-down tenants and Data Center.

A stack-quiz in `START_HERE.md` routes you.

### Decision 3: Beginner-intermediate, single level

25 people, 105 min, one crew = one level. Advanced tracks (EA-free Bedrock / Azure, custom skills at depth, multi-vault setups) are future initiatives.

### Decision 4: Two challenges, not three

- **Challenge 1 (30 min):** YouTube video -> AI-extracted learning note -> linked into graph. Uses the `youtube-transcribe` skill bundled in the repo.
- **Challenge 2 (30 min):** Build two small skills using `skill-creator` and `brainstorming`: (a) `copy-to-clipboard` (mechanical helper wrapping `pbcopy`), and (b) `devils-advocate` (opinionated thinking-partner persona). Two small skills beats one big skill for beginner-intermediate: more tractable, teaches two different shapes of skill (command wrapper vs reasoning mode).

Dropped: LinkedIn-scraping exercise, Playwright MCP demo-as-exercise (it stays in the talk), Bedrock-routing, Dataview dashboard bonus. 105 min is tight.

### Decision 5: Frontmatter-enforced starter vault

Starter-vault ships with a simplified `CLAUDE.md`. Conventions: folder structure (`Personal/ Projects/ Meetings/ Learning/ Reference/ Notes/ Templates/ Attachments/`), YAML frontmatter on every note, `[[wiki links]]` for connections. `Personal/People/` is intentionally empty (no scraping challenge). A `PostToolUse` hook validates frontmatter on every write so the conventions actually stick instead of drifting.

### Decision 6: Vendor the workshop-critical skills, install the rest

The 4 skills needed during the workshop (`obsidian-vault`, `youtube-transcribe`, `skill-creator`, `brainstorming`) are bundled inside `starter-vault/.claude/skills/` so they travel with the vault and work offline. The `docx` / `pptx` / `xlsx` export skills are **not** bundled -- each is ~1.2 MB of Office Open XML schemas, which would dominate the repo. Install them post-workshop with the `skills` CLI if you want Word / PowerPoint / Excel exports:

```bash
npx skills add https://github.com/anthropics/skills --skill docx pptx xlsx -g --agent claude-code -y
```

See `docs/07-going-further.md` for more.

---

## Agenda (14:00 -- 15:45)

| Tid | Lengde | Innhold |
|-----|--------|---------|
| 14:00 -- 14:15 | 15 min | Intro + stack-valg. Alle lager eget repo fra template. |
| 14:15 -- 14:30 | 15 min | Bootstrap. Agenten kjører `START_HERE.md`-quiz, setter opp første notat. |
| 14:30 -- 15:00 | 30 min | Challenge 1: Capture (YouTube -> Learning-notat). |
| 15:00 -- 15:30 | 30 min | Challenge 2: Write your own skill. |
| 15:30 -- 15:45 | 15 min | Share-out + neste steg. |
