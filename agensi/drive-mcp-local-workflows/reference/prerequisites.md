# Prerequisites (buyer setup)

This skill assumes the buyer runs **Drive MCP Local** (or a compatible self-hosted Google Workspace MCP) on the same machine as the AI client, with **their own** Google Cloud OAuth client.

## What this skill does not provide

- MCP server binary or npm package (install separately from the seller's MCP project)
- Google OAuth client ID or client secret
- Access to the seller's Google account or Drive data

## What the buyer needs

1. **MCP-capable client** (for example Cursor, Claude Desktop, or another client with MCP support).
2. **Drive MCP Local** installed and registered in the client's MCP configuration.
3. **Google Cloud project** owned by the buyer, with APIs enabled for the products they use (typically Drive, Docs, Sheets, Slides, Calendar).
4. **OAuth consent** completed in a browser on the buyer's machine; tokens stored locally per the MCP server's documentation.

## Privacy reference

The seller publishes a privacy policy for the Drive MCP Local product name at:

https://github.com/jinukahn98-lab/drive-mcp-privacy

Buyers operate their own OAuth app and data; they should publish or adopt a privacy policy appropriate to their deployment if they distribute access to others.

## Illustrative client configuration

See `examples/mcp-client-config.example.json`. Replace command paths, package names, and argument lists with the values from the MCP project's current install guide. Restart the client after changes.

## First sanity check

After connect, ask the agent to run the MCP's **auth or status** tool (exact name varies) and report the signed-in Google account email. Do not proceed with bulk mutations until the account matches expectation.
