#!/usr/bin/env bash
# Copy source markdown into docs/ for MkDocs (keeps book/ as source of truth).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"

rm -rf docs
mkdir -p docs/stylesheets
cp pages-index.md docs/index.md
cp -r book docs/book
cp stylesheets/extra.css docs/stylesheets/extra.css

echo "Prepared docs/ for MkDocs build (clean reader home + book/)."
