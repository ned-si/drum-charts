"""Unit tests of scripts/site-data.py: the plan rules and the render."""

import json
import shutil
import subprocess
import tempfile
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
PDF = ROOT / "archive" / "pdf-stems-down" / "legend.pdf"
SONG = '\\header {\n  title = "Artist"\n  subtitle = "Title"\n}\n'
COMMIT = "0123456789abcdef0123456789abcdef01234567"


def entry(slug):
    return {"slug": slug, "commit": COMMIT, "date": "2026-11-27",
            "tag": "%s-2026-11-27-0123456" % slug}


class SiteDataTest(unittest.TestCase):
    def setUp(self):
        self.tmp = tempfile.TemporaryDirectory()
        self.dir = Path(self.tmp.name)
        shutil.copytree(ROOT / "scripts", self.dir / "scripts")
        (self.dir / "songs").mkdir()
        (self.dir / "build").mkdir()
        shutil.copyfile(PDF, self.dir / "build" / "legend.pdf")
        self.song("a-b")

    def tearDown(self):
        self.tmp.cleanup()

    def song(self, slug):
        (self.dir / "songs" / ("%s.ly" % slug)).write_text(SONG, encoding="utf-8")
        shutil.copyfile(PDF, self.dir / "build" / ("%s.pdf" % slug))

    def run_site_data(self, slugs):
        plan = {"charts": [entry(s) for s in slugs], "head": COMMIT}
        (self.dir / "plan.json").write_text(json.dumps(plan), encoding="utf-8")
        return subprocess.run(
            ["python3", "scripts/site-data.py", "--plan", "plan.json", "build", "out"],
            cwd=self.dir, capture_output=True, text=True)

    def assertFails(self, res, message):
        self.assertEqual(res.returncode, 1, res.stdout + res.stderr)
        self.assertIn(message, res.stdout)

    def test_plan_missing_a_song(self):
        self.song("c-d")
        res = self.run_site_data(["legend", "a-b"])
        self.assertFails(res, "::error file=plan.json::c-d is not in the plan")

    def test_plan_with_a_song_not_in_songs(self):
        res = self.run_site_data(["legend", "a-b", "x-y"])
        self.assertFails(res, "::error file=plan.json::x-y is in the plan but not in songs/")

    def test_slug_charts_refused(self):
        self.song("charts")
        res = self.run_site_data(["legend", "a-b", "charts"])
        self.assertFails(res, "::error file=songs/charts.ly::slug 'charts': "
                              "the prefix of the legacy release tags")

    # The site-data job compares page images with those of :main.
    def test_render_is_deterministic(self):
        svgs = []
        for n in (1, 2):
            svg = self.dir / ("%d.svg" % n)
            subprocess.run(["pdftocairo", "-svg", "-f", "1", "-l", "1",
                            str(self.dir / "build" / "legend.pdf"), str(svg)],
                           check=True, capture_output=True)
            svgs.append(svg.read_bytes())
        self.assertEqual(svgs[0], svgs[1])


if __name__ == "__main__":
    unittest.main()
