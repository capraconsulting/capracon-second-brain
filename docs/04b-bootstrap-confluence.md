# 04b - Bootstrap: Confluence + Claude/ChatGPT via Atlassian Rovo MCP (Path E)

> **For the agent.** Path E participant uses Atlassian Confluence as their knowledge base and Claude (Code, Desktop, or claude.ai) or ChatGPT as their agent. Common in Capra clients that run the Atlassian stack. Target time: 15 minutes.

---

## Goal

By the end of this doc, the participant has:

1. A Confluence space called "Second Brain" with the standard child-page structure
2. Atlassian Rovo MCP (hosted) connected to their agent, or a community MCP fallback if the tenant blocks it
3. The agent has read the conventions from `starter-vault/CLAUDE.md` (adapted for Confluence)
4. One real page saved under `Learning` or `Notes` with labels, properties, and at least 2 inline page links
5. `SETUP.md` in the workshop repo filled in with the space key and committed

---

## Pick your Atlassian setup

Options, ranked easiest to hardest:

| # | Path | What it gives | Hurdle |
|---|------|---------------|--------|
| 1 | **Atlassian Rovo MCP** (hosted, OAuth) | Create / update pages, search, link pages | Tenant must allow Marketplace / third-party app install |
| 2 | **`sooperset/mcp-atlassian`** (community, local install) | Same ops, works on locked tenants and Data Center | Needs `uv` installed, API token, URL |
| 3 | **Raw REST via the agent's HTTP tool** | Create / read / update pages directly | No MCP; agent has to learn the REST shape |

Default to option 1. Fall back to option 2 if Rovo MCP OAuth silently 401s (typical tenant-lockdown symptom). Fall back to option 3 for Atlassian Data Center where Rovo is Cloud-only.

> **No Atlassian account yet?** Atlassian Cloud has a free tier. Create a personal site at <https://www.atlassian.com/try/cloud/signup> before the workshop; that site is where you'll have admin rights and the MCP will "just work". Work tenants often do not allow self-consent.

---

## Step 1: Confluence space setup

In Confluence, create a space called **"Second Brain"** (type: Personal or Team, your call). Inside, create top-level pages that mirror the starter-vault folders:

- `Personal`
- `Projects`
- `Meetings`
- `Learning`
- `Reference`
- `Notes`

Add space **Labels** that stand in for tags: `meeting`, `learning`, `note`, `project`, `draft`, `active`, `archived`.

For structured metadata use **Content Properties** (JSON blobs attached to a page, set via `PUT /wiki/rest/api/content/{id}/property/{key}`) or the **Page Properties macro** (human-readable, reportable via Page Properties Report macro). Either is fine. Recommendation: content properties for agent-written metadata, Page Properties macro for anything humans will query visually.

Map frontmatter to Confluence:

| Frontmatter (Obsidian) | Confluence |
|-----------------------|------------|
| `type` | Label (`meeting`, `learning`, ...) |
| `created` | Auto (page creation timestamp) |
| `tags` | Labels (multi) |
| `related` | Inline page links in the body, or a Page Properties row |
| `status` | Label (`draft`, `active`, `archived`) |
| `source`, `author` | Page properties or a table at the top of the page |

---

## Step 2: Connect Atlassian Rovo MCP (hosted, recommended)

Atlassian operates an official MCP server at `https://mcp.atlassian.com/v1/mcp`. OAuth 2.1, browser consent. **Free on all Atlassian Cloud plans.** Rate limit on Free: 500 calls / hour.

> The old SSE endpoint `https://mcp.atlassian.com/v1/sse` is being deprecated and stops working after **30 June 2026**. Use `/v1/mcp`.

**Claude Code / Claude Desktop / Cursor**: the Atlassian MCP is a remote server, so most clients need the `mcp-remote` proxy. Drop this in `~/Library/Application Support/Claude/claude_desktop_config.json` (Claude Desktop) or the equivalent MCP config for your client:

