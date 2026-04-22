# starter-vault/.claude/skills/

Skills bundled with the starter-vault. They travel with the vault when the participant copies `starter-vault/` into their chosen location (Path A / D), so no extra install step is needed.

## Bundled (workshop-critical)

| Skill | Used for |
|-------|----------|
| `obsidian-vault` | Core vault conventions (frontmatter, linking, folder layout). Referenced by `starter-vault/CLAUDE.md`. |
| `youtube-transcribe` | Challenge 1: YouTube -> transcript -> Learning note. Requires `yt-dlp` (`brew install yt-dlp`). |
| `skill-creator` | Challenge 2: scaffolding new skills. |
| `brainstorming` | Helps you think through what skill to build in Challenge 2. Sourced from [obra/superpowers](https://github.com/obra/superpowers). |

These four are small (~144 KB total, 18 files) and ship with the vault so they work offline.

## Optional (install post-workshop if you want Office exports)

`docx`, `pptx`, `xlsx` from [anthropics/skills](https://github.com/anthropics/skills) let the agent read / write Word, PowerPoint, and Excel files. Useful for turning vault notes into shareable deliverables. Each skill ships ~1.2 MB of Office Open XML schemas, which is why they are not vendored here.

Install globally (available in every Claude Code session) with the `skills` CLI:

```bash
npx skills add https://github.com/anthropics/skills --skill docx pptx xlsx -g --agent claude-code -y
```

Flags:
- `-g` / `--global` -- user scope instead of project scope (recommended; you will want these in more than one vault)
- `--agent claude-code` -- tells `skills` where to symlink the skill for Claude Code to discover
- `-y` -- skip the confirmation prompt (useful for one-command install)

Once installed, Claude Code picks them up automatically on the next session. Verify with `skills list -g`.

## For non-Claude agents

Paths B (Notion), C (SharePoint), and E (Confluence) do not use these skills directly. Their bootstrap docs explain the equivalents (Notion Custom Instructions / ChatGPT Saved Prompts / Copilot agents / Power Automate flows). Path D (plain markdown, Claude Code) uses them as-is.

The `obsidian-vault` skill content is the most important -- its SKILL.md effectively defines the vault conventions used across all paths.
