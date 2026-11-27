"""Unit tests of scripts/release-plan.py, each in a temporary git repository."""

import json
import os
import shutil
import subprocess
import tempfile
import unittest
from pathlib import Path

SCRIPTS = Path(__file__).resolve().parent.parent / "scripts"
# Hermetic git: no user config (signing), fixed identity.
ENV = dict(os.environ, GIT_CONFIG_GLOBAL=os.devnull, GIT_CONFIG_NOSYSTEM="1",
           GIT_AUTHOR_NAME="t", GIT_AUTHOR_EMAIL="t@example.com",
           GIT_COMMITTER_NAME="t", GIT_COMMITTER_EMAIL="t@example.com")


class Repo:
    def __init__(self, path):
        self.path = path
        self.day = 0
        self.git("init", "-q", "-b", "main")
        shutil.copytree(SCRIPTS, path / "scripts")
        self.write("legend.ly", "legend\n")
        self.write("lib/definitions.ly", "lib\n")
        self.write("songs/a-b.ly", "a-b\n")
        self.write("songs/c-d.ly", "c-d\n")
        self.first = self.commit("init")

    def git(self, *args):
        return subprocess.run(["git", *args], cwd=self.path, env=ENV, check=True,
                              capture_output=True, text=True).stdout.strip()

    def write(self, rel, text):
        f = self.path / rel
        f.parent.mkdir(parents=True, exist_ok=True)
        f.write_text(text, encoding="utf-8")

    def commit(self, message, date=None):
        self.day += 1
        date = date or "2026-11-%02dT12:00:00+00:00" % self.day
        env = dict(ENV, GIT_AUTHOR_DATE=date, GIT_COMMITTER_DATE=date)
        self.git("add", "-A")
        subprocess.run(["git", "commit", "-q", "-m", message], cwd=self.path, env=env,
                       check=True, capture_output=True)
        return self.git("rev-parse", "HEAD")

    def plan(self, *args, releases=None, cwd=None):
        cwd = cwd or self.path
        if releases is not None:
            (cwd / "releases.json").write_text(json.dumps(releases), encoding="utf-8")
            args = ("--releases", "releases.json") + args
        res = subprocess.run(["python3", "scripts/release-plan.py", *args, "plan.json"],
                             cwd=cwd, env=ENV, capture_output=True, text=True)
        if res.returncode != 0:
            return res, None
        plan = json.loads((cwd / "plan.json").read_text(encoding="utf-8"))
        return res, {c["slug"]: c for c in plan["charts"]}


def release(tag, assets, draft=False):
    return {"tag_name": tag, "draft": draft,
            "assets": [{"name": a, "state": "uploaded"} for a in assets]}


