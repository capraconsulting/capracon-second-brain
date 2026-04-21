# SETUP.md -- your vault coordinates

> **For the participant.** Fill this in at the end of bootstrap. Commit it. Every future agent session that starts in this repo reads this file first so it knows **where your vault lives** and **what to write to**.
>
> **For the agent.** If any of the fields below are still `<TODO>` and the user asks you to save, note, capture, or log something, stop and run the bootstrap first. Do not guess a location.

**Path:** `<TODO: A / B / C / D / E>`
**Agent:** `<TODO: Claude Code / Claude Desktop / ChatGPT / Cursor / Windsurf / Copilot / ...>`
**Last updated:** `<TODO: DD.MM.YYYY>`

---

## Instructions

1. Fill in the top three fields.
2. Fill in **only the section below that matches your path**. Delete the rest.
3. Save, commit, push.

---

## Path A -- Obsidian vault

- **Vault path (absolute):** `<TODO: e.g. /Users/you/Documents/vault>`
- **Git remote for the vault:** `<TODO: e.g. git@github.com:you/second-brain.git, or "none -- local only">`
- **Branch:** `<TODO: e.g. main>`
- **Skills present in `$VAULT/.claude/skills/`:** `<TODO: list; default is the seven that ship with starter-vault (obsidian-vault, youtube-transcribe, skill-creator, brainstorming, pptx, xlsx, docx) plus anything you added in Challenge 2>`

## Path B -- Notion

- **Parent page URL:** `<TODO: paste the share link to your "Second Brain" page>`
- **Parent page ID:** `<TODO: UUID from the URL, e.g. 349cce311db480039962c5eab0fef0f7>`
- **Workspace:** `<TODO: e.g. capra, personal>`
- **Notion MCP transport:** `<TODO: hosted (https://mcp.notion.com/mcp) OR local (@notionhq/notion-mcp-server)>`
- **Databases created:** `<TODO: list, e.g. Learning, Meetings>`

## Path C -- SharePoint / M365 Copilot

- **Site URL:** `<TODO: e.g. https://tenant.sharepoint.com/sites/second-brain>`
- **Document library:** `<TODO: e.g. Documents>`
- **Copilot agent name:** `<TODO: if using a declarative agent, its name>`
- **Extensibility blocked?:** `<TODO: yes/no -- if yes, you are using plain Copilot Chat>`

## Path D -- Plain markdown, agent-agnostic

- **Vault path (absolute):** `<TODO>`
- **Git remote:** `<TODO>`
- **Agent config files in use:** `<TODO: any of .cursorrules, .windsurfrules, .github/copilot-instructions.md, AGENTS.md, CLAUDE.md>`
- **Primary agent:** `<TODO: Cursor / Windsurf / Cline / Codex / Copilot / ...>`

## Path E -- Confluence / Atlassian

- **Base URL:** `<TODO: e.g. https://tenant.atlassian.net/wiki>`
- **Space key:** `<TODO: e.g. SECONDBRAIN>`
- **MCP flavor:** `<TODO: Rovo hosted / sooperset local / raw REST>`
- **Parent page ID (if applicable):** `<TODO>`

---

## Notes

Anything path-specific worth remembering next session. For example:

- database property names that differ from the defaults
- plugins enabled in Obsidian that your notes depend on
- tenant-level quirks (file size caps, admin consent requirements, etc.)
- which skills you added yourself after bootstrap
