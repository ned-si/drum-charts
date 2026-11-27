#!/usr/bin/env python3
"""Build the site data of charts.nedsi.io from the PDFs of every chart.

Usage: site-data.py --plan <plan.json> <pdf dir> <out dir>

Writes <slug>.pdf, <slug>-<n>.svg (and legend.*) and charts.json to <out dir>.
The plan (scripts/release-plan.py) names each chart's release. The contract
(slugs, header fields, SVG allow-list, manifest) is ned-si/homelab
.kiro/specs/drum-charts-site/design.md#drum-charts-the-site-data, manifest
schema 2 in .kiro/specs/drum-charts-per-song-releases/design.md; the homelab
generator checks the same allow-list again.
"""

import argparse
import datetime
import json
import re
import shutil
import subprocess
import sys
from pathlib import Path
from xml.parsers import expat

ROOT = Path(__file__).resolve().parent.parent

SLUG = re.compile(r"^[a-z0-9]+(-[a-z0-9]+)*$")
# Paths of the site a song must not shadow.
RESERVED = {"fr", "pdf", "pages", "legend", "set-theme"}
COMMIT = re.compile(r"^[0-9a-f]{40}$")
DATE = re.compile(r"^\d{4}-\d{2}-\d{2}$")
HEADER_START = re.compile(r"^\s*\\header\s*\{\s*$")
FIELD = re.compile(r'^\s*(title|subtitle)\s*=\s*"([^"\\]*)"\s*$', re.M)
ANY_FIELD = re.compile(r"\b(title|subtitle)\s*=")
MAX_PAGES = 3
# The homelab generator's rule for artist and title: no Cc, U+2028, U+2029.
CONTROL = re.compile("[\x00-\x1f\x7f-\x9f\u2028\u2029]")

SVG_NS = "http://www.w3.org/2000/svg"
XLINK_NS = "http://www.w3.org/1999/xlink"
ELEMENTS = {"svg", "defs", "g", "path", "use", "rect", "clipPath"}
ATTRIBUTES = {
    "xmlns", "xmlns:xlink", "version", "width", "height", "viewBox", "id",
    "d", "x", "y", "transform", "fill", "fill-opacity", "fill-rule",
    "stroke", "stroke-width", "stroke-linecap", "stroke-linejoin",
    "stroke-miterlimit", "stroke-opacity", "stroke-dasharray",
    "stroke-dashoffset", "opacity", "clip-path", "clip-rule", "href",
    "xlink:href",
}
HREF = re.compile(r"^#[A-Za-z0-9_.:-]+$")
URL = re.compile(r"^url\(#[A-Za-z0-9_.:-]+\)$")
VIEWBOX = re.compile(r"^0 0 ([0-9]+(\.[0-9]+)?) ([0-9]+(\.[0-9]+)?)$")
SVG_START = re.compile(r"<svg\b[^>]*>")
BACKGROUND = '<rect width="100%" height="100%" fill="#ffffff"/>'


class Invalid(Exception):
    pass


def header_fields(text):
    """Return (title, subtitle) of the \\header block, or raise Invalid."""
    lines = text.splitlines()
    start = next((i for i, line in enumerate(lines) if HEADER_START.match(line)), None)
    if start is None:
        raise Invalid("no \\header { block")
    end = next((i for i in range(start + 1, len(lines)) if lines[i].strip() == "}"), None)
    if end is None:
        raise Invalid("the \\header block has no closing } line")
    block = "\n".join(lines[start + 1:end])
    fields = {"title": [], "subtitle": []}
    for m in FIELD.finditer(block):
        fields[m.group(1)].append(m.group(2).strip())
    for line in block.splitlines():
        if ANY_FIELD.search(line) and not FIELD.match(line):
            raise Invalid("header line `%s`: title and subtitle must be one plain "
                          'quoted string each, field = "text"' % line.strip())
    values = []
    for name in ("title", "subtitle"):
        if len(fields[name]) != 1:
            raise Invalid("the header needs exactly one %s, found %d" % (name, len(fields[name])))
        value = fields[name][0]
        if not 1 <= len(value) <= 100:
            raise Invalid("the header %s must be 1 to 100 characters" % name)
        if CONTROL.search(value):
            raise Invalid("the header %s holds a control or line separator character" % name)
        values.append(value)
    return values[0], values[1]


