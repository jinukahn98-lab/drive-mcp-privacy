# Troubleshooting (user-facing)

Use this when MCP tool calls fail repeatedly. The agent should summarize one primary cause and one next step, not a long log dump.

## Connection and auth

| Symptom | Likely cause | User action |
| --- | --- | --- |
| MCP tools missing | Server not configured in client | Add server to MCP config; restart client |
| Auth errors on every call | OAuth not finished or token expired | Re-run the MCP's auth flow in a browser |
| Wrong Google account | Multiple profiles or tokens | Switch active account in MCP; re-auth |
| `access_denied` on consent | App in Testing without test user | Add Google account as test user in Cloud Console |

## Permission and scope

| Symptom | Likely cause | User action |
| --- | --- | --- |
| 403 on move into folder | App never created or opened that folder | Open folder once with the app or create via MCP |
| 403 on shared drive | Missing shared drive scope or membership | Enable shared drive support; confirm user is member |
| Empty search | Wrong account or query too narrow | Broaden query; confirm drive scope |

## Quota and limits

| Symptom | Likely cause | User action |
| --- | --- | --- |
| Rate limit errors | Too many calls in short window | Pause; batch reads; retry later |
| Export too large | File exceeds export cap | Split content or export range |

## When to stop automating

If the user has not completed Google Cloud setup, stop and point them to their MCP install guide. Do not workaround by asking for refresh tokens or client secrets in chat.
