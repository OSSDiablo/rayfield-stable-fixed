#!/usr/bin/env python3
"""Build the docs site: docs/*.md -> docs/*.html, served by GitHub Pages from /docs.

No dependencies. The converter only covers what the docs use: headings, paragraphs, lists,
tables, fenced code, inline code, bold, links and rules.
"""

import html
import re
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
DOCS = ROOT / "docs"
REPO = "https://github.com/OSSDiablo/rayfield-gen2-mobile"

PAGES = [
    ("index", "Overview"),
    ("getting-started", "Getting started"),
    ("window", "Window"),
    ("elements", "Elements"),
    ("layout", "Layout"),
    ("themes-and-mobile", "Themes and mobile"),
]


def slug(text):
    text = re.sub(r"<[^>]+>", "", text).lower()
    text = re.sub(r"[^a-z0-9 -]", "", text)
    return re.sub(r"\s+", "-", text.strip())


def link_target(url):
    if url.startswith("../"):
        return f"{REPO}/blob/main/{url[3:]}"
    return re.sub(r"\.md(#|$)", r".html\1", url)


def inline(text):
    parts = re.split(r"(`[^`]+`)", text)
    out = []
    for part in parts:
        if part.startswith("`") and part.endswith("`") and len(part) > 1:
            out.append(f"<code>{html.escape(part[1:-1])}</code>")
            continue
        part = html.escape(part, quote=False)
        part = re.sub(r"\*\*(.+?)\*\*", r"<strong>\1</strong>", part)
        part = re.sub(
            r"\[([^\]]+)\]\(([^)]+)\)",
            lambda m: f'<a href="{html.escape(link_target(m.group(2)))}">{m.group(1)}</a>',
            part,
        )
        out.append(part)
    return "".join(out)


def convert(md):
    lines = md.split("\n")
    out, toc = [], []
    i = 0
    title = None
    while i < len(lines):
        line = lines[i]

        if line.startswith("```"):
            lang = line[3:].strip() or "plaintext"
            i += 1
            code = []
            while i < len(lines) and not lines[i].startswith("```"):
                code.append(lines[i])
                i += 1
            i += 1
            out.append(
                f'<div class="code"><button class="copy" type="button">Copy</button>'
                f'<pre><code class="language-{lang}">{html.escape(chr(10).join(code))}</code></pre></div>'
            )
            continue

        heading = re.match(r"^(#{1,3}) (.+)$", line)
        if heading:
            level, text = len(heading.group(1)), heading.group(2)
            rendered = inline(text)
            if level == 1:
                title = re.sub(r"<[^>]+>", "", rendered)
                out.append(f"<h1>{rendered}</h1>")
            else:
                anchor = slug(text)
                if level == 2:
                    toc.append((anchor, re.sub(r"<[^>]+>", "", rendered)))
                out.append(f'<h{level} id="{anchor}"><a class="anchor" href="#{anchor}">{rendered}</a></h{level}>')
            i += 1
            continue

        if line.strip() == "---":
            out.append("<hr>")
            i += 1
            continue

        if line.startswith("|"):
            rows = []
            while i < len(lines) and lines[i].startswith("|"):
                rows.append([c.strip() for c in lines[i].strip().strip("|").split("|")])
                i += 1
            head, body = rows[0], [r for r in rows[1:] if not all(re.fullmatch(r":?-+:?", c) for c in r)]
            table = "<div class=\"table\"><table><thead><tr>"
            table += "".join(f"<th>{inline(c)}</th>" for c in head)
            table += "</tr></thead><tbody>"
            for row in body:
                table += "<tr>" + "".join(f"<td>{inline(c)}</td>" for c in row) + "</tr>"
            out.append(table + "</tbody></table></div>")
            continue

        list_match = re.match(r"^(\s*)(-|\d+\.) (.+)$", line)
        if list_match:
            ordered = list_match.group(2) != "-"
            items = []
            while i < len(lines):
                m = re.match(r"^(\s*)(-|\d+\.) (.+)$", lines[i])
                if m:
                    items.append(m.group(3))
                elif lines[i].startswith("  ") and lines[i].strip() and items:
                    items[-1] += " " + lines[i].strip()
                else:
                    break
                i += 1
            tag = "ol" if ordered else "ul"
            out.append(f"<{tag}>" + "".join(f"<li>{inline(it)}</li>" for it in items) + f"</{tag}>")
            continue

        if not line.strip():
            i += 1
            continue

        para = []
        while i < len(lines) and lines[i].strip() and not re.match(r"^(#|```|\||-|\d+\. |---)", lines[i]):
            para.append(lines[i].strip())
            i += 1
        out.append(f"<p>{inline(' '.join(para))}</p>")

    return title, "\n".join(out), toc


