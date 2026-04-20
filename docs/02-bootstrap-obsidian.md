# 02 - Bootstrap: Obsidian + Claude Code (Path A)

> **For the agent.** Path A participant picked Obsidian as their knowledge base and Claude Code (or similar local agent) as their assistant. Target time: 15 minutes.

---

## Goal

By the end of this doc, the participant has:

1. Obsidian installed and pointed at a new vault folder
2. The `starter-vault/` contents copied into that folder
3. Claude Code running in the vault directory, having read `starter-vault/CLAUDE.md`
4. One real note saved in `Learning/` or `Notes/` with correct frontmatter and at least 2 wiki links

---

## Step 1: Install Obsidian

If they do not have it:

```bash
brew install --cask obsidian
```

Or download from [obsidian.md](https://obsidian.md).

No account required. Everything is local markdown.

---

## Step 2: Create the vault

Ask the participant where they want the vault to live. Good defaults:

- `~/Documents/vault`
- `~/dev/vault`
- `~/second-brain`

Then create it and copy the starter:

```bash
# Pick a location
VAULT=~/Documents/vault

# Copy the starter into the vault location
cp -R /path/to/capracon-second-brain/starter-vault "$VAULT"

# Open the vault in Obsidian
open -a Obsidian "$VAULT"
```

When Obsidian prompts, pick **"Open folder as vault"** and select `$VAULT`.

Enable **Settings -> Files and links -> Detect all file extensions** so markdown files are visible.

---

## Step 3: Point Claude Code at the vault

```bash
cd $VAULT
claude
```

First thing to tell Claude:

> *"Read CLAUDE.md and confirm you understand the vault conventions. Then list the folder structure."*

Verify Claude:
- Lists the correct folders
- Knows the frontmatter schema
- Knows to always use `[[wiki links]]`

If Claude gets any of those wrong, re-read `CLAUDE.md` with it before proceeding.

---

## Step 4: Copy the skills into the vault

The skills bundled with this workshop repo need to live inside the vault to be usable by Claude Code in the vault directory:

```bash
mkdir -p $VAULT/.claude/skills
cp -R /path/to/capracon-second-brain/.claude/skills/* $VAULT/.claude/skills/
```

Skills that get copied:

- `obsidian-vault` - core conventions, referenced by the vault CLAUDE.md
- `youtube-transcribe` - used in Challenge 1
- `skill-creator` - used in Challenge 2 when the participant writes their own skills
- `brainstorming` - used in Challenge 2 before picking what skill to build
- `docx`, `pptx`, `xlsx` - for turning vault notes into shareable deliverables later

Verify Claude can see them:

> *"List the skills in `.claude/skills/`."*

---

## Step 5: Write the first real note

Ask the participant to pick something small they actually want to remember. Examples:

- A recent book or article they read
- A meeting from yesterday
- A technical thing they learned this week
- A person they want to track (not from LinkedIn - just their own memory)

Then, with the participant, create the note. Claude should:

1. Pick the correct folder based on type (`Learning/`, `Meetings/`, `Notes/`, etc.)
2. Use the right template from `Templates/`
3. Fill in frontmatter with today's date (`DD.MM.YYYY`)
4. Add 2-3 `[[wiki links]]` (even if the targets do not exist yet - Obsidian shows them as yellow until you create them)
5. Confirm with the participant before writing to disk

---

## Step 6: Verify in Obsidian

Open Obsidian. The new note should:

- Appear in the correct folder in the file explorer
- Show the YAML frontmatter as a "Properties" panel at the top
- Show `[[wiki links]]` as clickable references

Open **Graph View** (`Cmd+G`) to see the note as a dot in the graph. Right now it is lonely. That changes after Challenge 1.

---

## Step 7: Hand off to challenges

Go to `docs/06-challenges.md`.

---

## Troubleshooting

| Problem | Fix |
|---------|-----|
| Claude does not know the frontmatter rules | Ask it to re-read `CLAUDE.md`. If that fails, `cat CLAUDE.md` into the chat directly. |
| Wiki links render as plain text | Check **Settings -> Files and links -> Use wikilinks** is on. |
| `.claude/skills/` is not picked up | `cd` into the vault root before starting `claude`. Skills resolve relative to the CWD. |
| Obsidian opens on the wrong folder | **File -> Open another vault...** and re-select. |
| Participant wants to sync to iCloud / Dropbox | Fine, but do not sync `.obsidian/workspace*` files - add them to `.gitignore` if using git. |
