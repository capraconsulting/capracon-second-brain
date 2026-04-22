# ROADMAP.md

> Single source of truth for what still needs to be built. Update this as you go.

**Last updated:** 22.04.2026 (Office skills unvendored; repo slimmed to 4 core skills)

## Legend

- [ ] Not started
- [~] In progress
- [x] Done
- **@owner** = assigned person
- **(size)** = rough effort: S (< 1h), M (1-3h), L (half-day)

---

## P0 -- must be done before the workshop

### Docs

- [x] `README.md` (S)
- [x] `AGENTS.md` (S)
- [x] `CLAUDE.md` (S)
- [x] `CONTEXT.md` (S)
- [x] `ROADMAP.md` (S) -- you are here
- [x] `START_HERE.md` (M) **@magnus** -- the stack-quiz entry point
- [x] `docs/01-pick-your-stack.md` (S) **@magnus** -- expanded quiz logic
- [x] `docs/02-bootstrap-obsidian.md` (M) **@magnus** -- Path A, default
- [x] `docs/03-bootstrap-notion.md` (M) **@magnus** -- Path B (filled in, hosted Notion MCP as default, local fallback documented)
- [x] `docs/04-bootstrap-sharepoint.md` (M) **@magnus** -- Path C (filled in, declarative agent as default, Work IQ SharePoint MCP as power-user path)
- [x] `docs/04b-bootstrap-confluence.md` (M) **@magnus** -- Path E (added 18.04.2026, Rovo MCP default + sooperset fallback + raw REST escape hatch)
- [x] `docs/05-bootstrap-plain.md` (S) **@magnus** -- Path D
- [x] `docs/06-challenges.md` (M) **@magnus** -- Challenge 1 (YouTube capture) + Challenge 2 (copy-to-clipboard + devils-advocate skills)
- [x] `docs/07-going-further.md` (S) **@magnus** -- inspo, links, next steps

### Starter vault

- [x] `starter-vault/CLAUDE.md` (M) **@magnus** -- simplified fork of personal vault CLAUDE.md
- [x] `starter-vault/AGENTS.md` (S) -- points at CLAUDE.md
- [x] `starter-vault/Templates/Note.md` (S)
- [x] `starter-vault/Templates/Learning.md` (S)
- [x] `starter-vault/Templates/Person.md` (S)
- [x] `starter-vault/Templates/Meeting.md` (S) -- added as bonus, useful for workshop demo
- [x] `.gitkeep` placeholders in empty dirs so git tracks them

### Skills

- [x] Copy `~/dev/personal/vault/.claude/skills/youtube-transcribe/` into `.claude/skills/` (S) **@magnus**
- [x] Copy `~/.claude/skills/skill-creator/` into `.claude/skills/` (S) **@magnus**
- [x] Copy `~/.claude/skills/obsidian-vault/` into `.claude/skills/` (S) **@magnus** -- core conventions skill
- [x] Add `brainstorming` (obra/superpowers) + `pptx`, `xlsx`, `docx` (anthropics/skills) from skills.sh ecosystem (S) **@magnus**
- [ ] Verify all skills work in the repo after fresh clone (M) **@magnus** -- dry-run on a second machine
- [ ] Extract the `copy-to-clipboard` + `devils-advocate` solutions so crew can help stragglers (M) **@magnus**

### Testing

- [ ] End-to-end dry run with a non-crew Capra colleague who didn't see the talk (L) **@crew**
- [ ] End-to-end dry run with someone on Path C (SharePoint + Copilot) specifically (M) **@vemund-or-rune**

### Logistics

- [x] Decide repo location: Capra-org on GitHub vs Magnus personal (S) **@crew-meeting** -- landed on capraconsulting/capracon-second-brain (private)
- [x] `git init`, initial commit, push (S) **@magnus**
- [ ] Flip repo to public before workshop day (S) **@magnus**
- [ ] QR-code / short URL pointing to the repo (S)
- [ ] Slide in talk that points at repo (S) **@magnus**
- [ ] Backup: pre-recorded walkthrough if wifi dies (M) **@magnus**

---

## P1 -- nice-to-have before the workshop

- [ ] Screenshots in bootstrap docs (M)
- [ ] Expand troubleshooting sections in each bootstrap doc once dry-runs surface real issues (M)
- [x] Path B and C bootstraps: fill in the TODOs (M) **@magnus** -- done 18.04.2026

*(Dropped: Dataview dashboard bonus challenge - 105 min is already tight.)*

---

## P2 -- post-workshop

