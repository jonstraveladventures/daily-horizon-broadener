#!/usr/bin/env bash
# Publish a reviewed draft to the live site.
#
#   ./publish.sh <draft-filename>
#   e.g.  ./publish.sh 2026-07-03-whistled-languages.md
#
# Moves the draft out of _drafts/ into _posts/ (ensuring a YYYY-MM-DD- prefix)
# and commits it. Pushing is left as a separate, deliberate step — that push
# is the moment the essay actually goes public.
set -euo pipefail
cd "$(dirname "$0")"

draft="${1:?Usage: ./publish.sh <draft-filename in _drafts/>}"
base="${draft##*/}"
src="_drafts/$base"
[ -f "$src" ] || { echo "No such draft: $src"; exit 1; }

if [[ "$base" =~ ^[0-9]{4}-[0-9]{2}-[0-9]{2}- ]]; then
  dest="_posts/$base"
else
  dest="_posts/$(date +%F)-$base"
fi

git mv "$src" "$dest"
git commit -m "Publish: ${dest##*/}"

echo
echo "Committed -> $dest"
echo "It is NOT public yet. To publish, push:"
echo "    git push"