def page_count(pdf):
    if not pdf.is_file():
        raise Invalid("%s is missing" % pdf)
    out = subprocess.run(["pdfinfo", str(pdf)], capture_output=True, text=True)
    m = re.search(r"^Pages:\s+(\d+)\s*$", out.stdout, re.M)
    if out.returncode != 0 or not m:
        raise Invalid("pdfinfo %s failed: %s" % (pdf.name, out.stderr.strip()))
    pages = int(m.group(1))
    if not 1 <= pages <= MAX_PAGES:
        raise Invalid("%s has %d pages, allowed 1 to %d" % (pdf.name, pages, MAX_PAGES))
    return pages


def check_svg(data):
    """Raise Invalid unless the SVG holds only the allow-listed markup."""
    parser = expat.ParserCreate(namespace_separator=" ")
    problems = []
    root = []

    def start(name, attrs):
        ns, _, local = name.rpartition(" ")
        if ns != SVG_NS or local not in ELEMENTS:
            problems.append("element %s" % name.replace(" ", ":"))
        if not root:
            root.append(local)
            box = VIEWBOX.match(attrs.get("viewBox", ""))
            if local != "svg" or not box or not all(
                    0 < float(v) <= 10000 for v in box.group(1, 3)):
                problems.append("root svg viewBox %r" % attrs.get("viewBox"))
        for key, value in attrs.items():
            ans, _, alocal = key.rpartition(" ")
            if ans == XLINK_NS:
                alocal = "xlink:" + alocal
            elif ans:
                alocal = key.replace(" ", ":")
            if alocal not in ATTRIBUTES:
                problems.append("attribute %s" % alocal)
            elif alocal in ("href", "xlink:href") and not HREF.match(value):
                problems.append("%s=%r" % (alocal, value))
            # CSS function names are case-insensitive and take escapes.
            elif "\\" in value or ("url(" in value.lower() and not URL.match(value)):
                problems.append("%s=%r" % (alocal, value))

    def doctype(*_):
        problems.append("<!DOCTYPE>")

    def pi(target, _):
        problems.append("processing instruction <?%s" % target)

    def chars(text):
        if text.strip(" \t\r\n"):
            problems.append("character data %r" % text.strip()[:40])

    parser.StartElementHandler = start
    parser.StartDoctypeDeclHandler = doctype
    parser.ProcessingInstructionHandler = pi
    parser.CharacterDataHandler = chars
    try:
        parser.Parse(data, True)
    except expat.ExpatError as e:
        raise Invalid("not well-formed XML: %s" % e)
    if problems:
        raise Invalid("not allowed: %s" % ", ".join(sorted(set(problems))[:5]))


def render_pages(pdf, pages, out, base):
    for n in range(1, pages + 1):
        svg = out / ("%s-%d.svg" % (base, n))
        res = subprocess.run(["pdftocairo", "-svg", "-f", str(n), "-l", str(n), str(pdf), str(svg)],
                             capture_output=True, text=True)
        if res.returncode != 0:
            raise Invalid("pdftocairo page %d failed: %s" % (n, res.stderr.strip()))
        data = svg.read_text(encoding="utf-8")
        m = SVG_START.search(data)
        if not m:
            raise Invalid("page %d: no <svg> start tag" % n)
        data = data[:m.end()] + BACKGROUND + data[m.end():]
        try:
            check_svg(data.encode("utf-8"))
        except Invalid as e:
            raise Invalid("page %d SVG %s" % (n, e))
        svg.write_text(data, encoding="utf-8")
    shutil.copyfile(pdf, out / ("%s.pdf" % base))


def valid_date(text):
    if not isinstance(text, str) or not DATE.match(text):
        return False
    try:
        datetime.date.fromisoformat(text)
    except ValueError:
        return False
    return True


