#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "$0")" && pwd)"
cd "$ROOT/scripts"

if ! command -v node >/dev/null 2>&1; then
  echo "Node.js is required. Install Node 18+ and rerun this script." >&2
  exit 1
fi

npm install

echo "follow-builders dependencies installed."
echo "Run ./run-digest.sh to prepare a digest payload."