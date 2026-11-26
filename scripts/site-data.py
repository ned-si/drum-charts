#!/usr/bin/env python3
"""Build the site data of charts.nedsi.io from the PDFs of one build.

Usage: site-data.py --release <tag> --commit <sha> <build dir> <out dir>

Writes <slug>.pdf, <slug>-<n>.svg (and legend.*) and charts.json to <out dir>.
The contract (slugs, header fields, SVG allow-list, manifest) is
ned-si/homelab .kiro/specs/drum-charts-site/design.md#drum-charts-the-site-data;
the homelab generator checks the same allow-list again.
"""

import argparse
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
HEADER_START = re.compile(r"^\s*\\header\s*\{\s*$")
FIELD = re.compile(r'^\s*(title|subtitle)\s*=\s*"([^"\\]*)"\s*$', re.M)
ANY_FIELD = re.compile(r"\b(title|subtitle)\s*=")
MAX_PAGES = 3

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

    def start(name, attrs):
        ns, _, local = name.rpartition(" ")
        if ns != SVG_NS or local not in ELEMENTS:
            problems.append("element %s" % name.replace(" ", ":"))
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
            elif "url(" in value and not URL.match(value):
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


def main():
    ap = argparse.ArgumentParser(description=__doc__.splitlines()[0])
    ap.add_argument("--release", required=True)
    ap.add_argument("--commit", required=True)
    ap.add_argument("build", type=Path)
    ap.add_argument("out", type=Path)
    args = ap.parse_args()
    args.out.mkdir(parents=True, exist_ok=True)

    failed = False

    def error(path, message):
        nonlocal failed
        failed = True
        print("::error file=%s::%s" % (path, message))

    songs = []
    # By stem: "a-b.ly" sorts before "a.ly", but slug "a" before "a-b".
    for ly in sorted((ROOT / "songs").glob("*.ly"), key=lambda p: p.stem):
        slug = ly.stem
        rel = "songs/%s" % ly.name
        try:
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
        songs.append({"slug": slug, "artist": artist, "title": title, "pages": pages})

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
        "schema": 1,
        "release": args.release,
        "commit": args.commit,
        "legend": {"pages": legend_pages},
        "songs": songs,
    }
    (args.out / "charts.json").write_text(
        json.dumps(manifest, sort_keys=True, indent=2) + "\n", encoding="utf-8")
    print("%d songs, %d pages, legend %d pages -> %s" % (
        len(songs), sum(s["pages"] for s in songs), legend_pages, args.out))
    return 0


if __name__ == "__main__":
    sys.exit(main())
