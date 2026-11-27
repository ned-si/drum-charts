#!/usr/bin/env python3
"""Plan the song releases: each chart's version tag and whether to build it.
Usage: release-plan.py [--releases <file>] [--build-all] <plan.json>
Run from the repository root, on a full clone. --releases is the output of
gh api --paginate --slurp repos/<repo>/releases; without it every chart is
built. The rules are ned-si/homelab
.kiro/specs/drum-charts-per-song-releases/design.md#the-plan.
"""
import argparse
import json
import subprocess
import sys
from datetime import datetime, timezone
from pathlib import Path


def git(*args):
    return subprocess.run(["git", *args], check=True, capture_output=True,
                          text=True).stdout.strip()


def fail(message):
    print(message, file=sys.stderr)
    sys.exit(1)


def read_releases(path):
    try:
        pages = json.loads(Path(path).read_text(encoding="utf-8"))
    except (OSError, ValueError):
        pages = None
    if not isinstance(pages, list) or not all(
            isinstance(page, list) and all(isinstance(r, dict) for r in page)
            for page in pages):
        fail("release-plan: %s is not the GitHub releases list" % path)
    return [r for page in pages for r in page]


def released(releases, tag, assets):
    """A published release of the tag holds every asset, uploaded."""
    for r in releases:
        if r.get("tag_name") != tag or r.get("draft") is not False:
            continue
        have = r.get("assets")
        if not isinstance(have, list):
            continue
        names = {a.get("name") for a in have
                 if isinstance(a, dict) and a.get("state") == "uploaded"}
        if set(assets) <= names:
            return True
    return False


def main():
    ap = argparse.ArgumentParser(description=__doc__.splitlines()[0])
    ap.add_argument("--releases")
    ap.add_argument("--build-all", action="store_true")
    ap.add_argument("plan", type=Path)
    args = ap.parse_args()

    if git("rev-parse", "--is-shallow-repository") == "true":
        fail("release-plan: shallow clone; check out with fetch-depth: 0")
    releases = read_releases(args.releases) if args.releases else None

    # By stem, the order of site-data.py.
    songs = sorted(Path("songs").glob("*.ly"), key=lambda p: p.stem)
    charts = [("legend", "legend.ly", ["legend.pdf"])] + [
        (p.stem, "songs/" + p.name, [p.stem + ".pdf", p.stem + ".mp3"]) for p in songs]
    committed = set(git("ls-tree", "-r", "--name-only", "HEAD", "--",
                        "legend.ly", "songs").splitlines())

    plan = []
    for slug, path, assets in charts:
        if path not in committed:
            fail("%s: not in the git history of HEAD" % path)
        # No --follow: a renamed song's history starts at the rename.
        commit, ctime = git("log", "-1", "--first-parent", "--format=%H %ct",
                            "HEAD", "--", path, "lib").split()
        date = datetime.fromtimestamp(int(ctime), timezone.utc).strftime("%Y-%m-%d")
        tag = "%s-%s-%s" % (slug, date, commit[:7])
        build = (args.build_all or releases is None
                 or not released(releases, tag, assets))
        plan.append({"assets": assets, "build": build, "commit": commit,
                     "date": date, "slug": slug, "tag": tag})

    args.plan.write_text(json.dumps({"charts": plan, "head": git("rev-parse", "HEAD")},
                                    sort_keys=True, indent=2) + "\n", encoding="utf-8")
    built = [c["slug"] for c in plan if c["build"]]
    print("%d of %d charts to build%s" % (
        len(built), len(plan), ": " + " ".join(built) if built else ""))
    return 0


if __name__ == "__main__":
    sys.exit(main())