- [ ] Collect feedback via Slack channel / form (S)
- [ ] Post-mortem note in Magnus' vault (S)
- [ ] Iterate repo based on feedback so it stands alone post-workshop (M)
- [ ] Invite participants to share screenshots of their graph after 1 week (S)

---

## Open questions (for crew meeting)

- [x] Repo under Capra org or Magnus personal? -> capraconsulting org (private for now, flip to public before workshop)
- [x] One bonus challenge for fast finishers, yes/no? -> no, dropped
- [ ] Demo skills in intro, or let participants discover them via agent? -> open
- [ ] Vemund's EA-free track (Bedrock/Azure): separate talk or separate workshop? -> open, out of scope for this one

---

## Changelog

- **18.04.2026** -- Repo scaffolded. Initial handoff docs written.
- **18.04.2026 (evening)** -- START_HERE, stack quiz, Paths A and D bootstraps, challenges, going-further all drafted. Paths B and C left as skeleton stubs for Vemund/Rune. starter-vault/ populated with CLAUDE.md, AGENTS.md, 4 templates, folder skeleton. 7 skills copied in: obsidian-vault, youtube-transcribe, skill-creator, brainstorming, pptx, xlsx, docx. Challenge 2 pivoted from "write any skill" to "build copy-to-clipboard + devils-advocate" (more tractable for beginner-intermediate). Repo pushed to capraconsulting/capracon-second-brain (private).
- **18.04.2026 (late)** -- Paths B (Notion) and C (SharePoint) filled in. Path B defaults to the hosted Notion MCP (`https://mcp.notion.com/mcp`, OAuth, no tokens) with a local-server fallback for free-tier Claude Desktop. Path C leads with a declarative M365 Copilot agent scoped to a SharePoint site; falls back to plain Copilot Chat if extensibility is blocked; Work IQ SharePoint MCP documented as a power-user option (admin consent required, 5 MB file cap). Flagged naming churn: Azure AD -> Entra ID, Teams Toolkit -> M365 Agents Toolkit, msgraph-cli archived.
- **22.04.2026 (later)** -- Removed `docx`, `pptx`, and `xlsx` from `starter-vault/.claude/skills/`. Each was ~1.2 MB (~55 files) of Office Open XML schemas -- together they accounted for ~95% of the skills directory bulk (3.6 MB of 3.7 MB total, 174 of 192 files) and none of them were needed during the workshop itself (they're export skills for turning vault notes into shareable Word / PowerPoint / Excel deliverables *after* the workshop). The 4 workshop-critical skills remain vendored (`obsidian-vault`, `youtube-transcribe`, `skill-creator`, `brainstorming`, ~144 KB, 18 files) so bootstrap works offline. Participants who want Office exports install them globally via the `skills` CLI, as documented in `docs/07-going-further.md` and `starter-vault/.claude/skills/README.md`: `npx skills add https://github.com/anthropics/skills --skill docx pptx xlsx -g --agent claude-code -y`. `AGENTS.md` tree, `CONTEXT.md` Decision 6, `SETUP.md` Path A template, and the "Known limitations" sections of Paths B / C / E all updated.
- **22.04.2026** -- Dogfooded Path E end-to-end in Magnus' personal Atlassian Cloud (magnusrodseth.atlassian.net). Rovo MCP OAuth worked, page CRUD via MCP worked, URL-pasted markdown links auto-resolved to `<ac:link>` inline page refs (much smoother than the XML-snippet example previously shown). Three resulting doc fixes:
  - `docs/04b-bootstrap-confluence.md` Step 2: `claude mcp add` command now uses `--scope user` so the MCP sticks across all Claude Code sessions. Added an explicit "Ops the Rovo MCP does NOT support" block (labels + content properties) with three documented workarounds (inline metadata table, raw REST, sooperset MCP). Flagged upfront that participants who lean on labels need a plan from day one.
  - `starter-vault/conventions-confluence.md` Linking rules: added the URL-shortcut note (paste the page URL as a markdown link target, Confluence auto-resolves) alongside the storage-format XML example.
  - `docs/01-pick-your-stack.md`: new **Capabilities and limits per path** matrix -- six paths compared across 10 capabilities (create / update, metadata, labels, inline links, backlinks, search, Claude Code skills, hooks, offline, cost). Slide-ready format for the talk. Surfaced during dogfood that Rovo MCP is Paths-B-and-C-like for skills (no local `.claude/skills/` support) -- worth making that clear before participants pick.
- **21.04.2026 (even even even later)** -- Moved `.claude/skills/` from the repo root into `starter-vault/.claude/skills/` so skills now ship *inside* the vault, matching hooks and commands. Rationale per Magnus 21.04.2026: *"the skills are important to be in the VAULT not in the repo. its the VAULT the workshop is teaching them how to create and setup."* Bootstrap Step 4 of Path A (and Step 3 of Path D) simplified -- skills now come along with the Step 2 copy, no separate `cp` needed. `.claude/` at repo root deleted entirely. Also removed the stale hazard of crew accidentally invoking `obsidian-vault` while CWD was the workshop repo. AGENTS.md repo-structure tree updated; CONTEXT.md Decision 6 rephrased; SETUP.md Path A template adjusted.
- **21.04.2026 (even even later)** -- Ported `.claude/` into `starter-vault/` from Magnus' working personal vault (`~/dev/personal/vault/`). Adds two `PostToolUse` / `SessionStart` hooks (`validate-frontmatter.sh`, `session-context.sh`), five slash commands (`/daily`, `/note`, `/meeting`, `/inbox`, `/link`), and the `settings.json` that wires them. These are what make the `CLAUDE.md` conventions actually stick instead of drifting -- the hook warns on every write, the session-context shows vault state, the commands encode correct frontmatter on creation. Also fixed `.claude/skills/obsidian-vault/SKILL.md`: removed 5 hardcoded references to `~/dev/personal/vault/` that would have broken every non-Magnus participant. Path now resolves from `$CLAUDE_PROJECT_DIR` / `SETUP.md`. `docs/02-bootstrap-obsidian.md` Step 2 now documents what ships for free; Step 3 mentions the `SessionStart` hook fires and the slash commands are available. `.gitignore` now excludes `starter-vault/.claude/settings.local.json`. Surfaced 21.04.2026 when Magnus said: *"I KNOW the obsidian run works -- as long as the instructions and hooks that are in my /Users/magnusrodseth/dev/personal/vault are applied to the guidelines of setting up the Vault there"*. The starter-vault had the instructions but not the hooks.
- **21.04.2026 (even later)** -- Added `starter-vault/conventions-notion.md`, `conventions-sharepoint.md`, and `conventions-confluence.md` as pre-translated siblings of `starter-vault/CLAUDE.md`. Each bootstrap doc (03/04/04b) Step 3 now points participants at the ready-made file instead of asking them to translate `CLAUDE.md` from scratch during the 15-minute bootstrap window. Paths A and D still use `CLAUDE.md` directly (no translation needed). Surfaced during the Path B dogfood on 21.04.2026 when writing the "Vault Instructions" Notion page by hand: every participant would redo this exact translation.
- **21.04.2026 (later)** -- Step 1 of every non-trivial path bootstrap (B/C/E) now spells out the exact `type` / `status` / `tag` values instead of vague "select" / "choice" labels. Each doc calls out `starter-vault/CLAUDE.md` as the single source of truth for taxonomy; path-specific encodings (Notion select / SharePoint Choice / Confluence label) are derivatives. Surfaced while dogfooding Path B on 21.04.2026: the agent had to invent select options to proceed, because the doc said "select" without enumerating values. Path C's Status choice had drifted (`draft, active, archived`) from the starter-vault's per-type statuses; Path E's labels had the same drift. Paths A and D were already correct since they copy `starter-vault/CLAUDE.md` verbatim.
- **21.04.2026** -- `SETUP.md` template added at repo root. Captures per-participant vault coordinates (path / URL / space / site) in a single committed file so the *next* agent session knows where the vault lives without re-running the stack quiz. Every bootstrap doc (Paths A-E) gained a "record where the vault lives" step. `START_HERE.md` grew a short-circuit for already-bootstrapped repos. `AGENTS.md` now lists `SETUP.md` in the repo structure and adds convention 6 ("read `SETUP.md` before asking the participant where anything lives"). Surfaced during a dogfood run when the participant (Magnus) noted: *"i'd expect it to ask me maybe for the link to the folder I want to have for my root in the vault or something? can we add that somewhere and push it to the git repo so we have it for later? the same would go for any tool."*
- **18.04.2026 (even later)** -- Path E (Confluence) added. `docs/04b-bootstrap-confluence.md` leads with Atlassian Rovo MCP (`https://mcp.atlassian.com/v1/mcp`, GA, free, OAuth) via `mcp-remote` proxy. Fallback: `sooperset/mcp-atlassian` (community, actively maintained) with API token for tenants that block Marketplace installs and for Atlassian Data Center. Ultimate fallback: raw REST + API token. Cross-docs updated: START_HERE, 01-pick-your-stack, 06-challenges (path-specific notes), AGENTS.md (5 paths), CONTEXT.md (Decision 2 expanded).
