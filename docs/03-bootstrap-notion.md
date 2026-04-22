# 03 - Bootstrap: Notion + Claude/ChatGPT via Notion MCP (Path B)

> **For the agent.** Path B participant picked Notion as their knowledge base and Claude (Code, Desktop, or claude.ai) or ChatGPT as their agent. Target time: 15 minutes.

---

## Goal

By the end of this doc, the participant has:

1. A Notion workspace with a "Second Brain" parent page and the standard sub-structure
2. Notion MCP connected to their agent (hosted, OAuth-based, no tokens)
3. The agent has read the conventions from `starter-vault/CLAUDE.md` (adapted for Notion)
4. One real page saved in `Learning` or `Notes` with the right properties and at least 2 `@page` mentions
5. `SETUP.md` in the workshop repo filled in with the Notion parent page URL and committed

---

## Step 1: Notion workspace setup

**Before doing anything else, get the parent page URL from the participant.** Ask:

> *"Paste the Notion share link to the page you want to use as the root of your Second Brain. If you do not have one yet, create a top-level page in Notion called 'Second Brain' (or whatever you want) and share the link."*

You will need this URL both for creating the sub-structure via MCP and for filling in `SETUP.md` at the end.

Ask the participant to open Notion and create a top-level page called **"Second Brain"** (or whatever they want). Inside it, create:

- `Personal` (plain page, child pages for anything private)
- `Projects` (plain page, one child per active project)
- `Meetings` (**database**, schema below)
- `Learning` (**database**, schema below)
- `Reference` (plain page, child pages for docs / cheatsheets / links)
- `Notes` (plain page, child pages for loose notes)

Recommendation: use Notion databases for `Learning` and `Meetings` (where structured queries matter). Plain pages are fine everywhere else.

### Source of truth for taxonomy

All `type`, `status`, and `tag` values come from `starter-vault/CLAUDE.md`. **This applies to every path.** Each path just encodes the same taxonomy in its native primitives (YAML frontmatter / Notion select / SharePoint Choice / Confluence label). Do not invent values; if something is missing from `starter-vault/CLAUDE.md`, fix it there first and propagate.

### Meetings database schema

Each row is one meeting. Meetings do not carry a `status` field per `starter-vault/CLAUDE.md`.

| Property | Type | Options |
|----------|------|---------|
| `Meeting` | Title | (title column) |
| `type` | Select | `meeting` |
| `date` | Date | -- |
| `attendees` | Multi-select | (empty; add people as they appear) |

### Learning database schema

Each row is one book / article / video / course / podcast takeaway.

| Property | Type | Options |
|----------|------|---------|
| `Title` | Title | (title column) |
| `type` | Select | `learning` |
| `source` | URL | -- |
| `author` | Text | -- |
| `status` | Select | `draft`, `active`, `completed` (matches the `learning` type in `starter-vault/CLAUDE.md`) |
| `tags` | Multi-select | pre-populate: `source/book`, `source/article`, `source/video`, `source/podcast`, `source/course`. Notion flattens hierarchical tags; keep the slash syntax so the `#source/*` convention from the starter vault still reads clearly. |

> **Why single-option selects?** `type = meeting` / `type = learning` look redundant (every row has the same value). Keep them anyway: they map 1:1 to the `type` frontmatter field, which makes cross-vault search and future migrations (e.g. Notion -> plain markdown) trivial.

### Frontmatter <-> Notion mapping

| Frontmatter (Obsidian) | Notion property |
|-----------------------|-----------------|
| `type` | Select |
| `created` | Created time (auto) |
| `tags` | Multi-select |
| `related` | Relation to other pages |
| `status` | Select |
| `source`, `author` | URL, Text |

---

## Step 2: Connect Notion MCP (hosted, recommended)

Notion runs a hosted MCP server at `https://mcp.notion.com/mcp`. OAuth handles auth. **No integration token, no `npx` install, no JSON editing.** The old local-install path still works but Notion has flagged it for deprecation.

**Claude Code** (one command, no config file):

```bash
claude mcp add --transport http notion https://mcp.notion.com/mcp
```

> **Important:** Claude Code reads MCP config at startup. After running this command you **must restart Claude Code** before the server is available.
>
> To resume this session after restart, run:
> ```bash
> claude --continue
> ```
> This picks up the most recent conversation so you do not have to re-run the stack quiz.

Once restarted, run `/mcp` inside the session and complete the OAuth flow in the browser. Notion will ask which pages to grant access to -- pick the **"Second Brain"** parent page (or the whole workspace). Add `--scope user` to the original `mcp add` command if you want it available across all projects, not just this one.

**Claude Desktop** (claude.ai app): Settings -> **Connectors** -> add Notion. The connector is built in.

> Requires Claude Pro / Max / Team / Enterprise. Free Claude Desktop accounts cannot add remote MCP connectors. If the participant is on a free plan, either switch to Claude Code (handles OAuth on any plan) or jump to Step 2b.

**ChatGPT**: Settings -> **Connectors** -> enable Notion (Plus / Pro / Business / Enterprise). Same OAuth flow, same result. ChatGPT can search, read, and create Notion pages without MCP at all.

