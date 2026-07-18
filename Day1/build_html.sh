#!/bin/zsh
set -eu

script_dir="${0:A:h}"
normalizer="/Users/lanss/.codex/skills/md-to-phtml/scripts/normalize_punctuation.py"

for source_md in "$script_dir"/0[1-4]_*.md; do
  [[ "$source_md" == *.normalized.md ]] && continue
  output_base="${source_md%.md}"
  normalized_md="$output_base.normalized.md"
  python3 "$normalizer" "$source_md" -o "$normalized_md"
  perl -i -pe 's/^(\d+)。 /$1. /' "$normalized_md"
  page_title="$(basename "$output_base" | sed 's/^[0-9][0-9]_//; s/_深度導讀$//; s/_/ /g')"
  pandoc "$normalized_md" \
    --from=gfm \
    --to=html5 \
    --standalone \
    --metadata lang=zh-Hant-TW \
    --metadata pagetitle="$page_title" \
    --include-in-header="$script_dir/deepguide_style.html" \
    --include-before-body="$script_dir/article_nav.html" \
    --include-after-body="$script_dir/article_footer.html" \
    --output="$output_base.html"
  python3 -m html.parser "$output_base.html"
done

python3 -m html.parser "$script_dir/index.html"
