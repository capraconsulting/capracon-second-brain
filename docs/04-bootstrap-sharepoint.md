# 04 - Bootstrap: SharePoint / OneDrive + Copilot (Path C)

> **For the agent.** Path C participant is enterprise-locked. They cannot install software, cannot register an Entra app on their own, and often cannot even run a local MCP client. Everything has to work through what the client tenant already gives them. Target time: 15 minutes.

---

## Reality check before you start

Path C is the most constrained of the four. Rank the options from easiest to hardest and pick the first one the participant can actually do:

| # | Path | What it gives | License / admin hurdle |
|---|------|---------------|------------------------|
| 1 | **M365 Copilot Chat + SharePoint grounding** (browser) | Read + draft, manual save | Needs M365 Copilot license |
| 2 | **Declarative agent scoped to a SharePoint site** (Agent Builder) | Read + draft with custom instructions | Copilot license + agent extensibility enabled |
| 3 | **Work IQ SharePoint MCP server** (Microsoft, preview) | Full CRUD on sites / libraries / lists, 5 MB file cap | Tenant admin must grant `MCP.*` scopes in Entra |
| 4 | **GitHub Copilot in VS Code + local clone of the site** | Full local control, manual sync back | Needs VS Code install + ability to clone |

Options 3 and 4 require software install or admin consent. Many client consultants cannot do either. Default to **option 2**, fall back to option 1 if extensibility is blocked, and flag options 3 / 4 as "ask your architect".

> **Naming heads-up.** "Azure AD" is now **Microsoft Entra ID**. "Teams Toolkit" is now **Microsoft 365 Agents Toolkit**. The old Azure AD Graph API is fully retired -- use **Microsoft Graph**. The CLI `msgraph-cli` (`mgc`) was archived in August 2025; do not recommend it. For scripting, use Microsoft Graph PowerShell or the Graph SDKs.

---

## Goal

By the end of this doc, the participant has:

1. A SharePoint site (or OneDrive folder) with the standard structure and metadata columns
2. Either a declarative Copilot agent or an MCP-connected agent that knows the conventions
3. The conventions doc from `starter-vault/CLAUDE.md` (SharePoint-adapted) saved in the site
4. One real document saved in `Learning` or `Notes` with the right metadata columns and at least 2 internal links
5. `SETUP.md` in the workshop repo filled in with the site URL and committed

---

## Step 1: SharePoint site setup

Create a SharePoint **communication site** called "Second Brain" (or per client naming convention). Inside, create one **document library** per folder:

- `Personal` (optional, private library)
- `Projects`
- `Meetings`
- `Learning`
- `Reference`
- `Notes`
- `Attachments`

> If creating a site is blocked, fall back to a OneDrive folder tree with subfolders. The agent flows below still work; metadata columns become OneDrive tags (less powerful, but fine for a workshop).

On each library, add metadata columns (Library Settings -> **Create column**):

| Column | Type | Purpose |
|--------|------|---------|
| Type | Choice | See **Type values** below |
| Tags | Choice (multi) or Managed Metadata | See **Tag values** below |
| Status | Choice | See **Status values** below |
| Related | Lookup (to this library) | Cross-links between documents (the closest thing to `[[wiki links]]`) |

`Created` and `Modified` are auto-populated by SharePoint; do not try to set them.

### Source of truth for taxonomy

All `Type`, `Status`, and `Tag` values come from `starter-vault/CLAUDE.md`. **This applies to every path.** Each path just encodes the same taxonomy in its native primitives (YAML frontmatter / Notion select / SharePoint Choice / Confluence label). Do not invent values; if something is missing from `starter-vault/CLAUDE.md`, fix it there first and propagate.

**Type values** (full set -- add the subset each library needs):

`note`, `project`, `meeting`, `daily`, `resource`, `person`, `decision`, `learning`, `how-to-guide`, `brag`

**Status values** (full set; depends on the type):

`draft`, `active`, `planning`, `on-hold`, `completed`, `archived`

- `learning`: `draft | active | completed`
- `project`: `planning | active | on-hold | completed | archived`
- `decision`: `active`
- other types: no status field