```json
{
  "mcpServers": {
    "atlassian": {
      "command": "npx",
      "args": ["-y", "mcp-remote@latest", "https://mcp.atlassian.com/v1/mcp"]
    }
  }
}
```

Requires Node.js 18+. First run opens a browser for Atlassian OAuth consent. Pick the site(s) / space(s) the agent should access.

**Claude Code one-liner** (no config file):

```bash
claude mcp add --transport http atlassian https://mcp.atlassian.com/v1/mcp
```

Then run `/mcp` in the session to finish the OAuth flow.

**Tenant-lockdown warning.** The first user in a tenant to consent must have rights to install Marketplace apps. Many Capra clients have this disabled -- the OAuth flow errors with a generic "app not authorized" message. If that happens, jump to Step 2b.

**Ops the Rovo MCP supports**: create page, update page, search (Rovo Search + Fetch semantic), summarize page, list spaces, plus Jira ops you won't need today. Labels and content properties are not called out in the public tool list; fall back to raw REST for those when needed.

---

## Step 2b: Fallback -- community MCP (`sooperset/mcp-atlassian`)

Works on locked-down Cloud tenants and on Atlassian Data Center. MIT-licensed, actively maintained. Requires `uv` and an API token.

1. Install `uv` if needed: `brew install uv`.
2. Create an API token at <https://id.atlassian.com/manage-profile/security/api-tokens> -> **Create API token**. Pick **unscoped** for the workshop to keep URLs simple. Tokens now expire (1-365 days, default 365).
3. Drop into your MCP config:

   ```json
   {
     "mcpServers": {
       "mcp-atlassian": {
         "command": "uvx",
         "args": ["mcp-atlassian"],
         "env": {
           "CONFLUENCE_URL": "https://your-site.atlassian.net/wiki",
           "CONFLUENCE_USERNAME": "you@example.com",
           "CONFLUENCE_API_TOKEN": "ATATT3x..."
         }
       }
     }
   }
   ```

4. Restart the client.

Tools exposed: `confluence_search` (CQL), `confluence_get_page`, `confluence_create_page`, `confluence_update_page`, `confluence_add_comment`, plus ~70 more covering Jira. Auth inherits the user's full CRUD rights (not read-only).

---

## Step 2c: Ultimate fallback -- raw REST

For agents without MCP support or tenants where even `sooperset` is blocked:

- Base URL: `https://your-site.atlassian.net/wiki`
- Auth: HTTP Basic, `Authorization: Basic BASE64(email:token)`
- Create a page: `POST /wiki/api/v2/pages` with `{ "spaceId": "...", "title": "...", "parentId": "...", "body": { "representation": "storage", "value": "..." } }`
- Update requires `"version": { "number": N+1 }` -- common miss.
- Add a label: `POST /wiki/rest/api/content/{id}/label` (v1; labels aren't fully covered in v2 yet).
- Set a content property: `PUT /wiki/rest/api/content/{id}/property/{key}`.

> **v1 vs v2 split is real.** Page CRUD is v2 (`/wiki/api/v2/pages`). Labels, content properties, and CQL search are still v1 (`/wiki/rest/api/...`). Any Confluence agent will mix them. Document this up-front so the agent doesn't spin.

---

## Step 3: Teach the agent the conventions

Create a Confluence page called **"Vault Instructions"** in the "Second Brain" space root. Paste the contents of `starter-vault/CLAUDE.md` and adapt:

- Replace "folder" with "page" or "space"
- Replace `[[wiki links]]` with **inline page links** in Confluence storage format:

  ```xml
  <ac:link><ri:page ri:content-title="Target Page Title"/><ac:link-body>Display text</ac:link-body></ac:link>
  ```

  Omit `ac:link-body` to auto-use the page title. For agents that prefer ADF, use an `inlineCard` block with the page URL.
- Replace YAML frontmatter with labels + content properties (see the mapping table in Step 1)

Then tell the agent:

> *"Read the 'Vault Instructions' page in the Second Brain space and confirm you understand the conventions. Then list the top-level pages you can see."*

Verify the agent can recite:
- Which page types go where (`Learning`, `Meetings`, `Notes`, ...)
- The labels taxonomy
- The linking rule (inline page link, 2-3 per note)

If any answer is wrong, paste the Vault Instructions contents directly into the chat and retry.

---

## Step 4: Write the first real page

Same flow as Path A Step 5. Pick something small. The agent should:

1. Pick the correct parent page based on type (`Learning`, `Meetings`, `Notes`, ...)
2. Create the page with a clear title and a short body
3. Add labels (`learning`, `draft`, plus 1-2 topic tags)
4. Set `source` and `author` content properties (or a Page Properties macro at the top)
5. Include 2-3 inline page links to related pages (create empty stubs if the targets do not exist yet)
6. Confirm with the participant before saving

---

## Step 5: Record where the vault lives

Open `SETUP.md` in this workshop repo and fill in the **Path E** section: base URL, space key, MCP flavor (Rovo hosted / sooperset local / raw REST), and the parent page ID if you are rooting under a specific page. Set `Path: E` at the top and today's date. Delete the other path sections.

```bash
git add SETUP.md
git commit -m "chore: record Path E Confluence coordinates"
```

Push if the participant has their own remote.

> **Why this step matters.** Confluence spaces often live in a tenant the participant doesn't own (client engagement). `SETUP.md` is how the next agent session knows which tenant / space / MCP flavor to target -- none of that is inferable from file system or git state.

---

## Step 6: Hand off to challenges

Go to `docs/06-challenges.md`.

**Challenge 1 (YouTube capture):** agent uses the MCP to create a page under `Learning`. For transcription, either paste the video URL into Claude.ai / ChatGPT (if the model can watch YouTube directly) or run `yt-dlp` locally and paste the transcript.

**Challenge 2 (build skills):** Confluence has no equivalent of Claude Code skills. Create two **Custom Instructions** in Claude.ai or **Saved Prompts** in ChatGPT. See `docs/06-challenges.md` Path-specific notes.

---

## Troubleshooting

| Problem | Fix |
|---------|-----|
| OAuth loops or "app not authorized" on Rovo MCP | Tenant blocks Marketplace installs. Use Step 2b (sooperset + API token). |
| Cloud vs Data Center confusion | Rovo MCP is Cloud-only. For DC, use `sooperset/mcp-atlassian` with a PAT. |
| Agent silently 401s weeks later | API token expired. Tokens default to 365 days (used to be forever). Regenerate. |
| `version` error on page update | v2 `PUT /wiki/api/v2/pages/{id}` requires `"version": {"number": N+1}`. |
| Labels endpoint 404 on v2 | Labels are v1 only. Use `/wiki/rest/api/content/{id}/label`. |
| Storage-format page link doesn't render | Missing namespace declarations. Ensure the agent emits proper `ac:` / `ri:` prefixes. |
| Agent writes HTML, Confluence renders raw text | Storage format is XHTML with namespaces, not plain HTML. Use a markdown-to-storage library or prefer ADF. |
| Rate limited during demos | Free tier is 500 calls/hour. Batch operations; don't spam re-reads. |

---

## Known limitations of Path E

- No Claude Code skills (pptx, docx, youtube-transcribe). Same trade-off as Paths B and C.
- Storage format (XHTML with namespaces) is stricter than markdown. The MCP servers handle it; raw REST requires careful templating.
- Labels are flat per-space. No nested taxonomy. Use multiple labels or content properties for richer structure.
- Spaces are heavy (own permissions, admin). Don't create a new space per folder; nest everything under one "Second Brain" space.
- Cloud-only for Rovo MCP. Data Center users need `sooperset` + PAT.
- API tokens now expire. Set a calendar reminder.
- Tenant lockdown is real and common. Bring a personal Atlassian site as a fallback demo environment if your client tenant blocks the OAuth flow.
