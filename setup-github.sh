#!/usr/bin/env bash
# One-shot setup: creates the GitHub repo, pushes everything and configures it.
# Requirements: git and GitHub CLI (https://cli.github.com), then run `gh auth login` once.
set -euo pipefail

OWNER="Syed-Muhammad-Tayyab"
REPO="Public-APIs"
DESC="🚀 A curated list of 2,000+ free public APIs for developers | Developed by Syed Muhammad Tayyab"
TOPICS="public-apis,api,apis,free-apis,rest-api,json,developer-tools,awesome-list,awesome,web-development,mcp,resources"

git init -b main
git add .
git commit -m "feat: initial commit - Public APIs list with decorated README"

gh repo create "$OWNER/$REPO" --public --description "$DESC" --source . --remote origin --push
gh repo edit "$OWNER/$REPO" --add-topic "$TOPICS" --enable-issues --enable-discussions=false --enable-wiki=false --delete-branch-on-merge

echo "✅ Done: https://github.com/$OWNER/$REPO"
echo "ℹ️  Optional: upload assets/social-preview.png in Settings → General → Social preview"
