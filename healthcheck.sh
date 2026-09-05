#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "$0")" && pwd)"

command -v node >/dev/null 2>&1 || { echo "FAIL: node not found"; exit 1; }
command -v npm >/dev/null 2>&1 || { echo "FAIL: npm not found"; exit 1; }

node -e 'const [major]=process.versions.node.split(".").map(Number); if (major < 18) { console.error("FAIL: Node 18+ required"); process.exit(1); }'

[ -f "$ROOT/SKILL.md" ] || { echo "FAIL: SKILL.md missing"; exit 1; }
[ -f "$ROOT/scripts/prepare-digest.js" ] || { echo "FAIL: scripts/prepare-digest.js missing"; exit 1; }
[ -f "$ROOT/scripts/package.json" ] || { echo "FAIL: scripts/package.json missing"; exit 1; }

if [ -d "$ROOT/scripts/node_modules" ]; then
  echo "OK: dependencies installed"
else
  echo "WARN: dependencies not installed; run ./setup-codex.sh"
fi

echo "OK: follow-builders repository looks runnable"