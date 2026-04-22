# 02 - Bootstrap: Obsidian + Claude Code (Path A)

> **For the agent.** Path A participant picked Obsidian as their knowledge base and Claude Code (or similar local agent) as their assistant. Target time: 15 minutes.

---

## Goal

By the end of this doc, the participant has:

1. Obsidian installed and pointed at a new vault folder
2. The `starter-vault/` contents copied into that folder
3. Claude Code running in the vault directory, having read `starter-vault/CLAUDE.md`
4. One real note saved in `Learning/` or `Notes/` with correct frontmatter and at least 2 wiki links
5. `SETUP.md` in the workshop repo filled in with the vault path and committed

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

### What you just got for free

The starter-vault ships with a `.claude/` directory already wired up. After the copy you have:

- **Hooks** (`.claude/hooks/`) -- two bash scripts that run automatically:
  - `validate-frontmatter.sh` -- warns if Claude writes or edits an `.md` that is missing YAML frontmatter. Fires as a `PostToolUse` hook on every `Write` / `Edit`.
  - `session-context.sh` -- injects note counts per folder + recently modified files + uncommitted-change status at the top of every Claude Code session.
- **Slash commands** (`.claude/commands/`) -- `/daily`, `/note`, `/meeting`, `/inbox`, `/link`. These are first-party tools for the most common vault workflows. Participants can add more later (Challenge 2).
- **Settings** (`.claude/settings.json`) -- wires the hooks up. Edit this to add your own hooks later.

These are ported from Magnus' working personal vault. They are the reason the conventions in `CLAUDE.md` actually *stick* instead of drifting: the hook warns on every write, the session-context shows what state the vault is in, the slash commands encode the right frontmatter on creation.

---

## Step 3: Point Claude Code at the vault

```bash
cd $VAULT
claude
```

The `SessionStart` hook should fire and print a "Vault Context" block with note counts and recent activity.

First thing to tell Claude:

> *"Read CLAUDE.md and confirm you understand the vault conventions. Then list the folder structure."*

Verify Claude:
- Lists the correct folders
- Knows the frontmatter schema
- Knows to always use `[[wiki links]]`
- Acknowledges the `/daily`, `/note`, `/meeting`, `/inbox`, `/link` slash commands are available

If Claude gets any of those wrong, re-read `CLAUDE.md` with it before proceeding.

---

## Step 4: Verify the skills are in the vault

The starter-vault already ships with four workshop-critical skills under `$VAULT/.claude/skills/` (they came along with the Step 2 copy):

- `obsidian-vault` -- core conventions, referenced by the vault CLAUDE.md
- `youtube-transcribe` -- used in Challenge 1
- `skill-creator` -- used in Challenge 2 when the participant writes their own skills
- `brainstorming` -- used in Challenge 2 before picking what skill to build

Verify Claude can see them:

> *"List the skills in `.claude/skills/`."*

### Optional: Office export skills (install post-workshop)

If the participant wants to export vault notes to Word / PowerPoint / Excel later, install the Office skills globally with the `skills` CLI:

```bash
npx skills add https://github.com/anthropics/skills --skill docx pptx xlsx -g --agent claude-code -y
```

`-g` puts them in user scope (available across every Claude Code session). Not needed for the workshop itself; these skills total ~3.6 MB of Office Open XML schemas and would bloat the workshop repo if vendored. Point participants at this when they ask about exports in `docs/07-going-further.md`.

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

## Step 7: Record where the vault lives

Open `SETUP.md` in this workshop repo and fill in the **Path A** section (vault path, git remote, branch, which skills got copied). Set `Path: A` at the top and today's date. Delete the other path sections.

Commit it:

```bash
git add SETUP.md
git commit -m "chore: record Path A vault coordinates"
```

Push if the participant has their own remote.

> **Why this step matters.** Without `SETUP.md`, the next agent session you start has no idea where your vault is and will run you through the stack quiz again.

---

## Step 8: Hand off to challenges

Go to `docs/06-challenges.md`.

---

## Troubleshooting

| Problem | Fix |
|---------|-----|
| Claude does not know the frontmatter rules | Ask it to re-read `CLAUDE.md`. If that fails, `cat CLAUDE.md` into the chat directly. |
| Wiki links render as plain text | Check **Settings -> Files and links -> Use wikilinks** is on. |
| `.claude/skills/` is not picked up | `cd` into the vault root before starting `claude`. Skills resolve relative to the CWD. Confirm `$VAULT/.claude/skills/` exists and is non-empty (the Step 2 copy should have populated it). |
| Obsidian opens on the wrong folder | **File -> Open another vault...** and re-select. |
| Participant wants to sync to iCloud / Dropbox | Fine, but do not sync `.obsidian/workspace*` files - add them to `.gitignore` if using git. |
