#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
OUT="$ROOT/_site"

rm -rf "$OUT"
mkdir -p "$OUT/images"

cp "$ROOT/v1/home.html" "$OUT/index.html"
cp "$ROOT/v0/images/vectorLogo.png" "$OUT/images/"
cp "$ROOT/v0/images/pipeFlow.jpg" "$OUT/images/"

if [[ -f "$ROOT/v0/images/gallery.gif" ]]; then
  cp "$ROOT/v0/images/gallery.gif" "$OUT/images/gallery.gif"
else
  echo "Warning: gallery.gif not found; hero animation will be missing." >&2
fi

echo "tensorfields.com" > "$OUT/CNAME"
echo "Built site in $OUT"
