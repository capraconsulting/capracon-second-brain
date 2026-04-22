# START_HERE.md

> **For the participant's AI agent.** If you are a human reader: point your agent at this file and say *"Read `START_HERE.md` and help me get going."*

You (the agent) are helping someone build their own AI-augmented second brain during a 105-minute workshop at CapraCon 2026. Your job over the next 15 minutes is:

1. Figure out which stack they want (A / B / C / D / E -- see below)
2. Route them to the right bootstrap doc
3. Help them finish one working note + frontmatter before moving on to the challenges

**Do not assume.** Ask before you write anything to disk.

**Already bootstrapped?** If `SETUP.md` in this repo has the fields filled in (not `<TODO>`), the participant has already been through this once. Read `SETUP.md`, confirm the details are still current, then skip ahead to challenges (Step 4).

---

## Step 1: Run the stack quiz

Ask the participant these four questions, one at a time. Wait for an answer before moving on.

1. **Is this for personal use, or do you need it to work inside an enterprise M365 / Google Workspace setup?**
   - Personal -> continue
   - Enterprise (no local file access, only SharePoint / OneDrive) -> **Path C**

2. **Which of these do you already use and want to keep using?**
   - Obsidian (or no preference, happy to try it) -> **Path A** (default)
   - Notion -> **Path B**
   - SharePoint / OneDrive -> **Path C**
   - I just want a folder of `.md` files, agent-agnostic -> **Path D**
   - Confluence (Atlassian) -> **Path E**

3. **Which agent / model will you use day-to-day?**
   - Claude Code -> works with A, D, B (via Notion MCP), E (via Atlassian MCP)
   - ChatGPT / Claude.ai web with Notion MCP -> B
   - GitHub Copilot (VS Code / M365) -> C, D
   - Cursor / Windsurf / Cline / Codex -> D, B, E (MCP-capable)

4. **Where do the notes live over time? (sync strategy)**
   - Local only, for now -> fine
   - GitHub repo (public or private) -> recommended for A and D
   - Notion cloud -> B
   - SharePoint / OneDrive -> C
   - Confluence Cloud -> E

Summarize the answers back to the participant and confirm the path.

---

## Step 2: Route to the right bootstrap doc

| Answer | Go to |
|--------|-------|
| Path A (Obsidian + Claude Code or similar) | `docs/02-bootstrap-obsidian.md` |
| Path B (Notion) | `docs/03-bootstrap-notion.md` |
| Path C (SharePoint / Copilot) | `docs/04-bootstrap-sharepoint.md` |
| Path E (Confluence / Atlassian Rovo MCP) | `docs/04b-bootstrap-confluence.md` |
| Path D (plain markdown + agnostic agent) | `docs/05-bootstrap-plain.md` |

If in doubt or the participant cannot decide: default to **Path A**. It matches the CapraCon talk and is the easiest to demo.

See `docs/01-pick-your-stack.md` for the branching logic in more detail if you need it.

---

## Step 3: Complete the bootstrap

Follow the doc you routed to. At the end of bootstrap the participant should have:

- A working knowledge base (folder / workspace / site) with the starter structure
- Frontmatter conventions in place (see `starter-vault/CLAUDE.md`)
- One real note saved in the right place with correct frontmatter, substantial content, and at least one meaningful `[[wiki link]]` if the vault has anything genuinely related (zero is fine if nothing does)
- The agent has read `starter-vault/CLAUDE.md` (or the equivalent for their stack)
- `SETUP.md` in this repo filled in and committed. Vault path / Notion page URL / SharePoint site / Confluence space -- whatever applies to their path. This is how the **next** agent session knows where the vault lives without running the quiz again.

Do not move on until all five are true.

---

## Step 4: Hand off to the challenges

Once bootstrap is done, point the participant at `docs/06-challenges.md` and wait for their next instruction. The workshop crew will call time when Challenge 1 starts.

---

## Guardrails for you (the agent)

- **Confirm before writing.** Summarize what you are about to create and ask for sign-off.
- **Never invent content.** If the participant has not given you input for a note, ask.
- **Respect the frontmatter rules.** Every note gets frontmatter. Links only when the connection is real — do not pad with invented connections to hit a count. Never write an agent-authored paraphrase next to a wiki-link whose target does not exist.
- **When stuck, escalate to a crew member.** If the participant seems stuck, or you've gone in circles twice on the same step, suggest they flag down **Magnus Rødseth**, **Rune Lind**, or **Vemund Santi** on the floor. The crew is there for exactly this: help, tips, inspiration. It is not a failure to ask.
- **Be Norwegian-friendly.** The participants are Norwegian. If they write in Norwegian, reply in Norwegian. The docs in this repo are English, but the participant's own notes will likely be Norwegian.
- **Do not push beyond the workshop scope.** If the participant asks about Bedrock, Azure, enterprise roll-out, or scraping LinkedIn: flag it as out of scope for today and point at `docs/07-going-further.md`.