**Cursor**: `~/.cursor/mcp.json`:

```json
{
  "mcpServers": {
    "notion": {
      "url": "https://mcp.notion.com/mcp"
    }
  }
}
```

---

## Step 2b: Fallback -- local MCP server

Only needed for free-tier Claude Desktop users, or if the participant explicitly wants the self-hosted route.

1. Create an internal integration at <https://www.notion.so/profile/integrations> -> **New integration**. Capabilities: Read, Insert, Update content. Copy the `ntn_...` secret.
2. In Notion, open the **"Second Brain"** parent page -> three-dot menu -> **Connections** -> pick the integration. **This step is the single most common cause of "no pages found" errors.**
3. Drop this into `~/Library/Application Support/Claude/claude_desktop_config.json`:

   ```json
   {
     "mcpServers": {
       "notionApi": {
         "command": "npx",
         "args": ["-y", "@notionhq/notion-mcp-server"],
         "env": {
           "NOTION_TOKEN": "ntn_paste_the_token_here"
         }
       }
     }
   }
   ```

4. Restart Claude Desktop.

---

## Step 3: Teach the agent the conventions

Copy the contents of `starter-vault/conventions-notion.md` into a Notion page called **"Vault Instructions"** inside the "Second Brain" parent. This file is the Notion-adapted sibling of `starter-vault/CLAUDE.md` -- terminology (page / database), linking (`@page` mentions), and properties are already translated.

Then tell the agent:

> *"Read the 'Vault Instructions' page in my Notion workspace and confirm you understand the conventions. Then list the top-level pages you can see under 'Second Brain'."*

Verify the agent can recite:
- Which page types go where (`Learning`, `Meetings`, `Notes`, ...)
- The property schema for `Learning` and `Meetings` databases
- The linking rule: 2-3 `@page` mentions per note

If any answer is wrong, paste the Vault Instructions contents directly into the chat before proceeding.

---

## Step 4: Write the first real page

Same flow as Path A Step 5. Pick something small the participant actually wants to remember. The agent should:

1. Pick the correct destination (a `Learning` database entry, a new `Meetings` row, a plain page under `Notes`, etc.)
2. Fill in properties with today's date and the right `type`, `status`, `tags`
3. Add 2-3 `@page` mentions to related pages (create empty stubs if the targets do not exist yet)
4. Confirm with the participant before writing

---

## Step 5: Record where the vault lives

Open `SETUP.md` in this workshop repo and fill in the **Path B** section: parent page URL, parent page ID (the 32-character hex string in the URL), workspace, MCP transport, and the databases you created. Set `Path: B` at the top and today's date. Delete the other path sections.

Commit it:

```bash
git add SETUP.md
git commit -m "chore: record Path B Notion coordinates"
```

Push if the participant has their own remote.

> **Why this step matters.** Without `SETUP.md`, the next agent session you start has no idea which Notion page is your root and will run you through the stack quiz again.

---

## Step 6: Hand off to challenges

Go to `docs/06-challenges.md`.

Challenge 1 (YouTube capture) works via the Notion MCP: the agent creates a page in the `Learning` database with the transcript summary. For the transcription itself, either paste the video URL into Claude.ai / ChatGPT (if the model can watch YouTube directly) or run `yt-dlp` locally and paste the transcript.

Challenge 2 (build skills) needs adaptation: Notion has no equivalent of Claude Code skills. Create two **Custom Instructions** in Claude.ai or **Saved Prompts** in ChatGPT that encode the same behavior. See `docs/06-challenges.md` Path-specific notes.

---

## Troubleshooting

| Problem | Fix |
|---------|-----|
| `/mcp` says "No MCP servers configured" | Claude Code was not restarted after `claude mcp add`. Quit and reopen, then `claude --continue` to resume. |
| "No Notion pages found" (local MCP) | Integration not shared with the parent page. Open the page in Notion -> Connections -> add the integration. |
| OAuth loop in Claude Code | Stale session. `claude mcp remove notion` and re-add, then restart. |
| Remote connector option missing in Claude Desktop | Free plan. Upgrade, or use Claude Code instead. |
| `unauthorized` / 401 (local MCP) | Token is wrong, missing `ntn_` prefix, or was regenerated. Paste the current one from <https://www.notion.so/profile/integrations>. |
| Agent creates pages in the wrong place | The conventions doc was not loaded. Paste "Vault Instructions" directly into the chat and retry. |
| Agent fails to set database properties | Property names are case-sensitive. Ask the agent to inspect the database schema first, then retry. |

---

## Known limitations of Path B

- No local Claude Code skills (`youtube-transcribe`, `skill-creator`, `brainstorming`, `obsidian-vault`, or any Office skills installed via `skills` CLI). Use ChatGPT / Claude.ai features or run CLI tools manually and paste.
- Backlinks are implicit (via `@page` mentions) rather than a two-way wiki-link graph. Notion's "Backlinks" panel on each page shows the inverse.
- Local-first users lose the "works offline, lives in my git repo" property of a plain markdown vault.
- Team workspaces are shared by default. Consider a personal workspace for the `Personal/` page.
