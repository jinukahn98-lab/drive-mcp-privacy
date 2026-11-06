# Marketplace listing copy (English)

Use these fields in the Agensi creator upload form. Adjust price and category in the UI; nothing here commits to payout or tax setup.

## Title

Drive MCP Local Workflows for AI Agents

## Summary (short)

Search-first Google Drive, Docs, Sheets, Slides, and Calendar playbooks for agents connected to your local Drive MCP Local server—without guessing file IDs or skipping verification.

## Description (long)

Agents connected to **Drive MCP Local** (or a compatible self-hosted Google Workspace MCP) can organize Drive, edit Workspace files, export PDFs, manage sharing, and tie files to Calendar events—but only if they follow consistent, safe workflows.

This skill packages **operator instructions** an agent loads on demand: discover MCP tools dynamically, resolve folders before creates, batch plan mutations, handle OAuth and 403 cases honestly, and report results in a fixed handoff format. Supporting reference docs cover prerequisites, version-agnostic tool patterns, troubleshooting, and templates for bulk plans.

**Included:** SKILL.md, reference guides, report templates, and placeholder-only MCP config examples (no credentials).

**Not included:** The Drive MCP Local server, OAuth client secrets, or access to any seller Google account. Buyers install and authenticate their own MCP on their own machine.

Privacy practices for the Drive MCP Local product name: https://github.com/jinukahn98-lab/drive-mcp-privacy

## Features (bullets)

- Search-before-ID rules to reduce wrong-file edits
- Folder-first create and move patterns for Drive
- Docs, Sheets, and Slides read-verify-write loops
- Sharing and trash defaults that favor user intent
- Calendar + Drive coordination checklist
- Batch change plan template for multi-file work
- Troubleshooting table for auth, scope, and quota errors
- Placeholder MCP client and env examples (no secrets)

## Audience

- Developers and power users who already run **Drive MCP Local** (or similar) with local OAuth
- Teams wanting repeatable agent behavior for Google Workspace file work
- Agensi buyers using Cursor, Claude Code, Codex, or other MCP-connected clients

## Usage (buyer)

1. Connect Agensi and add this skill to the agent library.
2. Install and authenticate **Drive MCP Local** on the same machine as the client (separate from this purchase).
3. Ask in natural language: organize a folder, draft a Doc from an outline, build a Sheet from CSV, export a PDF, or attach a file to a meeting.
4. The agent follows SKILL.md, uses your live MCP tools, and returns a structured handoff summary.

## Security and privacy notes

- This skill is **text-only guidance**; it does not exfiltrate data, embed credentials, or call the network by itself.
- All Google access occurs through the buyer's MCP server and OAuth tokens stored on the buyer's device.
- Do not paste OAuth client JSON or token files into chats; use paths configured in the MCP client.
- The seller does not receive buyer Drive content through this skill.
- Comply with [Google API Services User Data Policy](https://developers.google.com/terms/api-services-user-data-policy) for any OAuth app the buyer operates.

## Suggested category / tags

Category: Productivity (or Developer tools)

Tags: google-drive, google-workspace, mcp, calendar, oauth

## Suggested pricing note (owner decision)

One-time purchase is a reasonable default because the skill is self-contained text. Subscription only if the seller commits to frequent updates aligned with MCP releases.

## Frontmatter mapping

The submission ZIP's `SKILL.md` already includes `summary`, `version`, `tags`, `keywords`, `use_cases`, and `docs_url` for Agensi auto-fill.
