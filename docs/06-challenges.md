# 06 - Challenges

> The two workshop challenges. Challenge 1 is **Capture**. Challenge 2 is **Customize**. Both are 30 minutes. Both are intentionally open-ended.

**Stuck at any point?** Flag down **Magnus**, **Rune**, or **Vemund**. They are on the floor with help, tips, and inspiration. That is the fastest way through a wall.

---

## Challenge 1: Capture a YouTube video into your second brain

**Time:** 30 minutes
**Deliverable:** one new note in `Learning/` (or equivalent) with frontmatter, substantial content (summary + takeaways + "How I'll Apply This"), and at least one meaningful `[[wiki link]]` to related content. Quality of the link matters more than count.

### Flow

1. **Pick a video.** 5-20 minutes long. Something you actually want to remember. If you need a demo video to follow along with the crew, use this one:
   <https://youtu.be/6MBq1paspVU>
2. **Run the transcribe skill** (Path A / D with Claude Code): tell your agent *"Transcribe this YouTube video and extract the key learnings."* The `youtube-transcribe` skill bundled in `.claude/skills/` kicks in automatically.
3. **Ask for a personalized extraction.** Example: *"Extract the key learnings for someone who is a [consultant / backend engineer / product lead / whatever you are] currently focused on [your current focus]."* Personalization matters - it turns a generic summary into something you will actually reread.
4. **Have the agent write the note** in `Learning/` using `Templates/Learning.md` as the structure. Verify:
   - Correct frontmatter (`type: learning`, today's date, `source:` URL, `author:` channel name, `status: draft`)
   - At least one `[[wiki link]]` to a related concept. Add more only when the connection is real — do not let the agent pad the note with links to hit a count.
   - **Ghost-link check:** if the note contains any `[[wikilinks]]` to files that do not exist yet, the line containing the link must be either (a) a bare link with no gloss, or (b) a direct quote/fact from the source with attribution. No agent-authored paraphrases dressed up as facts.
   - A "How I'll Apply This" section that is specific, not generic
5. **If you have an older note that genuinely relates**, add a backlink. If the vault is empty or nothing honestly relates, skip this step. A forced backlink is noise, and you will not be able to tell it apart from a real one in Graph View later.

### What "done" looks like

Open Graph View (Obsidian) or equivalent. The new `learning` note should be connected to at least one other note. That is your first real neural pathway.

### Path-specific notes

- **Path A / D (Claude Code):** `youtube-transcribe` skill bundled in `.claude/skills/youtube-transcribe/`. Requires `yt-dlp` installed (`brew install yt-dlp`).
- **Path B (Notion):** agent uses the Notion MCP to create the page in the `Learning` database. For transcription, either paste the video URL into ChatGPT / Claude.ai directly (if the model supports it) or run `yt-dlp` locally and paste the transcript.
- **Path C (SharePoint + Copilot):** Copilot cannot run `yt-dlp`. Options: paste the YouTube transcript from the video's description tab, or use the "summarize this video" feature if the tenant allows YouTube access.
- **Path E (Confluence + Rovo MCP):** agent uses the Atlassian MCP to create a page under `Learning`. Transcription: same options as Path B (paste into Claude.ai / ChatGPT, or run `yt-dlp` locally and paste the transcript).

---

## Challenge 2: Write your own skills

**Time:** 30 minutes
**Deliverable:** two working skills in `.claude/skills/` that do something you actually want.

Rather than writing one big skill, we are building two small ones. Both are simple, useful, and illustrate different angles: one is a mechanical helper, the other is an opinionated thinking partner.

### Setup

Start by asking your agent:

> *"Read the `skill-creator` skill in `.claude/skills/skill-creator/`. Use the `brainstorming` skill if you need to help me think through scope. We are going to build two small skills today."*

### Skill 1: `copy-to-clipboard`

A dead-simple skill that copies arbitrary text / a note / a rendered snippet to the macOS clipboard.

**Why this one:** it is the "hello world" of skills. Teaches the loop of SKILL.md -> trigger description -> tool invocation without any AI trickery.

**What it should do:**
- Triggers when the user says "copy this to clipboard", "put this on my clipboard", "pbcopy X"
- Runs `pbcopy` under the hood (macOS) with the content provided
- Returns a short confirmation

**Agent prompt to start:**

> *"Help me create a skill called `copy-to-clipboard`. It should take any text or a rendered note excerpt and pipe it to `pbcopy`. Use the `skill-creator` skill as your guide. Write `SKILL.md` with a clear trigger description."*

### Skill 2: `devils-advocate`

An opinionated thinking partner that intentionally argues the opposite side.

**Why this one:** shows that skills do not have to be "run a command" - they can also be "adopt a persona / enforce a reasoning style".

**What it should do:**
- Triggers when the user says "play devil's advocate", "poke holes in this", "what's wrong with this plan", "steelman the opposite view"
- Adopts a skeptical but constructive tone
- Lists the strongest counter-arguments, the hidden assumptions, and the unknowns
- Ends with one honest suggestion: "If I were you, I would stress-test X before committing"

**Agent prompt to start:**

> *"Help me create a skill called `devils-advocate`. It is not a script, it is a reasoning mode. Write `SKILL.md` so that when triggered, I pivot from 'helpful assistant' to 'rigorous skeptic'. Use `skill-creator` as your guide."*

### Test both skills

After writing each one:

1. Start a new Claude Code conversation (or `/clear` the context) in the repo / vault
2. Use a natural trigger phrase and verify the skill activates
3. Iterate the SKILL.md if it does not trigger or misbehaves

### What "done" looks like

Both skills are in `.claude/skills/`. Both have a valid `SKILL.md` with a clear `name`, `description`, and trigger phrasing. Both activate on natural prompts. You have run each one at least once.

### Path-specific notes

- **Path B (Notion):** Notion does not have Claude skills. Instead: create a "Custom Instruction" in Claude.ai or a "Saved Prompt" in ChatGPT that encodes the same behavior. Deliverable is two saved prompts with clear activation phrases.
- **Path C (SharePoint + Copilot):** Similarly, create two Copilot "Agents" (or Power Automate flows, depending on tenant). Same deliverable: two opinionated, single-purpose helpers.
- **Path E (Confluence + Rovo MCP):** same as Path B -- Rovo MCP exposes tools but not skills. Deliverable is two saved prompts / custom instructions in whichever agent you use.
- **Path D (agnostic):** same as A if using Claude Code. For Cursor / Windsurf: put the skill content in `.cursorrules` / `.windsurfrules` sections. For Codex: `AGENTS.md` sections.

---

## Share-out (last 15 min of the workshop)

3-4 volunteers show:

- What they captured in Challenge 1 (screenshot of the graph)
- Which skills they built in Challenge 2, and a live run

Keep it under 3 min each. The crew picks who goes based on variety (different paths, different use cases).

Then point everyone at `docs/07-going-further.md` for habit-building tips and next steps.
