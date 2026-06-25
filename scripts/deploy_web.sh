#!/usr/bin/env bash
#
# deploy_web.sh — Build the Flutter web app from `main` and publish it to the
# `gh-pages` branch (GitHub Pages).
#
# This repo keeps source on `main` and the compiled web bundle on `gh-pages`
# (the branch root == contents of build/web). This script does the whole flow
# using throwaway git worktrees, so it never touches your current checkout:
#
#   1. fetch origin
#   2. build `main` (release web build) in a temp worktree
#   3. copy the build output into a temp worktree of gh-pages
#   4. commit + push straight to origin/gh-pages
#
# Usage:  scripts/deploy_web.sh
#
set -euo pipefail

# ---- config ---------------------------------------------------------------
BASE_HREF="/red_tail_ridge_office/"   # must match the GitHub Pages sub-path
SOURCE_BRANCH="main"
DEPLOY_BRANCH="gh-pages"
REMOTE="origin"
# ---------------------------------------------------------------------------

ROOT="$(git rev-parse --show-toplevel)"
cd "$ROOT"

if command -v fvm >/dev/null 2>&1; then
  FLUTTER="fvm flutter"
else
  FLUTTER="flutter"
fi

TMPROOT="$(mktemp -d)"
WT_BUILD="$TMPROOT/src"
WT_DEPLOY="$TMPROOT/deploy"

cleanup() {
  git worktree remove --force "$WT_BUILD"  >/dev/null 2>&1 || true
  git worktree remove --force "$WT_DEPLOY" >/dev/null 2>&1 || true
  rm -rf "$TMPROOT"
  git worktree prune >/dev/null 2>&1 || true
}
trap cleanup EXIT

echo "==> Fetching $REMOTE ..."
git fetch "$REMOTE" "$SOURCE_BRANCH" "$DEPLOY_BRANCH"

echo "==> Building web from local '$SOURCE_BRANCH' ..."
git worktree add --detach "$WT_BUILD" "$SOURCE_BRANCH"
SRC_SHA="$(git -C "$WT_BUILD" rev-parse --short HEAD)"
(
  cd "$WT_BUILD"
  $FLUTTER pub get
  $FLUTTER build web --release --base-href "$BASE_HREF"
)

echo "==> Publishing to '$DEPLOY_BRANCH' (origin/$DEPLOY_BRANCH @ $SRC_SHA) ..."
# Detached checkout of the remote deploy branch so we don't disturb any local
# gh-pages checkout and avoid "branch already checked out" worktree errors.
git worktree add --detach "$WT_DEPLOY" "$REMOTE/$DEPLOY_BRANCH"

# Replace tracked content with the fresh build (keep .git).
find "$WT_DEPLOY" -mindepth 1 -maxdepth 1 ! -name '.git' -exec rm -rf {} +
cp -R "$WT_BUILD/build/web/." "$WT_DEPLOY/"

(
  cd "$WT_DEPLOY"
  git add -A
  if git diff --cached --quiet; then
    echo "==> No changes to deploy — gh-pages already matches this build."
  else
    git commit -m "Deploy to github pages (main@$SRC_SHA)"
    git push "$REMOTE" "HEAD:$DEPLOY_BRANCH"
    echo "==> Deployed main@$SRC_SHA to $REMOTE/$DEPLOY_BRANCH."
  fi
)

echo "==> Done."
