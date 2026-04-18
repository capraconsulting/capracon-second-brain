# .claude/skills/

Skills bundled with this repo. Copied in from their canonical locations on Magnus' machine so participants get everything they need in one clone.

## Skills to copy (see `../../ROADMAP.md`)

- `youtube-transcribe/` -- from `~/dev/personal/vault/.claude/skills/youtube-transcribe/`
- `skill-creator/` -- from `~/.claude/skills/skill-creator/`

These are used in the two workshop challenges (Challenge 1 and Challenge 2 respectively).

## For non-Claude agents

GitHub Copilot, Cursor, Windsurf etc. don't use the `.claude/skills/` convention. The bootstrap docs for Paths B/C/D explain the equivalent:

- Copilot: `.github/prompts/` (to be added)
- Cursor/Windsurf: `.cursorrules` / `.windsurfrules` referencing the skill content
- Generic: concatenate the skill `SKILL.md` into an `AGENTS.md` instruction section
