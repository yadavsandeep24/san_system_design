#!/usr/bin/env bash
# Validate internal markdown links in source + MkDocs docs/ tree.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"

bash scripts/prepare-docs.sh >/dev/null

python3 << 'PY'
import re, sys
from pathlib import Path

ROOT = Path('.')
link_re = re.compile(r'\[([^\]]*)\]\(([^)]+)\)')
skip = ('http://', 'https://', 'mailto:', '#')

def check_tree(files, content_root):
    broken = []
    content_root = content_root.resolve()
    for md in sorted(set(files)):
        md = md.resolve()
        if not md.exists():
            continue
        rel = md.relative_to(content_root)
        for m in link_re.finditer(md.read_text(encoding='utf-8')):
            target = m.group(2).strip()
            if target.startswith(skip):
                continue
            path_part = target.split('#', 1)[0]
            if not path_part:
                continue
            resolved = (content_root / path_part.lstrip('/')) if path_part.startswith('/') else (md.parent / path_part).resolve()
            if not resolved.exists():
                broken.append((str(rel), target))
    return broken

sources = [ROOT / 'README.md', ROOT / 'pages-index.md'] + list((ROOT / 'book').rglob('*.md'))
docs = list((ROOT / 'docs').rglob('*.md'))

b1 = check_tree(sources, ROOT.resolve())
b2 = check_tree(docs, (ROOT / 'docs').resolve())

if b1 or b2:
    print('BROKEN LINKS FOUND')
    for label, items in [('source', b1), ('docs', b2)]:
        for src, tgt in items:
            print(f'  [{label}] {src} -> {tgt}')
    sys.exit(1)

print('OK: all internal markdown links resolve (source + docs/).')
PY

# Built HTML (MkDocs output)
python3 << 'PY'
import re, sys
from pathlib import Path
from urllib.parse import urlparse

SITE = Path('site')
href_re = re.compile(r'href=["\']([^"\']+)["\']')
broken = []

for html in sorted(SITE.rglob('*.html')):
    if html.name == '404.html':
        continue
    page_rel = html.relative_to(SITE)
    for m in href_re.finditer(html.read_text(encoding='utf-8', errors='ignore')):
        href = m.group(1).strip()
        if href.startswith(('http://', 'https://', 'mailto:', 'tel:', 'javascript:', '//', '#')):
            continue
        path = urlparse(href).path
        if not path:
            continue
        if path.startswith('/'):
            rel = path.lstrip('/')
            if rel.startswith('san_system_design/'):
                rel = rel[len('san_system_design/'):]
            target = SITE / rel
        else:
            target = (html.parent / path).resolve()
            try:
                target = SITE / target.relative_to(SITE.resolve())
            except ValueError:
                broken.append((str(page_rel), href, 'outside site'))
                continue
        if target.is_dir():
            target = target / 'index.html'
        if not target.exists():
            alt = Path(str(target) + '/index.html')
            if not alt.exists():
                broken.append((str(page_rel), href, str(target.relative_to(SITE))))

if broken:
    print('BROKEN HTML LINKS:')
    for b in broken[:30]:
        print(f'  {b[0]} -> {b[1]} ({b[2]})')
    sys.exit(1)
print('OK: built site internal hrefs resolve.')
PY
