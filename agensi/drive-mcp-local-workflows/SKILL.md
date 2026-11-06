---
name: drive-mcp-local-workflows
description: Plan and execute Google Drive, Docs, Sheets, Slides, and Calendar tasks through a locally connected Drive MCP Local (or compatible self-hosted Google Workspace MCP). Use when the user asks to search or organize Drive, read or edit Docs/Sheets/Slides, export or share files, manage Calendar events, or run multi-step Workspace workflows with local OAuth.
summary: Agent playbooks for Drive MCP Local — safe search-first workflows, folder targeting, verification, and Calendar handoffs without guessing file IDs.
version: "1.0.0"
tags:
  - google-drive
  - google-workspace
  - mcp
  - productivity
keywords:
  - drive
  - docs
  - sheets
  - slides
  - calendar
  - local oauth
use_cases:
  - Organize Drive folders and move or rename files in bulk
  - Create or update Docs, Sheets, and Slides from structured content
  - Export PDFs and verify rendered output
  - Attach Drive files to Calendar events
docs_url: https://github.com/jinukahn98-lab/drive-mcp-privacy
license: Proprietary (LICENSE.txt)
compatibility: Requires a connected MCP client and an installed Drive MCP Local (or compatible) server with completed Google OAuth on the user's machine. Network use is only through the user's MCP tools to Google APIs, not through this skill package.
---

# Drive MCP Local workflows

This skill teaches **how** an agent should use a **locally connected** Google Workspace MCP (intended product name: **Drive MCP Local**). It does **not** install the MCP server, store OAuth tokens, or call Google on its own. All API access happens only through MCP tools the user already configured.

## Before you act

1. **Confirm MCP is connected.** If tool calls fail with auth or connection errors, stop and tell the user to finish MCP setup (see `reference/prerequisites.md`). Do not ask for Google passwords in chat.
2. **Discover tools dynamically.** List available MCP tools and read each tool's schema before calling. Tool names vary by server version; never assume a tool exists without checking.
3. **Search before IDs.** Drive file and folder identifiers must come from search, list, or a URL the user pasted. Do not invent or reuse stale IDs from old messages.
4. **User intent only.** Read, write, share, trash, or delete only what the user asked for. Prefer reversible actions (trash) over destructive ones unless the user explicitly requests permanent deletion and the MCP exposes it.
5. **One account.** Local OAuth is single-user. If multiple Google accounts are configured, confirm which account is active before bulk changes.

## Standard workflow

For every task, follow this sequence:

1. **Clarify** outcome, scope (which products: Drive / Docs / Sheets / Slides / Calendar), and constraints (folder, sharing, format).
2. **Locate** targets via search or folder listing with filters (name, mime type, modified time, parent folder).
3. **Plan** steps for multi-file work; for more than three mutations, show a short numbered plan and wait for approval if the user did not already approve bulk edits.
4. **Execute** with the smallest number of MCP calls; batch related reads before writes.
5. **Verify** placement and content (metadata parents, read-back text, or export when formatting matters).
6. **Report** using `templates/agent-handoff.md` structure.

## Drive organization

- Resolve **destination folders** before creates. Creating in My Drive root when the user named a folder is a failure even if content is correct.
- Prefer **create in folder** over create-then-move when the MCP supports a parent folder parameter.
- **Move and rename** are distinct; confirm both when the user asks to "put X in Y and rename it."
- **Shared drives:** if the user mentions a shared drive, scope search and parent IDs to that drive; do not assume My Drive paths.
- **Permissions:** list access before sharing. Grant new access only when asked; report who received access rather than widening visibility silently.
- **Trash vs delete:** default to trash when available; explain recovery window if the user asks about undo.

## Docs, Sheets, and Slides

- **Read before large edits** on existing files. Summarize what will change.
- **Structured input:** when the user provides Markdown tables or CSV, prefer MCP paths that create or update native Google formats in one step when available.
- **Slides:** confirm deck and slide scope; use thumbnail or export tools only when the user needs visual proof.
- **Comments:** adding or resolving comment threads is separate from editing body text; use comment tools when the user asked for review feedback, not inline edits.

## Calendar cross-links

When the user ties files to meetings:

1. Find or create the event with the Calendar tools exposed by the same MCP (or companion server the user configured).
2. Attach or link Drive files only when the MCP supports it; otherwise paste the Drive link in the event description and say so explicitly.
3. Confirm timezone and attendees before sending updates.

## Errors that are usually not transient

Treat these as **permission or configuration facts**, not retry loops:

- OAuth not completed or expired token
- Google Cloud project missing API enablement or consent screen test user
- Scope or grant too narrow for the requested path (for example moving into a folder the app never created)
- Quota or rate limits (back off and report)

See `reference/troubleshooting.md` for user-facing remediation steps.

## Output format

Always end with:

- **Done:** bullet list of artifacts (names, links or IDs if the user uses them)
- **Verified:** what you checked
- **Not done / blocked:** anything skipped with reason
- **User next step:** only when setup or consent is missing

## Supporting files in this package

| File | Purpose |
| --- | --- |
| `reference/prerequisites.md` | MCP install pointer and OAuth expectations (no secrets) |
| `reference/tool-patterns.md` | Operation patterns mapped to MCP discovery |
| `reference/troubleshooting.md` | Common auth and permission fixes |
| `templates/agent-handoff.md` | Report skeleton |
| `templates/batch-change-plan.md` | Plan template for bulk edits |
| `examples/mcp-client-config.example.json` | Illustrative client wiring (placeholders only) |
| `examples/env.example` | Optional env vars some servers accept |

Do not copy OAuth client JSON or token files into the agent workspace from this skill package.
