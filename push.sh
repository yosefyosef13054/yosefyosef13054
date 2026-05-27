#!/usr/bin/env bash
# Run from the github-profile-readme folder on your host machine.
# The sandbox cannot reach github.com (blocked by allowlist), so the push
# has to happen from here where your gh CLI / credential helper is set up.
set -e
cd "$(dirname "$0")"

# Clear leftover lock / temp file from the sandbox-side init
rm -f .git/index.lock .git/t4WUznY 2>/dev/null || true

# Make sure user config + remote are set (already configured by the agent, but safe to repeat)
git config user.name  "$(git config --global user.name  || echo yosefyosef13054)"
git config user.email "$(git config --global user.email || echo yosefyosef13054@gmail.com)"
git remote get-url origin >/dev/null 2>&1 \
  && git remote set-url origin https://github.com/yosefyosef13054/yosefyosef13054.git \
  || git remote add origin https://github.com/yosefyosef13054/yosefyosef13054.git

# Stage, commit (only if there's nothing yet), push
git add README.md
git diff --cached --quiet || git commit -m "Add profile README"
git branch -M main
git push -u origin main
