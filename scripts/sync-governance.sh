#!/usr/bin/env bash
# sync-governance.sh — Sync governance baseline from .github to a repo
set -euo pipefail

REPO_DIR="${1:-.}"
echo "=== Syncing governance baseline to $REPO_DIR ==="

# Ensure required directories exist
mkdir -p "$REPO_DIR/.governance"
mkdir -p "$REPO_DIR/.agent_hooks"

echo "✅ Governance directories ensured"
echo "Run validate-config.sh to verify compliance"
