# Vibe Code Your Second Brain

> **CapraCon 2026 workshop.** Friday 14:00 -- 15:45. 105 minutes, 25 people, one goal: you walk out with a working AI-augmented second brain.

This repo is a **guide + starter pack**, not a finished app. You point your own agent (Claude Code, Codex, GitHub Copilot, Cursor, Windsurf, ...) at `START_HERE.md`, answer a short stack-quiz, and the agent bootstraps your second brain in your tool of choice -- Obsidian, Notion, SharePoint, plain markdown, or Confluence.

## Start here

1. Click **Use this template** (top-right of this page) -> **Create a new repository** and make your own copy under your GitHub account. *(Keeps your work separate from the workshop master, and stops accidental pushes back to it.)*
2. Clone your new repo locally and open it in your agent of choice.
3. Tell your agent: *"Read `START_HERE.md` and help me get going."*
4. Answer the 4-question stack quiz. The agent takes it from there.

## What you'll build

- A **knowledge base** in your chosen stack, with a clean starter structure.
- **Frontmatter / metadata conventions** your agent enforces on every write.
- **One real note** saved with proper metadata and cross-links, before the workshop ends.
- **Two small skills** you wrote yourself in Challenge 2: `copy-to-clipboard` (mechanical helper) and `devils-advocate` (opinionated thinking partner).

## Stuck?

If you're stuck, or your agent is going in circles, flag one of the crew -- we are on the floor for exactly this, with help, tips, and inspiration:

- **Magnus Rødseth** -- speaker, facilitator
- **Rune Lind** -- tech arkitekt
- **Vemund Santi** -- tech lead

## The talk this springboards from

CapraCon 2026: *"Vibe Code Your Second Brain"*. See [`CONTEXT.md`](CONTEXT.md) for the design rationale behind the five paths and two challenges.

Companion app: [vault.magnusrodseth.com](https://vault.magnusrodseth.com) -- a mobile web front-end that reads / writes a vault via GitHub. Next.js + Vercel AI SDK + Claude Sonnet. Source: [github.com/magnusrodseth/vault-website](https://github.com/magnusrodseth/vault-website). Fork it, remix it, or just use it as reference.

## After the workshop

See [`docs/07-going-further.md`](docs/07-going-further.md) for habit-building tips, deeper Claude Code topics (subagents, hooks, MCP), path-specific next steps, and optional post-workshop skills (Word / PowerPoint / Excel export).

## License

MIT. See [`LICENSE`](LICENSE).
