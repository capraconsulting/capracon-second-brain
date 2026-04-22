# 07 - Going Further

> What to do next, after the workshop. Skim this on the train home. Bookmark whichever parts feel relevant.

---

## Keep the habit alive (first 2 weeks)

The workshop is only useful if you capture *one real thing* in the next 48 hours. Pick one:

- A meeting note from tomorrow, written with your agent during or right after the call
- A book / podcast / article summary you would normally forget in 3 days
- A decision journal entry for the next non-trivial call you have to make
- A person profile for someone you just met (no LinkedIn scraping - just your own memory)

One note per day for 14 days and the habit sticks. Skip three days in a row and it probably dies. The agent helps, but the muscle is human.

---

## Magnus' talk and the Pensieve app

- Talk: *"Vibe Coding Your Own AI Second Brain"* (CapraCon 2026)
- Companion app: [vault.magnusrodseth.com](https://vault.magnusrodseth.com) - mobile web app that reads / writes Magnus' vault via GitHub. Built with Next.js, Vercel AI SDK, Claude Sonnet, Dexie IndexedDB.
- Source: [github.com/magnusrodseth/vault-website](https://github.com/magnusrodseth/vault-website)

Fork it if you want a mobile front-end to your own vault.

---

## Deeper Claude Code

- [Claude Code docs](https://docs.anthropic.com/claude-code) - the canonical reference
- **Skills**: you already wrote two in Challenge 2. Browse more at [github.com/anthropics/skills](https://github.com/anthropics/skills) and [github.com/obra/superpowers](https://github.com/obra/superpowers). Install with the `skills` CLI, scope globally so they work in every vault:
  ```bash
  npx skills add https://github.com/anthropics/skills --skill docx pptx xlsx -g --agent claude-code -y
  ```
  The workshop deliberately does *not* bundle `docx` / `pptx` / `xlsx` because each is ~1.2 MB of Office Open XML schemas. Install them here if you want to generate Word docs, slide decks, or Excel sheets from vault notes (e.g. turn a `Learning` note into a one-pager for a colleague).
- **Subagents**: specialist agents that get invoked for specific tasks. Great for code review, docs writing, or domain-specific work. See Claude Code docs -> Subagents.
- **Hooks**: shell commands triggered on events (session start, tool use, user prompt). Useful for auto-committing your vault, playing a sound on task completion, or injecting context.
- **MCP servers**: your agent's peripherals. Notion, Gmail, Google Calendar, Slack, Playwright, and hundreds more. [Claude Code MCP docs](https://docs.anthropic.com/claude-code/mcp).

---

## If you are on Path B (Notion)

- [Notion MCP docs](https://developers.notion.com/docs/mcp)
- Consider a hybrid: use Notion for collaboration / structured databases, but keep atomic notes in a plain markdown vault that syncs to a Notion page on demand.

## If you are on Path C (SharePoint + Copilot)

- [Microsoft 365 Copilot docs](https://learn.microsoft.com/en-us/copilot/)
- [Copilot Studio](https://www.microsoft.com/en-us/microsoft-copilot/microsoft-copilot-studio) for building enterprise agents
- Tenant-specific: check with your Capra / client admin what MCP-like extensions are allowed

## If you are on Path D (plain markdown)

- [Cursor docs](https://docs.cursor.com)
- [Windsurf docs](https://docs.codeium.com/windsurf)
- [Codex CLI](https://github.com/openai/codex) (OpenAI)
- You can move to Obsidian any time without rewriting anything - the folder structure and frontmatter carry over.

---

## Other inspiration

- **Peter Steinberger's agentic engineering blog** - pragmatic deep-dives on how power users actually work with agents: <https://steipete.com>
- **Tiago Forte's *Building a Second Brain*** - the book that popularized the concept. Everything in this workshop is compatible with his CODE / PARA method even though we did not lean on the jargon.
- **Andy Matuschak's notes** (on note-taking, evergreen notes, Zettelkasten): <https://notes.andymatuschak.com>

