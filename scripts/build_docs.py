#!/usr/bin/env python3
"""Build the docs site: docs/*.md -> docs/*.html, served by GitHub Pages from /docs.

No dependencies. The converter only covers what the docs use: headings, paragraphs, lists,
tables, fenced code, inline code, bold, links, rules and raw HTML blocks.
"""

import html
import json
import re
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
DOCS = ROOT / "docs"
REPO = "https://github.com/OSSDiablo/rayfield-preview-fixed"
LOADSTRING = (
    'local Rayfield = loadstring(game:HttpGet("https://raw.githubusercontent.com/'
    'OSSDiablo/rayfield-preview-fixed/main/dist/rayfield.luau"))()'
)

PAGES = [
    ("index", "Overview"),
    ("getting-started", "Getting started"),
    ("window", "Window"),
    ("elements", "Elements"),
    ("layout", "Layout"),
    ("themes-and-mobile", "Themes and mobile"),
    ("example", "Full example"),
    ("faq", "FAQ"),
]

LANGUAGE_NAMES = {"lua": "Lua", "luau": "Luau", "plaintext": "Text"}


def slug(text):
    text = re.sub(r"<[^>]+>", "", text).lower()
    text = re.sub(r"[^a-z0-9 -]", "", text)
    return re.sub(r"\s+", "-", text.strip())


def link_target(url):
    if url.startswith("../"):
        return f"{REPO}/blob/main/{url[3:]}"
    return re.sub(r"\.md(#|$)", r".html\1", url)


def strip_tags(text):
    return re.sub(r"\s+", " ", html.unescape(re.sub(r"<[^>]+>", " ", text))).strip()


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


def code_block(lang, code):
    label = LANGUAGE_NAMES.get(lang, lang.capitalize())
    return (
        '<div class="code"><div class="code-head">'
        f'<span>{html.escape(label)}</span><button class="copy" type="button">Copy</button></div>'
        f'<pre><code class="language-{lang}">{html.escape(code)}</code></pre></div>'
    )


def convert(md):
    """Returns (title, body html, toc [(anchor, text)], sections [(anchor, heading, text)])."""
    lines = md.split("\n")
    out, toc, sections = [], [], []
    current = [None, None, []]  # anchor, heading, text parts for the search index
    title = None

    def note(text):
        current[2].append(strip_tags(text))

    def close_section():
        if current[1] is not None:
            sections.append((current[0], current[1], " ".join(current[2]).strip()))

    i = 0
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
            out.append(code_block(lang, "\n".join(code)))
            continue

        if line.startswith("<"):
            block = []
            while i < len(lines) and lines[i].strip():
                block.append(lines[i])
                i += 1
            raw = "\n".join(block)
            raw = re.sub(r'href="([a-z0-9-]+)\.md(#[^"]*)?"', lambda m: f'href="{m.group(1)}.html{m.group(2) or ""}"', raw)
            out.append(raw)
            note(raw)
            continue

        heading = re.match(r"^(#{1,3}) (.+)$", line)
        if heading:
            level, text = len(heading.group(1)), heading.group(2)
            rendered = inline(text)
            if level == 1:
                title = strip_tags(rendered)
                out.append(f"<h1>{rendered}</h1>")
                current[:] = ["", title, []]
            else:
                anchor = slug(text)
                plain = strip_tags(rendered)
                if level == 2:
                    toc.append((anchor, plain))
                close_section()
                current[:] = [anchor, plain, []]
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
            table = '<div class="table"><table><thead><tr>'
            table += "".join(f"<th>{inline(c)}</th>" for c in head)
            table += "</tr></thead><tbody>"
            for row in body:
                table += "<tr>" + "".join(f"<td>{inline(c)}</td>" for c in row) + "</tr>"
                note(" ".join(row))
            out.append(table + "</tbody></table></div>")
            continue

        if re.match(r"^(\s*)(-|\d+\.) (.+)$", line):
            ordered = not line.lstrip().startswith("-")
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
            for it in items:
                note(inline(it))
            continue

        if not line.strip():
            i += 1
            continue

        para = []
        while i < len(lines) and lines[i].strip() and not re.match(r"^(#|```|\||-|\d+\. |---|<)", lines[i]):
            para.append(lines[i].strip())
            i += 1
        rendered = inline(" ".join(para))
        out.append(f"<p>{rendered}</p>")
        note(rendered)

    close_section()
    return title, "\n".join(out), toc, sections


