# starter-vault/.claude/skills/

Skills bundled with the starter-vault. They travel with the vault when the participant copies `starter-vault/` into their chosen location (Path A / D), so no extra install step is needed.

## What's here

| Skill | Source | Used for |
|-------|--------|----------|
| `obsidian-vault` | `~/.claude/skills/obsidian-vault` | Core vault conventions (frontmatter, linking, folder layout). Referenced by `starter-vault/CLAUDE.md`. |
| `youtube-transcribe` | `~/dev/personal/vault/.claude/skills/youtube-transcribe` | Challenge 1: YouTube -> transcript -> Learning note |
| `skill-creator` | `~/.claude/skills/skill-creator` (canonical: dotfiles) | Challenge 2: scaffolding new skills |
| `brainstorming` | [obra/superpowers](https://github.com/obra/superpowers) | Helps participants think through what skill to build in Challenge 2 |
| `pptx` | [anthropics/skills](https://github.com/anthropics/skills) | Bonus: turn vault notes into slide decks |
| `xlsx` | [anthropics/skills](https://github.com/anthropics/skills) | Bonus: structured data export from vault notes |
| `docx` | [anthropics/skills](https://github.com/anthropics/skills) | Bonus: turn vault notes into Word docs for sharing |

## For non-Claude agents

Paths B (Notion), C (SharePoint), and E (Confluence) do not use these skills directly. Their bootstrap docs explain the equivalents (Notion Custom Instructions / ChatGPT Saved Prompts / Copilot agents / Power Automate flows). Path D (plain markdown, Claude Code) uses them as-is.

The `obsidian-vault` skill content is the most important -- its SKILL.md effectively defines the vault conventions used across all paths.
