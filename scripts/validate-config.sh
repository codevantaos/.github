#!/usr/bin/env bash
# validate-config.sh — Validate repo governance configuration
set -euo pipefail

echo "=== Governance Config Validation ==="
ERRORS=0

# Check required files
for f in METADATA.yaml URN SECURITY.md repo.automation.yaml; do
  if [ -f "$f" ]; then
    echo "✅ $f exists"
  else
    echo "❌ Missing: $f"
    ERRORS=$((ERRORS + 1))
  fi
done

# Check directories
for d in .governance .agent_hooks; do
  if [ -d "$d" ]; then
    echo "✅ $d/ exists"
  else
    echo "❌ Missing: $d/"
    ERRORS=$((ERRORS + 1))
  fi
done

# URN consistency
if [ -f "URN" ] && [ -f "METADATA.yaml" ]; then
  URN_FILE=$(cat URN | tr -d '[:space:]')
  URN_META=$(grep '^urn:' METADATA.yaml | awk '{print $2}' | tr -d '[:space:]' || echo "")
  if [ -n "$URN_META" ] && [ "$URN_FILE" != "$URN_META" ]; then
    echo "❌ URN mismatch: file=$URN_FILE metadata=$URN_META"
    ERRORS=$((ERRORS + 1))
  else
    echo "✅ URN consistent"
  fi
fi

echo ""
if [ $ERRORS -gt 0 ]; then
  echo "❌ Validation failed: $ERRORS error(s)"
  exit 1
fi
echo "✅ All checks passed"