HERO = """<section class="hero">
  <img class="hero-logo" src="logo.png" alt="" width="72" height="72">
  <h1>Rayfield Preview Fixed</h1>
  <p class="lede">The Rayfield Gen2 preview for Roblox, fixed up for phones by Astris Hub. Same API, so any Gen2 script runs on it unchanged.</p>
  {install}
  <div class="hero-actions">
    <a class="button primary" href="getting-started.html">Get started</a>
    <a class="button" href="example.html">See a full example</a>
  </div>
</section>"""

TEMPLATE = """<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>{page_title}</title>
<meta name="description" content="Docs for Rayfield Preview Fixed by Astris Hub, a phone-friendly build of the Rayfield Gen2 preview for Roblox.">
<link rel="icon" type="image/png" href="logo.png">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&family=JetBrains+Mono:wght@400;500&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/11.9.0/styles/github-dark.min.css">
<link rel="stylesheet" href="style.css">
</head>
<body class="page-{name}">
<header class="topbar">
  <button class="menu" type="button" aria-label="Open navigation">Menu</button>
  <a class="brand" href="index.html"><img src="logo.png" alt="" width="22" height="22"><span>Rayfield Preview Fixed</span></a>
  <a class="gh" href="{repo}">GitHub</a>
</header>
<div class="layout">
  <nav class="sidebar">
    <div class="search">
      <input type="search" placeholder="Search the docs" aria-label="Search the docs" autocomplete="off">
      <kbd>/</kbd>
    </div>
    <div class="results" hidden></div>
    <div class="nav">
{nav}
    </div>
  </nav>
  <main class="content">
{body}
    <footer class="page-foot">
      <div class="pager">{pager}</div>
      <a class="edit" href="{repo}/blob/main/docs/{name}.md">Edit this page on GitHub</a>
    </footer>
  </main>
</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/11.9.0/highlight.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/11.9.0/languages/lua.min.js"></script>
<script src="search.js"></script>
<script src="site.js"></script>
</body>
</html>
"""

SITE_JS = r"""(function () {
  if (window.hljs) {
    document.querySelectorAll("pre code.language-luau").forEach(function (el) {
      el.classList.remove("language-luau");
      el.classList.add("language-lua");
    });
    hljs.highlightAll();
  }

  document.querySelectorAll(".copy").forEach(function (button) {
    button.addEventListener("click", function () {
      var block = button.closest(".code, .install");
      var code = block.querySelector("code").innerText;
      navigator.clipboard.writeText(code).then(function () {
        button.textContent = "Copied";
        setTimeout(function () { button.textContent = "Copy"; }, 1500);
      });
    });
  });

  var body = document.body;
  document.querySelector(".menu").addEventListener("click", function () {
    body.classList.toggle("nav-open");
  });
  document.querySelectorAll(".sidebar a").forEach(function (link) {
    link.addEventListener("click", function () { body.classList.remove("nav-open"); });
  });

  var input = document.querySelector(".search input");
  var results = document.querySelector(".results");
  var nav = document.querySelector(".nav");
  var index = window.SEARCH_INDEX || [];

  function escape(text) {
    return text.replace(/[&<>"]/g, function (c) {
      return { "&": "&amp;", "<": "&lt;", ">": "&gt;", '"': "&quot;" }[c];
    });
  }

  function snippet(text, words) {
    var lower = text.toLowerCase();
    var at = -1;
    for (var i = 0; i < words.length && at < 0; i++) at = lower.indexOf(words[i]);
    if (at < 0) return escape(text.slice(0, 110));
    var start = Math.max(0, at - 40);
    return (start > 0 ? "..." : "") + escape(text.slice(start, start + 120));
  }

  function search(query) {
    var words = query.toLowerCase().split(/\s+/).filter(Boolean);
    if (!words.length) {
      results.hidden = true;
      nav.hidden = false;
      return;
    }
    var hits = [];
    index.forEach(function (entry) {
      var heading = entry.heading.toLowerCase();
      var text = entry.text.toLowerCase();
      var score = 0;
      for (var i = 0; i < words.length; i++) {
        var w = words[i];
        if (heading.indexOf(w) >= 0) score += 5;
        else if (text.indexOf(w) >= 0) score += 1;
        else return;
      }
      hits.push({ entry: entry, score: score });
    });
    hits.sort(function (a, b) { return b.score - a.score; });
    results.innerHTML = hits.length
      ? hits.slice(0, 12).map(function (hit) {
          var e = hit.entry;
          var href = e.page + ".html" + (e.anchor ? "#" + e.anchor : "");
          return '<a href="' + href + '"><strong>' + escape(e.heading) + "</strong><span>" +
            escape(e.pageTitle) + "</span><em>" + snippet(e.text, words) + "</em></a>";
        }).join("")
      : '<p class="none">Nothing matches that.</p>';
    results.hidden = false;
    nav.hidden = true;
  }

  input.addEventListener("input", function () { search(input.value); });
  input.addEventListener("keydown", function (event) {
    if (event.key === "Escape") { input.value = ""; search(""); input.blur(); }
    if (event.key === "Enter") {
      var first = results.querySelector("a");
      if (first) window.location.href = first.getAttribute("href");
    }
  });
  document.addEventListener("keydown", function (event) {
    if (event.key === "/" && document.activeElement !== input) {
      event.preventDefault();
      body.classList.add("nav-open");
      input.focus();
    }
  });
})();
"""


