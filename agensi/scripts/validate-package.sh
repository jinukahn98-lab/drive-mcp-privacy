#!/usr/bin/env bash
# Validates the Agensi skill folder before zipping.
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
PKG="$ROOT/drive-mcp-local-workflows"
FAIL=0

red() { printf '\033[31m%s\033[0m\n' "$*"; }
green() { printf '\033[32m%s\033[0m\n' "$*"; }

check() {
  if "$@"; then
    green "OK: $*"
  else
    red "FAIL: $*"
    FAIL=1
  fi
}

[[ -f "$PKG/SKILL.md" ]] || { red "Missing SKILL.md"; exit 1; }

python3 - "$PKG/SKILL.md" <<'PY'
import re, sys, yaml
path = sys.argv[1]
text = open(path, encoding="utf-8").read()
if not text.startswith("---"):
    raise SystemExit("SKILL.md must start with YAML frontmatter")
parts = text.split("---", 2)
if len(parts) < 3:
    raise SystemExit("Invalid frontmatter fence")
meta = yaml.safe_load(parts[1])
body = parts[2].strip()
for key in ("name", "description"):
    if not meta.get(key):
        raise SystemExit(f"Missing frontmatter field: {key}")
name = meta["name"]
if name != "drive-mcp-local-workflows":
    raise SystemExit(f"name must match folder: {name}")
if not re.fullmatch(r"[a-z0-9]+(-[a-z0-9]+)*", name):
    raise SystemExit("name must be lowercase slug")
if len(body) < 200:
    raise SystemExit("Instruction body too short")
print(f"Frontmatter OK: name={name}, description length={len(meta['description'])}")
PY

# Secret-ish patterns (heuristic)
if rg -n -i '(api[_-]?key|client[_-]?secret|refresh[_-]?token|BEGIN (RSA |EC )?PRIVATE KEY|x-access-token|AIza[0-9A-Za-z_-]{20,})' "$PKG" --glob '!LICENSE.txt'; then
  red "Possible secret pattern detected"
  FAIL=1
else
  green "OK: no obvious secret patterns"
fi

# Disallowed binaries / heavy dirs
if find "$PKG" -type f \( -name '*.exe' -o -name '*.dll' -o -name '*.so' -o -name '*.dylib' -o -name '*.jar' -o -name '*.wasm' \) | grep -q .; then
  red "Disallowed binary extensions found"
  FAIL=1
else
  green "OK: no disallowed binary extensions"
fi

# Symlinks
if find "$PKG" -type l | grep -q .; then
  red "Symlinks not allowed"
  FAIL=1
else
  green "OK: no symlinks"
fi

# Required supporting files
for f in reference/prerequisites.md reference/tool-patterns.md reference/troubleshooting.md templates/agent-handoff.md LICENSE.txt; do
  check test -f "$PKG/$f"
done

# Size sanity (Agensi 50MB limit)
SIZE=$(du -sb "$PKG" | awk '{print $1}')
if [[ "$SIZE" -gt 52428800 ]]; then
  red "Package exceeds 50MB"
  FAIL=1
else
  green "OK: package size ${SIZE} bytes"
fi

FILE_COUNT=$(find "$PKG" -type f | wc -l)
if [[ "$FILE_COUNT" -gt 1000 ]]; then
  red "Too many files"
  FAIL=1
else
  green "OK: $FILE_COUNT files"
fi

if [[ "$FAIL" -ne 0 ]]; then
  red "Validation failed"
  exit 1
fi
green "All validation checks passed"
