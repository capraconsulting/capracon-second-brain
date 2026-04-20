# 01 - Pick Your Stack

> **For the agent.** Expanded quiz logic behind `START_HERE.md`. Read this if the participant's answers are ambiguous.

## The five paths

| Path | Knowledge base | Agent | When to pick |
|------|----------------|-------|--------------|
| **A** (default) | Obsidian (local markdown) | Claude Code | Personal use, owns the files, wants to match the CapraCon talk setup |
| **B** | Notion | Claude / ChatGPT via Notion MCP | Already deep in Notion, team shares databases, cloud-first |
| **C** | M365 SharePoint / OneDrive | GitHub Copilot (M365) | Enterprise-locked on M365, no local install, client context |
| **D** | Plain folder of `.md` files | Any agent (Cursor, Windsurf, Cline, Codex, Copilot) | Does not want lock-in, wants to switch agents freely |
| **E** | Confluence (Atlassian Cloud / DC) | Claude / ChatGPT via Atlassian Rovo MCP | Client or team already runs the Atlassian stack |

---

## Decision tree

```
Does the participant / their client run Atlassian (Confluence / Jira)?
|
+-- Yes -> Path E (Confluence + Rovo MCP)
|
+-- No
    |
    +-- Can the participant install software / write to their local disk?
        |
        +-- No  -> Path C (SharePoint + Copilot)
        |
        +-- Yes
            |
            +-- Do they already use Notion heavily?
            |   |
            |   +-- Yes -> Path B (Notion)
            |   |
            |   +-- No
            |
            +-- Do they want a specific agent (Cursor / Windsurf / etc.)?
                |
                +-- Yes -> Path D (plain markdown)
                |
                +-- No  -> Path A (Obsidian + Claude Code)  <-- default
```

---

## Common edge cases

- **"I want to use Notion but also Claude Code."** Path B. The Notion MCP lets Claude read / write Notion pages, so the agent is Claude but the KB is Notion.
- **"I want Obsidian but not Claude."** Path A for the vault structure, Path D for the agent wiring. You can do both: point them at `docs/02-bootstrap-obsidian.md` for the vault, then `docs/05-bootstrap-plain.md` section 3 for the agent config.
- **"I want everything in one file for now."** Fine. Start with Path D, drop a single `notes.md` in the repo, and build from there.
- **"I do not have 30 minutes to set anything up."** Path D. Copy `starter-vault/` to anywhere they have write access and point their agent at it. Done in under 5 minutes.
- **"My client runs Confluence but my work laptop blocks Marketplace apps."** Path E Step 2b -- use the community `sooperset/mcp-atlassian` MCP with an API token. Works on locked-down tenants and on Confluence Data Center.
- **"We use Confluence *and* SharePoint."** Pick the one the participant lives in day-to-day. Both paths end with the same conceptual setup; the skills transfer.

---

## What they get regardless of path

All five paths end with the same conceptual setup:

1. A knowledge base with the standard folders (`Personal/`, `Projects/`, `Meetings/`, `Learning/`, `Reference/`, `Notes/`)
2. Frontmatter conventions (see `starter-vault/CLAUDE.md`)
3. An agent that has read the conventions and will follow them
4. At least one real note saved and linkable

After that, every path does Challenge 1 and Challenge 2 from `docs/06-challenges.md` the same way.

---

## After picking

Confirm the choice with the participant, then route to:

- A -> `docs/02-bootstrap-obsidian.md`
- B -> `docs/03-bootstrap-notion.md`
- C -> `docs/04-bootstrap-sharepoint.md`
- E -> `docs/04b-bootstrap-confluence.md`
- D -> `docs/05-bootstrap-plain.md`
