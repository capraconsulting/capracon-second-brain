# CONTEXT.md -- Full background

> For any session (human or AI) joining this project cold. This is the *why* and the *how we got here*.

## The talk this springboards from

**Title:** *"Vibe Coding Your Own AI Second Brain"*
**Event:** CapraCon 2026, theme *"Mennesket og maskinen"*
**Speaker:** Magnus Rødseth (Capra consultant)
**Length:** ~30 min

### Talk agenda (Why → What → How → Tour → Demo → So what)

1. **The Why -- "Your Brain Is Leaking"** (5 min). Ebbinghaus forgetting curve, scattered knowledge, Tiago Forte's second brain. The Pensieve metaphor (Dumbledore's memory basin).
2. **The What -- "Pick Your Weapon"** (5 min). Obsidian, Notion, Logseq, Apple Notes. MCP revolution means any tool can be AI-augmented. Magnus picked Obsidian because markdown + wiki links + local-first.
3. **The How -- "Hooking Up Your Agent"** (5-7 min). Power-user path: Claude Code + skills + hooks + subagents. Easy path: Copilot in M365, or "drag a folder into Claude".
4. **The Tour -- "Inside My Brain"** (7-10 min). Vault structure, frontmatter conventions, CLAUDE.md-as-instruction-manual. Live workflow examples: YouTube learning capture, debugging knowledge, people notes, commute-idea-to-Pensieve-app origin.
5. **The Demo** (7-10 min). Playwright MCP drives the browser while Magnus narrates. Agent uses the AI app.
6. **The So What -- "Mennesket og maskinen"** (5 min). Be playful (guitar analogy). Just talk to the model. You're not replaced by AI, you're replaced by a human using AI better than you (Jensen Huang).

### The Pensieve app (demo'd during talk)