def read_plan(path, slugs, error):
    """Return {slug: {"commit", "release"}} from the plan; report every problem."""
    try:
        charts = json.loads(path.read_text(encoding="utf-8"))["charts"]
        if not isinstance(charts, list):
            raise TypeError("charts is not a list")
    except (OSError, ValueError, KeyError, TypeError) as e:
        error(path, "not a release plan: %s" % e)
        return {}
    found, seen = {}, set()
    for entry in charts:
        slug = entry.get("slug") if isinstance(entry, dict) else None
        if not isinstance(slug, str):
            error(path, "an entry without a slug: %r" % (entry,))
            continue
        if slug in seen:
            error(path, "%s is listed twice" % slug)
            continue
        seen.add(slug)
        commit, date, tag = entry.get("commit"), entry.get("date"), entry.get("tag")
        if not isinstance(commit, str) or not COMMIT.match(commit):
            error(path, "%s: commit %r is not 40 lower-case hex" % (slug, commit))
        elif not valid_date(date):
            error(path, "%s: date %r is not a yyyy-mm-dd date" % (slug, date))
        elif tag != "%s-%s-%s" % (slug, date, commit[:7]):
            error(path, "%s: tag %r is not %s-%s-%s" % (slug, tag, slug, date, commit[:7]))
        else:
            found[slug] = {"commit": commit, "release": tag}
    for slug in sorted(slugs - seen):
        error(path, "%s is not in the plan" % slug)
    for slug in sorted(seen - slugs):
        error(path, "%s is in the plan but not in songs/" % slug)
    return found


def main():
    ap = argparse.ArgumentParser(description=__doc__.splitlines()[0])
    ap.add_argument("--plan", required=True, type=Path)
    ap.add_argument("build", type=Path)
    ap.add_argument("out", type=Path)
    args = ap.parse_args()
    args.out.mkdir(parents=True, exist_ok=True)

    failed = False

    def error(path, message):
        nonlocal failed
        failed = True
        # Workflow-command escaping, so a multi-line stderr stays one annotation.
        text = str(message).replace("%", "%25").replace("\r", "%0D").replace("\n", "%0A")
        print("::error file=%s::%s" % (path, text))

    # By stem: "a-b.ly" sorts before "a.ly", but slug "a" before "a-b".
    files = sorted((ROOT / "songs").glob("*.ly"), key=lambda p: p.stem)
    plan = read_plan(args.plan, {"legend"} | {ly.stem for ly in files}, error)
    songs = []
    for ly in files:
        slug = ly.stem
        rel = "songs/%s" % ly.name
        try:
            if slug == "charts":
                raise Invalid("slug 'charts': the prefix of the legacy release tags")
            if not SLUG.match(slug) or len(slug) > 80 or slug in RESERVED:
                raise Invalid("slug %r: lower-case words joined by -, at most 80 "
                              "characters, not %s" % (slug, ", ".join(sorted(RESERVED))))
            artist, title = header_fields(ly.read_text(encoding="utf-8"))
            pdf = args.build / ("%s.pdf" % slug)
            pages = page_count(pdf)
            render_pages(pdf, pages, args.out, slug)
        except Invalid as e:
            error(rel, e)
            continue
        if slug in plan:
            songs.append({"slug": slug, "artist": artist, "title": title,
                          "pages": pages, **plan[slug]})

    legend_pages = 0
    try:
        pdf = args.build / "legend.pdf"
        legend_pages = page_count(pdf)
        render_pages(pdf, legend_pages, args.out, "legend")
    except Invalid as e:
        error("legend.ly", e)

    if not songs and not failed:
        error("songs", "no songs/*.ly")
    if failed:
        return 1
    manifest = {
        "schema": 2,
        "legend": {"pages": legend_pages, **plan["legend"]},
        "songs": songs,
    }
    (args.out / "charts.json").write_text(
        json.dumps(manifest, sort_keys=True, indent=2) + "\n", encoding="utf-8")
    print("%d songs, %d pages, legend %d pages -> %s" % (
        len(songs), sum(s["pages"] for s in songs), legend_pages, args.out))
    return 0


if __name__ == "__main__":
    sys.exit(main())