class ReleasePlanTest(unittest.TestCase):
    def setUp(self):
        self.tmp = tempfile.TemporaryDirectory()
        self.repo = Repo(Path(self.tmp.name))

    def tearDown(self):
        self.tmp.cleanup()

    def plan(self, *args, **kw):
        res, charts = self.repo.plan(*args, **kw)
        self.assertEqual(res.returncode, 0, res.stderr)
        return charts

    def test_song_changed_in_last_commit(self):
        self.repo.write("songs/a-b.ly", "a-b v2\n")
        c = self.repo.commit("a-b")
        charts = self.plan()
        self.assertEqual(charts["a-b"]["tag"], "a-b-2026-11-02-" + c[:7])
        self.assertEqual(charts["a-b"]["commit"], c)
        self.assertEqual(charts["c-d"]["commit"], self.repo.first)
        self.assertEqual(list(charts), ["legend", "a-b", "c-d"])
        self.assertEqual(charts["legend"]["assets"], ["legend.pdf"])
        self.assertEqual(charts["a-b"]["assets"], ["a-b.pdf", "a-b.mp3"])

    def test_lib_change_tags_every_chart(self):
        self.repo.write("lib/definitions.ly", "lib v2\n")
        c = self.repo.commit("lib")
        charts = self.plan()
        for slug in ("legend", "a-b", "c-d"):
            self.assertEqual(charts[slug]["tag"], "%s-2026-11-02-%s" % (slug, c[:7]))

    def test_readme_commit_changes_no_tag(self):
        before = self.plan()
        self.repo.write("README.md", "readme\n")
        self.repo.commit("readme")
        self.assertEqual(self.plan(), before)

    def test_date_is_utc(self):
        self.repo.write("songs/a-b.ly", "a-b v2\n")
        c = self.repo.commit("a-b", date="2026-11-27T00:30:00+01:00")
        self.assertEqual(self.plan()["a-b"]["tag"], "a-b-2026-11-26-" + c[:7])

    def test_release_state(self):
        tags = {s: c["tag"] for s, c in self.plan().items()}
        releases = [[
            release(tags["legend"], ["legend.pdf"]),
            release(tags["a-b"], ["a-b.pdf"]),
            release(tags["c-d"], ["c-d.pdf", "c-d.mp3"], draft=True),
        ]]
        charts = self.plan(releases=releases)
        self.assertFalse(charts["legend"]["build"])
        self.assertTrue(charts["a-b"]["build"])
        self.assertTrue(charts["c-d"]["build"])
        releases[0][1] = release(tags["a-b"], ["a-b.pdf", "a-b.mp3"])
        releases[0][2]["draft"] = False
        charts = self.plan(releases=releases)
        self.assertEqual([c["build"] for c in charts.values()], [False, False, False])

    def test_legacy_release_ignored(self):
        legacy = release("charts-2026-11-01-" + self.repo.first[:7],
                         ["legend.pdf", "a-b.pdf", "a-b.mp3", "c-d.pdf", "c-d.mp3"])
        charts = self.plan(releases=[[legacy]])
        self.assertEqual([c["build"] for c in charts.values()], [True, True, True])

    def test_build_all(self):
        releases = [[release(c["tag"], c["assets"]) for c in self.plan().values()]]
        charts = self.plan("--build-all", releases=releases)
        self.assertEqual([c["build"] for c in charts.values()], [True, True, True])

    def test_renamed_song_uses_rename_commit(self):
        self.repo.git("mv", "songs/c-d.ly", "songs/c-e.ly")
        c = self.repo.commit("rename")
        charts = self.plan()
        self.assertNotIn("c-d", charts)
        self.assertEqual(charts["c-e"]["tag"], "c-e-2026-11-02-" + c[:7])

    def test_removed_song_not_in_plan(self):
        self.repo.git("rm", "-q", "songs/c-d.ly")
        self.repo.commit("remove")
        self.assertEqual(list(self.plan()), ["legend", "a-b"])

    def test_merge_commit_tags_the_merge(self):
        self.repo.git("checkout", "-q", "-b", "side")
        self.repo.write("songs/a-b.ly", "a-b v2\n")
        self.repo.commit("a-b on side")
        self.repo.git("checkout", "-q", "main")
        self.repo.write("README.md", "readme\n")
        self.repo.commit("readme")
        env = dict(ENV, GIT_AUTHOR_DATE="2026-11-10T12:00:00+00:00",
                   GIT_COMMITTER_DATE="2026-11-10T12:00:00+00:00")
        subprocess.run(["git", "merge", "-q", "--no-ff", "-m", "merge", "side"],
                       cwd=self.repo.path, env=env, check=True, capture_output=True)
        merge = self.repo.git("rev-parse", "HEAD")
        self.assertEqual(self.plan()["a-b"]["tag"], "a-b-2026-11-10-" + merge[:7])

    def test_shallow_clone_fails(self):
        self.repo.write("README.md", "readme\n")
        self.repo.commit("readme")
        clone = Path(self.tmp.name) / "shallow"
        subprocess.run(["git", "clone", "-q", "--depth", "1",
                        "file://%s" % self.repo.path, str(clone)],
                       env=ENV, check=True, capture_output=True)
        shutil.copytree(SCRIPTS, clone / "scripts", dirs_exist_ok=True)
        res, _ = self.repo.plan(cwd=clone)
        self.assertEqual(res.returncode, 1)
        self.assertIn("shallow clone; check out with fetch-depth: 0", res.stderr)


if __name__ == "__main__":
    unittest.main()
