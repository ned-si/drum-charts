# Drum Charts

My drum charts, written in [LilyPond](https://lilypond.org/). GitHub
Actions builds a PDF and an MP3 of each finished song that changed; every
change to a song on `main` publishes a
[release](https://github.com/ned-si/drum-charts/releases) of that song.

The charts follow the structure of a song, not every note of it: one staff
per section (Intro, Verse, Chorus, ...), repeat counts above, and text
between sections for the parts that come back.

## Songs

Read or download every chart at [charts.nedsi.io](https://charts.nedsi.io/).

14 finished songs in `songs/`. The Releases link of a song lists every
version of it, newest first, each with its PDF and MP3.

| Title | Artist | Chart | PDF | Releases |
| --- | --- | --- | --- | --- |
| What's My Age Again | Blink 182 | [`blink182-whats-my-age-again.ly`](songs/blink182-whats-my-age-again.ly) | [PDF](https://charts.nedsi.io/pdf/blink182-whats-my-age-again.pdf) | [Releases](https://github.com/ned-si/drum-charts/releases?q=blink182-whats-my-age-again&expanded=true) |
| Foxtrot Uniform Charlie Kilo | Bloodhound Gang | [`bloodhound-gang-foxtrot-uniform-charlie-kilo.ly`](songs/bloodhound-gang-foxtrot-uniform-charlie-kilo.ly) | [PDF](https://charts.nedsi.io/pdf/bloodhound-gang-foxtrot-uniform-charlie-kilo.pdf) | [Releases](https://github.com/ned-si/drum-charts/releases?q=bloodhound-gang-foxtrot-uniform-charlie-kilo&expanded=true) |
| Stacy's Mom | Fountains of Wayne | [`fountains-of-wayne-stacys-mom.ly`](songs/fountains-of-wayne-stacys-mom.ly) | [PDF](https://charts.nedsi.io/pdf/fountains-of-wayne-stacys-mom.pdf) | [Releases](https://github.com/ned-si/drum-charts/releases?q=fountains-of-wayne-stacys-mom&expanded=true) |
| Did My Time | Korn | [`korn-did-my-time.ly`](songs/korn-did-my-time.ly) | [PDF](https://charts.nedsi.io/pdf/korn-did-my-time.pdf) | [Releases](https://github.com/ned-si/drum-charts/releases?q=korn-did-my-time&expanded=true) |
| Here to Stay | Korn | [`korn-here-to-stay.ly`](songs/korn-here-to-stay.ly) | [PDF](https://charts.nedsi.io/pdf/korn-here-to-stay.pdf) | [Releases](https://github.com/ned-si/drum-charts/releases?q=korn-here-to-stay&expanded=true) |
| One Step Closer | Linkin Park | [`linkin-park-one-step-closer.ly`](songs/linkin-park-one-step-closer.ly) | [PDF](https://charts.nedsi.io/pdf/linkin-park-one-step-closer.pdf) | [Releases](https://github.com/ned-si/drum-charts/releases?q=linkin-park-one-step-closer&expanded=true) |
| Time Is Running Out | Muse | [`muse-time-is-running-out.ly`](songs/muse-time-is-running-out.ly) | [PDF](https://charts.nedsi.io/pdf/muse-time-is-running-out.pdf) | [Releases](https://github.com/ned-si/drum-charts/releases?q=muse-time-is-running-out&expanded=true) |
| Last Resort | Papa Roach | [`papa-roach-last-resort.ly`](songs/papa-roach-last-resort.ly) | [PDF](https://charts.nedsi.io/pdf/papa-roach-last-resort.pdf) | [Releases](https://github.com/ned-si/drum-charts/releases?q=papa-roach-last-resort&expanded=true) |
| Killing In The Name | Rage Against The Machine | [`ratm-killing-in-the-name.ly`](songs/ratm-killing-in-the-name.ly) | [PDF](https://charts.nedsi.io/pdf/ratm-killing-in-the-name.pdf) | [Releases](https://github.com/ned-si/drum-charts/releases?q=ratm-killing-in-the-name&expanded=true) |
| Toxicity | System Of A Down | [`soad-toxicity.ly`](songs/soad-toxicity.ly) | [PDF](https://charts.nedsi.io/pdf/soad-toxicity.pdf) | [Releases](https://github.com/ned-si/drum-charts/releases?q=soad-toxicity&expanded=true) |
| Schism | Tool | [`tool-schism.ly`](songs/tool-schism.ly) | [PDF](https://charts.nedsi.io/pdf/tool-schism.pdf) | [Releases](https://github.com/ned-si/drum-charts/releases?q=tool-schism&expanded=true) |
| Fat Lip | Sum 41 | [`sum41-fat-lip.ly`](songs/sum41-fat-lip.ly) | [PDF](https://charts.nedsi.io/pdf/sum41-fat-lip.pdf) | [Releases](https://github.com/ned-si/drum-charts/releases?q=sum41-fat-lip&expanded=true) |
| Until The World Goes Cold | Trivium | [`trivium-until-the-world-goes-cold.ly`](songs/trivium-until-the-world-goes-cold.ly) | [PDF](https://charts.nedsi.io/pdf/trivium-until-the-world-goes-cold.pdf) | [Releases](https://github.com/ned-si/drum-charts/releases?q=trivium-until-the-world-goes-cold&expanded=true) |
| Petit Tom | Underschool Element | [`underschool-element-petit-tom.ly`](songs/underschool-element-petit-tom.ly) | [PDF](https://charts.nedsi.io/pdf/underschool-element-petit-tom.pdf) | [Releases](https://github.com/ned-si/drum-charts/releases?q=underschool-element-petit-tom&expanded=true) |

## Next

In progress, listed here until their pull request merges: none.

## Layout

| Path | Holds |
| --- | --- |
| `songs/` | Finished songs, built and published by CI |
| `drafts/` | Songs in progress (create it when needed); not built by CI |
| `legend.ly` | The legend, built to `legend.pdf` |
| `lib/definitions.ly` | Note heads, staff positions and the shortcuts every song uses |
| `lib/audio.ly` | Turns the scores of a song into one MIDI file |
| `Makefile` | The build, locally and in CI |
| `scripts/release-plan.py` | The plan: each chart's version tag and which charts to build |
| `scripts/site-data.py` | Turns the PDFs of every chart into the site data of [charts.nedsi.io](https://charts.nedsi.io): page images, PDFs and `charts.json` |
| `tests/` | Unit tests of both scripts |
| `site-data.Dockerfile` | The data image `ghcr.io/ned-si/drum-charts`: the site data only, never run |
| `.github/workflows/build.yaml` | The CI build, release and data image |
| `archive/` | The older charts with feet stems down, kept as they were; not built |

## Naming

- One file per song: `<artist>-<title>.ly`, lower case, words joined by
  `-` (`korn-here-to-stay.ly`, `ratm-killing-in-the-name.ly`). The PDF and
  the MP3 have the same base name. The base name is the chart's URL on
  the site: lower-case words joined by `-`, at most 80 characters, and
  not `fr`, `pdf`, `pages`, `legend` or `set-theme` (paths of the site),
  nor `charts` (the prefix of the old release tags).
- In the `\header`, `title` is the artist and `subtitle` the song, each
  one plain quoted string (`title = "Tool"`, `subtitle = "Schism"`); the
  site reads them, and CI fails on a `\markup` or an escaped quote there,
  on a commented-out `% title = ...` line, and on a one-line
  `\header { ... }`: `\header {` and its closing `}` each take a line.
- A new song starts in `drafts/` and moves to `songs/` when it is finished;
  then move it from Next to the Songs table above.
- A chart fits on 2 A4 pages, so it never needs a page turn. A long song
  may take 3: add the line `% chart: long` to its file. Repeats with
  alternative endings, `\repeat percent`, multi-bar rests and the staff size
  are the tools to get there.
- A correction is an edit of the song, not a new file: git history and the
  releases keep every earlier version.
- Every song starts with `\include "definitions.ly"` and sets the custom
  note heads in its `\layout` (copy the header of an existing song).

## Notation

All stems are up, hands and feet in one voice. Staff positions, from the
bottom:

| Instrument | Code | Note head | Position |
| --- | --- | --- | --- |
| Second bass drum | `bda` | normal | below the staff, second ledger line |
| Hi-hat pedal | `hhp` | cross | just below the staff |
| Closed hi-hat (foot) | `hhc` | circled cross | just below the staff |
| Bass drum | `bd` | normal | first space |
| Low floor tom | `tomfl` | normal | second line |
| High floor tom | `tomfh` | normal | second space |
| Snare, side stick | `sn`, `ss` | normal, cross | third space |
| Low tom | `toml` | normal | fourth line |
| High tom | `tomh` | normal | fourth space |
| Cowbell | `cb` | black diamond | top line |
| Hi-hat, open hi-hat | `hh`, `hho` | cross, circled cross | just above the staff |
| Ride, ride bell | `cymr`, `rb` | cross, black diamond | first ledger line above |
| Crash | `cymc` | cross | above the ride |
| China | `cymch` | circled cross | highest |

Shortcuts from `lib/definitions.ly`:

| Write | Shows |
| --- | --- |
| `sn^\act` | accent |
| `sn_\right`, `sn_\left` | sticking: filled circle right hand, open circle left hand |
| `\ghost sn` | ghost note, small and in brackets |
| `\flam sn`, `\drag sn`, `\ruff sn` | one, two or three grace notes |
| `\makePercent s1`, `\makePercentRepeat "x2" s1` | repeat the previous bar |

The legend PDF (`legend.pdf` in the legend's releases,
`legend-<date>-<sha>`) shows every note head on the staff.

## Build locally

Needs LilyPond 2.24, and for the audio FluidSynth, FFmpeg and a General MIDI
soundfont. On macOS:

```sh
brew install lilypond fluid-synth ffmpeg
```

and a GM soundfont, for example `FluidR3_GM.sf2` from the Ubuntu
`fluid-soundfont-gm` package or [GeneralUser GS](https://schristiancollins.com/generaluser.php).

```sh
make pdf                                  # build/*.pdf and build/legend.pdf
make audio SOUNDFONT=~/FluidR3_GM.sf2     # build/*.mp3
make build/korn-here-to-stay.pdf          # one song
make site-data                            # build/site-data, as CI builds it
make clean
```

`make site-data` needs every song committed: a chart's version tag comes
from git. `make pdf` does not.

On Linux with `fluid-soundfont-gm` installed, `make` builds both with the
default soundfont path.

## Audio

`make audio` goes from the chart to an MP3 in three steps:

1. `lib/audio.ly` collects every `\score` of the song, in written order,
   unfolds the repeats and writes one MIDI file. LilyPond puts a drum staff
   on MIDI channel 10, the General MIDI drum channel, with the standard drum
   notes.
2. FluidSynth plays it with the soundfont to a WAV file.
3. FFmpeg normalises the loudness and encodes the MP3.

The audio plays what is engraved: the text between sections ("Verse - only
2x") and `\makePercent` bars are not played, and accents and ghost notes
sound at the normal volume. It is a check of the rhythms and the tempo, not
a backing track.

## CI

Each chart (a song, or the legend) has its own releases. A change to a
chart's release inputs publishes a release of that chart; any other change
(this README, `archive/`, `scripts/`, the `Makefile`, the workflow)
publishes none:

| Chart | Release inputs |
| --- | --- |
| Song `<slug>` | `songs/<slug>.ly`, `lib/**` |
| Legend | `legend.ly`, `lib/**` |

A change under `lib/` publishes every chart. A chart's version tag is
`<slug>-<date>-<sha>` of the last commit on `main` that changed one of its
release inputs, with that commit's date in UTC and its short sha
(`tool-schism-2026-11-26-5387aa2`). It comes from git only, so a rerun
never makes a second release of a version. A renamed song starts its
releases under the new name; a removed song keeps its releases.

The `build` workflow runs on every push to any branch:

1. `charts`: runs the unit tests, then `scripts/release-plan.py`, which
   computes each chart's version tag and builds the charts whose tag has
   no published release, with LilyPond 2.24.4 in `codello/lilypond`,
   pinned by digest, and FluidSynth with `FluidR3_GM.sf2`, checked against
   its SHA-256. On a branch that changes the `Makefile` or the workflow it
   builds every chart. When nothing is to be built it installs none of
   these tools. It fails if an MP3 is silent or a PDF has more than 3
   pages, and warns at 3 pages unless the song is marked long. It uploads
   the charts it built as the artifact `drum-charts-<sha>` (kept 7 days),
   downloads the PDFs of the others from their releases, and
   `scripts/site-data.py` builds the site data of every chart (`make
   site-data` locally), uploaded as `site-data-<sha>`.
2. `release`, on the head of `main` only: publishes a release per chart
   built, named by its version tag and holding its PDF and MP3 (the
   legend: its PDF). Each is a draft until its files are uploaded, then
   published as GitHub's Latest, so Latest is the chart version published
   last.
3. `site-data`, on the head of `main` only: checks the PDFs of the site
   data are the releases', and compares the site data with the files of
   `ghcr.io/ned-si/drum-charts:main`. When they differ it publishes the
   site data as `ghcr.io/ned-si/drum-charts:<sha>` (linux/amd64 and
   linux/arm64, with a signed provenance and a cosign signature) and moves
   `:main` to it; when they are equal it publishes nothing.
   ned-si/homelab builds charts.nedsi.io from `:main`.

The releases named `charts-<date>-<sha>` come from the workflow before
per-song releases, one per push with every chart. They stay as they were,
and nothing reads them.

Actions are pinned to commit SHAs. The workflow token is read-only except
for `contents: write` in the `release` job and `packages: write` (with the
OIDC token and attestations) in the `site-data` job. Releases replace the
PDFs that used to be committed in `pdf/`: they do not expire, link to the
file itself and are tied to the commit they were built from.

## License

The charts are licensed under [CC BY 4.0](LICENSE). The songs belong to
their authors; these are my transcriptions of the drum parts.