**Tag values** (pre-populate these; add more as the vault grows):

- Source: `source/book`, `source/article`, `source/video`, `source/podcast`, `source/course`
- Status tags: `status/todo`, `status/in-progress`, `status/done`, `status/waiting`
- Area: `area/work`, `area/health`, `area/finance`

SharePoint Choice columns are flat, so keep the slash syntax literally as the option value -- that way the `#tag/sub` convention from the starter vault still reads clearly.

> **Column-naming gotcha.** SharePoint keeps the *display name* but Graph / MCP use the *internal name* (no spaces, set at creation). "Full Name" becomes `FullName` or similar. Check with `listColumns` before asking the agent to set fields.

File format: `.md` works if the agent can render it, but `.docx` is more natural for enterprise users and renders in the browser without plugins. Pick one and stick to it.

---

## Step 2a (default): Declarative Copilot agent

A declarative agent is a JSON manifest plus instructions, scoped to your SharePoint site as a knowledge source. It lives in M365 Copilot Chat.

1. Open **M365 Copilot Chat** (`copilot.microsoft.com` or the Teams app) -> **Create agent** (Agent Builder).
2. Name: **Second Brain**. Description: a short sentence.
3. **Instructions**: paste the adapted conventions (see Step 3 below).
4. **Knowledge**: add your SharePoint site URL as a knowledge source. Agent Builder accepts site URLs, specific libraries, or specific pages.
5. **Publish**: to yourself (personal use). Optionally pin to the Copilot sidebar.

Official doc: <https://learn.microsoft.com/en-us/microsoft-365-copilot/extensibility/overview-declarative-agent>
Knowledge source setup: <https://learn.microsoft.com/en-us/microsoft-365/copilot/extensibility/agent-builder-add-knowledge>

> **Autonomous writes are limited.** Declarative agents primarily ground (read). For "agent creates a new note and saves it to the library without me clicking Save", you need either the Work IQ SharePoint MCP server (Step 2c) or a Copilot Studio action. For the workshop, treat the declarative agent as "draft + you save".

---

## Step 2b (fallback): plain M365 Copilot Chat

If Agent Builder is blocked by tenant policy:

1. In Copilot Chat, switch to **Work** mode. Grounding on SharePoint is on by default for licensed users.
2. Upload the adapted conventions doc (Step 3) to the site so Copilot can find it.
3. Kick off every session with: *"Use the conventions in the 'Conventions' document in the Second Brain site when drafting or organizing notes."*

This is the most constrained option but works on any Copilot-licensed account with zero admin involvement.

---

## Step 2c (power-user): Work IQ SharePoint MCP server

Only pursue this with an architect or tenant admin. Full CRUD on sites, libraries, files, lists, list items, columns, sharing. **5 MB file-size cap.**

```powershell
# One-time tenant enablement (run by an Application Administrator)
Install-Module Microsoft.Entra.Beta -Force -AllowClobber
Connect-Entra -Scopes 'Application.ReadWrite.All','Directory.Read.All','DelegatedPermissionGrant.ReadWrite.All'
Grant-EntraBetaMCPServerPermission -ApplicationName VisualStudioCode
```

Then install the server into VS Code via the Copilot Chat "Install MCP" flow. Auth is delegated only. Scopes follow the pattern `MCP.Sites.ReadWrite.All`, `MCP.Files.ReadWrite.All`, etc. Official docs:

- <https://learn.microsoft.com/en-us/graph/mcp-server/overview>
- <https://learn.microsoft.com/en-us/microsoft-agent-365/mcp-server-reference/sharepoint>

> The older "SharePoint lists tools" MCP server was deprecated 2026-03-13. Use **Work IQ SharePoint** (`mcp_SharePointRemoteServer`).

---

## Step 3: Teach Copilot the conventions

Copy the contents of `starter-vault/conventions-sharepoint.md` into a **SharePoint page** or a `.docx` in the site root, titled **"Conventions"**. This file is the SharePoint-adapted sibling of `starter-vault/CLAUDE.md` -- terminology (library), linking (sharing URL / Related lookup), and metadata (Choice columns) are already translated.

