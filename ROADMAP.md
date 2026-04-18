# ROADMAP.md

> Single source of truth for what still needs to be built. Update this as you go.

**Last updated:** 18.04.2026

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
- [ ] `START_HERE.md` (M) **@magnus** -- the stack-quiz entry point
- [ ] `docs/01-pick-your-stack.md` (S) **@magnus** -- expanded quiz logic
- [ ] `docs/02-bootstrap-obsidian.md` (M) **@magnus** -- Path A, default
- [ ] `docs/03-bootstrap-notion.md` (M) **@vemund-or-rune** -- Path B
- [ ] `docs/04-bootstrap-sharepoint.md` (M) **@vemund-or-rune** -- Path C
- [ ] `docs/05-bootstrap-plain.md` (S) **@magnus** -- Path D
- [ ] `docs/06-challenges.md` (M) **@magnus** -- Challenge 1 + 2 (+ optional bonus)
- [ ] `docs/07-going-further.md` (S) **@magnus** -- inspo, links, next steps

### Starter vault

- [ ] `starter-vault/CLAUDE.md` (M) **@magnus** -- simplified fork of personal vault CLAUDE.md
- [ ] `starter-vault/AGENTS.md` (S) -- duplicate or symlink of above
- [ ] `starter-vault/Templates/Note.md` (S)
- [ ] `starter-vault/Templates/Learning.md` (S)
- [ ] `starter-vault/Templates/Person.md` (S)
- [ ] `.gitkeep` placeholders in empty dirs so git tracks them

### Skills

- [ ] Copy `~/dev/personal/vault/.claude/skills/youtube-transcribe/` into `.claude/skills/` (S) **@magnus**
- [ ] Copy `~/.claude/skills/skill-creator/` into `.claude/skills/` (S) **@magnus**
- [ ] Verify both work in the repo after clone (M) **@magnus**

### Testing

- [ ] End-to-end dry run with a non-crew Capra colleague who didn't see the talk (L) **@crew**
- [ ] End-to-end dry run with someone on Path C (SharePoint + Copilot) specifically (M) **@vemund-or-rune**

### Logistics

- [ ] Decide repo location: Capra-org on GitHub vs Magnus personal (S) **@crew-meeting**
- [ ] `git init`, initial commit, push (S) **@magnus** -- after crew approval
- [ ] QR-code / short URL pointing to the repo (S)
- [ ] Slide in talk that points at repo (S) **@magnus**
- [ ] Backup: pre-recorded walkthrough if wifi dies (M) **@magnus**

---

## P1 -- nice-to-have before the workshop

- [ ] Bonus challenge: "lag et dashboard-notat med Dataview/tilsvarende" (M)
- [ ] Screenshots in bootstrap docs (M)
- [ ] Troubleshooting section in each bootstrap doc (common errors + fixes) (M)

---

## P2 -- post-workshop

- [ ] Collect feedback via Slack channel / form (S)
- [ ] Post-mortem note in Magnus' vault (S)
- [ ] Iterate repo based on feedback so it stands alone post-workshop (M)
- [ ] Invite participants to share screenshots of their graph after 1 week (S)

---

## Open questions (for crew meeting)

- [ ] Repo under Capra org or Magnus personal?
- [ ] One bonus challenge for fast finishers, yes/no?
- [ ] Demo skills in intro, or let participants discover them via agent?
- [ ] Vemund's EA-free track (Bedrock/Azure): separate talk or separate workshop?

---

## Changelog

- **18.04.2026** -- Repo scaffolded. Initial handoff docs written. No code/content yet beyond this scaffolding.
