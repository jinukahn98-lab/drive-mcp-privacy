# Validation log (2026-11-06)

Command: `./agensi/scripts/build-submission-zip.sh`

## Automated checks (`validate-package.sh`)

| Check | Result |
| --- | --- |
| SKILL.md YAML frontmatter (`name`, `description`) | Pass |
| `name` matches folder slug `drive-mcp-local-workflows` | Pass |
| Instruction body length | Pass |
| Heuristic secret scan | Pass |
| Disallowed binary extensions | Pass |
| Symlinks | None |
| Required reference/template/LICENSE files | Pass |
| Package size under 50 MB | ~14 KB |
| File count under 1,000 | 9 files |

## ZIP layout

Single top-level folder `drive-mcp-local-workflows/` containing `SKILL.md` at folder root (Agensi layout).

## Not run in this environment

- Live agent test against Drive MCP Local (MCP server not present in cloud workspace)
- Agensi platform 8-point scan (requires owner upload)

Owner should run one end-to-end test locally after MCP connect before publishing a paid listing.