Mobile web app at [vault.magnusrodseth.com](https://vault.magnusrodseth.com). Next.js + Vercel AI SDK + Claude Sonnet + Dexie IndexedDB + Octokit for GitHub API. Reads/writes Magnus' vault via GitHub. Source: [github.com/magnusrodseth/vault-website](https://github.com/magnusrodseth/vault-website).

---

## The Slack thread that produced this workshop

(Capra internal channel, April 2026)

**Håvard Opheim:** *"Bygg din egen second brain med en eller flere kunnskapsbaser (obsidian, notion) + agent. Vi gir en basic guide + litt oppgaver og inspo til hvordan dette kan tas videre."*

**Magnus Rødseth:** *"Liker dette, men vil ikke binde folk til å gjøre det i Obsidian + Claude. Kan være eksterne som bare kan gjøre det i Copilot + Sharepoint, og det skal også være mulig."*

**Vemund Santi:** *"En tilbakemelding som ble gitt etter forrige Claude Workshop var at de ønsket en workshop for mer viderekommende også."* Forslag: EA-fri Claude Code via AWS Bedrock / Azure. Konklusjon: egen workshop/talk, ikke denne.

**Håvard Opheim:** *"Jeg tror endel kunder fortsatt henger litt etter. Mange som fortsatt i IDE bare prompter, ingen kontekst. Så det hadde vært fint med en litt advanced workshop."* (Read: land dette på beginner-intermediate.)

**Crew** (confirmed): Magnus (speaker + owner), Rune Lind (tech arkitekt, pappaperm ut uke 17 -- back før workshopen), Vemund Santi (tech lead).

**Action:** Magnus genererer dokument for workshopen og sender til crew-møte mandag/tirsdag (Vemund kaller inn).

---

## Design decisions (and why)

### Decision 1: Repo as the deliverable, not an app

The repo *is* the workshop material. Participants point their own agent at it. This matches the talk's core message -- "agent with access to a folder" -- and scales from solo newbie to enterprise-locked Copilot user without code changes.

### Decision 2: Five paths, default A (Obsidian + Claude Code)

- **A:** Obsidian + Claude Code -- matches the talk, Magnus' lived setup
- **B:** Notion -- common in Capra and client orgs
- **C:** M365 SharePoint + Copilot -- required for enterprise-locked attendees (Håvard's point)
- **D:** Plain markdown + any agent -- anti-lockin fallback, works with Codex/Cursor/Windsurf
- **E:** Confluence + Atlassian Rovo MCP -- added 18.04.2026 after realising the Atlassian-client slice of Capra's customer base was unaddressed. Rovo MCP is GA, free, OAuth-based; roughly Notion-parity on setup friction. Community `sooperset/mcp-atlassian` fallback covers locked-down tenants and Data Center.

A stack-quiz in `START_HERE.md` routes participants.

### Decision 3: Beginner-intermediate, single level

Debated splitting into two tracks. Concluded: 25 people, 105 min, one crew = one level. Advanced track (EA-free Bedrock, custom skills at depth) = separate future initiative.

### Decision 4: Two challenges, not three

- **Challenge 1 (30 min):** YouTube video → AI-extracted learning note → linked into graph. Uses `youtube-transcribe` skill bundled in the repo. Demo video (for crew walkthrough): <https://youtu.be/6MBq1paspVU>. Participants can pick their own.
- **Challenge 2 (30 min):** Build two small skills using `skill-creator` and `brainstorming` skills bundled in the repo: (a) `copy-to-clipboard` (mechanical helper that wraps `pbcopy`), and (b) `devils-advocate` (opinionated thinking-partner persona). Two small skills beats one big skill for beginner-intermediate: more tractable, teaches two different shapes of skill (command wrapper vs reasoning mode).

Dropped LinkedIn-scraping exercise. Dropped Playwright MCP demo as an exercise (it stays in the talk). Dropped Bedrock-routing (separate track). Dropped Dataview dashboard bonus (105 min is already tight).

### Decision 5: Frontmatter-enforced starter vault

Starter-vault ships with a simplified version of Magnus' vault `CLAUDE.md`. Conventions: folder structure (`Personal/ Projects/ Meetings/ Learning/ Reference/ Notes/ Templates/ Attachments/`), YAML frontmatter on every note, `[[wiki links]]` for connections. `Personal/People/` is intentionally empty (no scraping challenge).

### Decision 6: Copy skills, don't reference

Skills get bundled inside `starter-vault/.claude/skills/` so they travel with the vault when the participant copies `starter-vault/` into their chosen location. Participants don't need to install anything else and the skills work offline once cloned. Bundled set:

- `obsidian-vault` (core conventions, sourced from `~/.claude/skills/obsidian-vault`)
- `youtube-transcribe` (for Challenge 1, sourced from `~/dev/personal/vault/.claude/skills/youtube-transcribe`)
- `skill-creator` (for Challenge 2 guide, sourced from `~/.claude/skills/skill-creator`)
- `brainstorming` (for Challenge 2 scoping, sourced from [obra/superpowers](https://github.com/obra/superpowers))
- `pptx`, `xlsx`, `docx` (bonus: vault-to-deliverable exports, sourced from [anthropics/skills](https://github.com/anthropics/skills))

---

## Agenda (14:00 -- 15:45)

| Tid | Lengde | Innhold |
|-----|--------|---------|
| 14:00 -- 14:15 | 15 min | Intro + stack-valg. Alle kloner repoet. |
| 14:15 -- 14:30 | 15 min | Bootstrap. Agenten kjører `START_HERE.md`-quiz, setter opp første notat. |
| 14:30 -- 15:00 | 30 min | Challenge 1: Capture (YouTube → Learning-notat). |
| 15:00 -- 15:30 | 30 min | Challenge 2: Write your own skill. |
| 15:30 -- 15:45 | 15 min | Share-out + neste steg. |

---

## Success metrics

- \>80 % av deltakerne går ut med en fungerende second brain
- \>50 % har skrevet en egen skill
- \>20 % fortsetter å bruke det en uke senere (Slack-screenshots / aktivitet)

---

## Vault pointer

Full planning doc with tasks, open questions, and evolving decisions lives in Magnus' personal Obsidian vault:
`~/dev/personal/vault/Projects/CapraCon 2026 Workshop - Vibe Code Your Second Brain.md`