def build():
    rendered = {name: convert((DOCS / f"{name}.md").read_text()) for name, _ in PAGES}

    search_index = []
    for name, label in PAGES:
        _, _, _, sections = rendered[name]
        for anchor, heading, text in sections:
            search_index.append(
                {"page": name, "pageTitle": label, "anchor": anchor, "heading": heading, "text": text[:600]}
            )
    (DOCS / "search.js").write_text("window.SEARCH_INDEX = " + json.dumps(search_index, separators=(",", ":")) + ";\n")
    (DOCS / "site.js").write_text(SITE_JS)

    for index, (name, label) in enumerate(PAGES):
        title, body, toc, _ = rendered[name]

        nav = []
        for other, other_label in PAGES:
            current = ' class="current"' if other == name else ""
            nav.append(f'      <a href="{other}.html"{current}>{html.escape(other_label)}</a>')
            if other == name and toc and name != "index":
                nav.append('      <div class="toc">')
                nav.extend(f'        <a href="#{a}">{html.escape(t)}</a>' for a, t in toc)
                nav.append("      </div>")

        pager = []
        if index > 0:
            prev_name, prev_label = PAGES[index - 1]
            pager.append(f'<a class="prev" href="{prev_name}.html"><span>Previous</span>{html.escape(prev_label)}</a>')
        if index < len(PAGES) - 1:
            next_name, next_label = PAGES[index + 1]
            pager.append(f'<a class="next" href="{next_name}.html"><span>Next</span>{html.escape(next_label)}</a>')

        # the md pages end with a "Next: ..." line; the pager replaces it on the site
        body = re.sub(r"<p>Next: .*?</p>\s*$", "", body.strip())

        if name == "index":
            install = (
                '<div class="install"><code>' + html.escape(LOADSTRING) + "</code>"
                '<button class="copy" type="button">Copy</button></div>'
            )
            body = HERO.format(install=install) + "\n" + re.sub(r"^<h1>.*?</h1>\s*", "", body)

        page_title = "Rayfield Preview Fixed" if name == "index" else f"{title} - Rayfield Preview Fixed"
        (DOCS / f"{name}.html").write_text(
            TEMPLATE.format(
                page_title=html.escape(page_title),
                name=name,
                repo=REPO,
                nav="\n".join(nav),
                body=body,
                pager="".join(pager),
            )
        )

    (DOCS / ".nojekyll").write_text("")


if __name__ == "__main__":
    build()