Test: in Copilot Chat (or the declarative agent), ask:

> *"Summarize the conventions in the 'Conventions' doc and list the libraries in the Second Brain site."*

Verify the agent can recite the library layout, the column schema, and the linking rule (sharing URL or Related lookup, 2-3 per note).

---

## Step 4: Write the first real document

Same flow as Path A Step 5. Pick something small. The agent should:

1. Pick the correct library based on type (`Learning`, `Meetings`, `Notes`, ...)
2. Produce a short document (markdown or Word) following the convention
3. Set the metadata columns (Type, Tags, Status, Related)
4. Include 2-3 links to other documents in the site (sharing URLs) or a Related lookup entry
5. Confirm with the participant before saving

If using the declarative agent (Step 2a) or plain Copilot (Step 2b), the agent drafts and the participant clicks "Save to SharePoint" or copies into a new doc in the right library.

---

## Step 5: Record where the vault lives

Open `SETUP.md` in this workshop repo and fill in the **Path C** section: site URL, document library, declarative agent name (if any), and whether extensibility is blocked. Set `Path: C` at the top and today's date. Delete the other path sections.

```bash
git add SETUP.md
git commit -m "chore: record Path C SharePoint coordinates"
```

Push if the participant has their own remote.

> **Why this step matters.** Enterprise setups churn. Tenant URLs change, agents get renamed, libraries get reorganized. `SETUP.md` is the one place the next agent session can look to get current.

---

## Step 6: Hand off to challenges

Go to `docs/06-challenges.md`.

**Challenge 1 (YouTube capture):** Copilot cannot run `yt-dlp`. Options:
- Paste the YouTube transcript from the video's transcript panel, then ask Copilot to summarize and save into `Learning`.
- If the tenant allows YouTube access, use the "summarize this video" web action in Copilot.

**Challenge 2 (build skills):** No Claude-style skills in Copilot. Create **two Copilot agents** (or Power Automate flows) that encode single-purpose behaviors. Deliverable is the same: two opinionated, single-purpose helpers. See `docs/06-challenges.md` Path-specific notes.

---

## Troubleshooting

| Problem | Fix |
|---------|-----|
| Copilot cannot see the site | Check site permissions. Copilot enforces the user's existing SharePoint permissions; it cannot grant itself access. |
| "Create agent" / Agent Builder is missing | Tenant has disabled agent extensibility. Fall back to Step 2b (plain Copilot Chat). |
| No grounding on SharePoint at all | No M365 Copilot license, or account is in Copilot Chat free (which does not ground on your tenant's SharePoint). |
| `mgc` / msgraph-cli command not found | The CLI was archived August 2025. Use Microsoft Graph PowerShell (`Microsoft.Graph` module) or the Graph SDKs instead. |
| MCP install prompt asks for admin consent | Correct behavior. `MCP.*` scopes require an Application Administrator. Ask an architect. |
| Agent sets the wrong field | SharePoint column internal name does not match the display name. Have the agent list the columns first, then map display -> internal names. |
| Managed-metadata column rejects a string | Managed-metadata (term-store) columns want term GUIDs, not strings. Switch to a plain Choice column unless the tenant needs managed terms. |

---

## Known limitations of Path C

- No Claude Code skills (pptx, docx, youtube-transcribe). Closest equivalents are Copilot agents or Power Automate flows, both more limited.
- Autonomous writes require either the Work IQ MCP server (admin consent) or Copilot Studio actions (extra license). Default path is "agent drafts, user saves".
- `[[wiki links]]` do not exist natively. The Modern SharePoint replacement is sharing URLs or Related lookup columns; the graph is implicit.
- File-size cap of 5 MB on the SharePoint MCP server. Large PDFs will not flow through it.
- GCC-High and DoD tenants: declarative agents are unsupported. GCC has limited support.
- Conditional Access / device compliance can block the MCP or declarative agent auth flow even when the web UI works.

Flag these limits upfront so the participant knows what they are trading off.
