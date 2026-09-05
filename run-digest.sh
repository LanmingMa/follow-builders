#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "$0")" && pwd)"
cd "$ROOT/scripts"

if [ ! -d node_modules ]; then
  echo "Dependencies are missing. Run ./setup-codex.sh first." >&2
  exit 1
fi

node prepare-digest.js