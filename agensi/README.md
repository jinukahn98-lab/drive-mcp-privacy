# Agensi deliverables (repository — not in submission ZIP)

This directory holds:

| Path | Purpose |
| --- | --- |
| `drive-mcp-local-workflows/` | **Submission root** — contents are zipped for Agensi upload |
| `MARKETPLACE_LISTING.md` | English listing copy for the upload form |
| `HANDOFF_KO.md` | Korean owner handoff note |
| `scripts/validate-package.sh` | Local checks before upload |
| `scripts/build-submission-zip.sh` | Builds the Agensi ZIP artifact |

## Build the upload ZIP

```bash
./agensi/scripts/build-submission-zip.sh
```

Output: `dist/drive-mcp-local-workflows-agensi.zip` and a copy under `/opt/cursor/artifacts/`.

## What stays out of the ZIP

- This README and marketplace copy
- Repository privacy policy (`PRIVACY.md` at repo root) — linked from listing, not duplicated as buyer data
- MCP server source, build scripts, or OAuth credentials

## Skill vs MCP server

| Item | In Agensi ZIP? | Notes |
| --- | --- | --- |
| Agent workflow skill (SKILL.md + references) | Yes | Original instructional content |
| Drive MCP Local server | No | Buyer installs separately |
| Google OAuth client JSON | No | Buyer creates in their Cloud project |
