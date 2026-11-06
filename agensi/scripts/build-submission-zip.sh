#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
REPO_ROOT="$(cd "$ROOT/.." && pwd)"
PKG_NAME="drive-mcp-local-workflows"
PKG_DIR="$ROOT/$PKG_NAME"
DIST="$REPO_ROOT/dist"
ARTIFACTS="/opt/cursor/artifacts"

"$ROOT/scripts/validate-package.sh"

mkdir -p "$DIST" "$ARTIFACTS"
ZIP_NAME="${PKG_NAME}-agensi.zip"
ZIP_PATH="$DIST/$ZIP_NAME"

rm -f "$ZIP_PATH"
(
  cd "$ROOT"
  zip -r "$ZIP_PATH" "$PKG_NAME" -x "*.DS_Store" -x "*__MACOSX*"
)

cp "$ZIP_PATH" "$ARTIFACTS/$ZIP_NAME"

echo "Built: $ZIP_PATH"
echo "Copied: $ARTIFACTS/$ZIP_NAME"
unzip -l "$ZIP_PATH"
