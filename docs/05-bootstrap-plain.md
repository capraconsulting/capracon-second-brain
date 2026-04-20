# 05 - Bootstrap: Plain Markdown + Any Agent (Path D)

> **For the agent.** The participant wants a folder of `.md` files that works with whichever agent they use today and whichever agent they switch to tomorrow. No Obsidian, no Notion, no lock-in. Target time: 15 minutes.

---

## Goal

By the end of this doc, the participant has:

1. A plain folder of markdown files with the standard structure
2. Their agent of choice (Cursor, Windsurf, Cline, Codex, Copilot, or Claude Code) configured to read the conventions
3. The agent has internalized `CLAUDE.md` / `AGENTS.md` / whichever convention file their agent reads
4. One real note saved in `Learning/` or `Notes/` with correct frontmatter and at least 2 wiki links

---

## Step 1: Create the folder

Ask where they want it. Good defaults:

- `~/Documents/second-brain`
- `~/dev/second-brain`
- `~/notes`

```bash
TARGET=~/Documents/second-brain
cp -R /path/to/capracon-second-brain/starter-vault "$TARGET"
cd "$TARGET"
```

---

## Step 2: Agent-specific convention files

The starter has `CLAUDE.md` (and a duplicate `AGENTS.md`). For other agents, add the equivalent file. Pick whichever your agent reads:

| Agent | File to create |
|-------|----------------|
| Claude Code | `CLAUDE.md` (already there) |
| Codex / GitHub Copilot CLI / Cline / generic | `AGENTS.md` (already there - duplicate of CLAUDE.md) |
| Cursor | `.cursorrules` (copy CLAUDE.md contents) |
| Windsurf | `.windsurfrules` (copy CLAUDE.md contents) |
| GitHub Copilot (VS Code) | `.github/copilot-instructions.md` (copy CLAUDE.md contents) |

Quick command to duplicate:

```bash
# Cursor
cp CLAUDE.md .cursorrules

# Windsurf
cp CLAUDE.md .windsurfrules

# GitHub Copilot
mkdir -p .github
cp CLAUDE.md .github/copilot-instructions.md
```

---

## Step 3: Copy the skills (Claude Code only)

Skip this step if the participant is not using Claude Code.

```bash
mkdir -p .claude/skills
cp -R /path/to/capracon-second-brain/.claude/skills/* .claude/skills/
```

For Cursor, Windsurf, Codex, Copilot: the skills will not auto-load. But the core `obsidian-vault` skill content is already embedded in `CLAUDE.md`, so the conventions work regardless. For `youtube-transcribe` and `skill-creator`, the participant can still read the `SKILL.md` files as reference, but they will need to run the `yt-dlp` commands themselves.

---

## Step 4: Open in the agent and load conventions

```bash
# Claude Code
claude

# Cursor / Windsurf -> open folder in the editor, start chat

# Codex -> codex in the folder
```

First prompt to the agent:

> *"Read the conventions file in this folder (CLAUDE.md / AGENTS.md / .cursorrules / etc.) and confirm you understand: folder layout, frontmatter schema, linking rules. Then list the folders you see."*

Verify the agent can recite:
- The folder structure
- The frontmatter schema
- The linking rule (wiki links, 2-3 per note)

If any of those come back wrong, paste the file contents into the chat directly before proceeding.

---

## Step 5: Write the first real note

Same as Path A step 5. Pick something small. Let the agent:

1. Pick folder based on type
2. Use the right template from `Templates/`
3. Fill in frontmatter
4. Add 2-3 `[[wiki links]]`
5. Confirm before writing

---

## Step 6: Verify

```bash
ls -la Learning/   # or wherever the note landed
cat "Learning/Your Note.md"
```

The note should have:
- YAML frontmatter at the top
- A H1 title
- Content
- 2-3 `[[wiki links]]`

---

## Step 7: Hand off to challenges

Go to `docs/06-challenges.md`.

---

## Notes on agent-agnostic use

The whole point of Path D is you can swap agents without rewriting notes. Because:

- Notes are plain `.md` files
- `[[wiki links]]` are just text - all agents can read them as references
- Frontmatter is standard YAML - all agents can parse it
- The conventions file (CLAUDE.md / AGENTS.md / ...) is what teaches any given agent the rules

If you later decide to open the same folder in Obsidian, it "just works" - Obsidian picks up wiki links and frontmatter automatically. Going the other direction (Obsidian vault -> plain folder) also works.

---

## Troubleshooting

| Problem | Fix |
|---------|-----|
| Agent ignores the conventions | Paste the file into the chat directly. Some agents only load the file after the first message. |
| Wiki links look like plain text in VS Code | Install the "Markdown All in One" or "Foam" extension. Or just accept it - the links render correctly in Obsidian later. |
| Multiple agents fighting over conventions | Keep one authoritative file (`CLAUDE.md` or `AGENTS.md`) and make the others symlinks or git-tracked duplicates. |
