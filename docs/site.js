(function () {
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