TEMPLATE = """<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>{page_title}</title>
<meta name="description" content="Docs for Rayfield Gen2 Mobile, a phone-friendly build of the Rayfield Gen2 Roblox UI library.">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&family=JetBrains+Mono:wght@400;500&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/11.9.0/styles/github-dark.min.css">
<link rel="stylesheet" href="style.css">
</head>
<body>
<header class="topbar">
  <button class="menu" type="button" aria-label="Menu">Menu</button>
  <a class="brand" href="index.html">Rayfield Gen2 Mobile</a>
  <a class="gh" href="{repo}">GitHub</a>
</header>
<div class="layout">
  <nav class="sidebar">
{nav}
  </nav>
  <main class="content">
{body}
    <footer class="pager">{pager}</footer>
  </main>
</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/11.9.0/highlight.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/11.9.0/languages/lua.min.js"></script>
<script>
hljs.highlightAll();
document.querySelectorAll(".copy").forEach(function (button) {{
  button.addEventListener("click", function () {{
    var code = button.parentElement.querySelector("code").innerText;
    navigator.clipboard.writeText(code).then(function () {{
      button.textContent = "Copied";
      setTimeout(function () {{ button.textContent = "Copy"; }}, 1500);
    }});
  }});
}});
document.querySelector(".menu").addEventListener("click", function () {{
  document.body.classList.toggle("nav-open");
}});
document.querySelectorAll(".sidebar a").forEach(function (link) {{
  link.addEventListener("click", function () {{ document.body.classList.remove("nav-open"); }});
}});
</script>
</body>
</html>
"""


def build():
    rendered = {}
    for name, label in PAGES:
        rendered[name] = convert((DOCS / f"{name}.md").read_text())

    for index, (name, label) in enumerate(PAGES):
        title, body, toc = rendered[name]
        nav = []
        for other, other_label in PAGES:
            current = ' class="current"' if other == name else ""
            nav.append(f'    <a href="{other}.html"{current}>{html.escape(other_label)}</a>')
            if other == name and toc and name != "index":
                nav.append('    <div class="toc">')
                nav.extend(f'      <a href="#{a}">{t}</a>' for a, t in toc)
                nav.append("    </div>")

        pager = []
        if index > 0:
            prev_name, prev_label = PAGES[index - 1]
            pager.append(f'<a class="prev" href="{prev_name}.html"><span>Previous</span>{html.escape(prev_label)}</a>')
        if index < len(PAGES) - 1:
            next_name, next_label = PAGES[index + 1]
            pager.append(f'<a class="next" href="{next_name}.html"><span>Next</span>{html.escape(next_label)}</a>')

        # the md pages end with a "Next: ..." line; the pager replaces it on the site
        body = re.sub(r"<p>Next: .*?</p>\s*$", "", body.strip())

        page_title = "Rayfield Gen2 Mobile" if name == "index" else f"{title} - Rayfield Gen2 Mobile"
        (DOCS / f"{name}.html").write_text(
            TEMPLATE.format(
                page_title=html.escape(page_title),
                repo=REPO,
                nav="\n".join(nav),
                body=body,
                pager="".join(pager),
            )
        )

    (DOCS / ".nojekyll").write_text("")


if __name__ == "__main__":
    build()
