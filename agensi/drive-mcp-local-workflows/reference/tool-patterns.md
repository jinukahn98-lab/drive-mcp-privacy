# MCP tool patterns (version-agnostic)

Drive MCP Local and similar servers expose dozens of tools. Names change between releases. Use this table to choose **intent**, then pick the matching tool from the live MCP catalog.

| User intent | Pattern | Agent rules |
| --- | --- | --- |
| Find a file or folder | Search or list with query, mime filter, parent folder, modified time | Prefer exact title when known; paginate until confident |
| Read content | Read or export text; Docs as markdown-like text, Sheets as CSV per tab | Re-read after writes |
| Create in folder | Create with parent folder id | Never leave files in root if user named a folder |
| Update body | Patch, insert, or replace via Docs/Sheets/Slides tools | Diff mentally against read-back |
| Move or rename | Move and/or rename tools | Confirm parents via metadata |
| Copy template | Copy file into destination | Keep original untouched |
| Share | List permissions, then grant role to email | Only when user asked |
| Export PDF or office | Export with mime type | Note size limits if export fails |
| Comments | List, add, reply, resolve via comment tools | Resolving is not the same as editing text |
| Calendar event | Create or update event; optional Meet link | Confirm timezone |
| Trash | Trash file or folder | Mention recovery unless user wants permanent delete |

## Multi-step recipes

### Weekly cleanup

1. Search files in the named folder older than the user's cutoff.
2. Present count and sample names; get approval if over ten files.
3. Move to an Archive subfolder or trash per user choice.
4. List folder again to verify counts.

### Doc from outline

1. Create Doc in target folder (or convert from markdown if supported).
2. Insert sections in order; apply heading styles if tools allow.
3. Read back headings list for verification.

### Sheet from CSV snippet

1. Create Sheet in folder or import CSV.
2. Read first rows back.
3. Optionally share view-only to named emails.

### Meeting pack

1. Locate brief in Drive.
2. Create or update Calendar event.
3. Attach file or paste link in description.
4. Return event time and link.

## Anti-patterns

- Calling write tools with guessed file ids
- Sharing "anyone with link" unless explicitly requested
- Running destructive bulk operations without a plan file (`templates/batch-change-plan.md`)
- Storing OAuth JSON in the project repo
