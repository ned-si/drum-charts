# Drum Charts

My drum charts, written in [LilyPond](https://lilypond.org/). Every push
builds a PDF and an MP3 of each finished song in GitHub Actions; every push
to `main` publishes them as a
[release](https://github.com/ned-si/drum-charts/releases/latest).

The charts follow the structure of a song, not every note of it: one staff
per section (Intro, Verse, Chorus, ...), repeat counts above, and text
between sections for the parts that come back.

## Songs

13 songs in `songs/`:

| Artist | Title | File |
| --- | --- | --- |
| Blink 182 | What's My Age Again | `blink182-whats-my-age-again.ly` |
| Bloodhound Gang | Foxtrot Uniform Charlie Kilo | `bloodhound-gang-fuck.ly` |
| Fountains of Wayne | Stacy's Mom | `fountains-of-wayne-stacys-mom.ly` |
| Korn | Did My Time | `korn-did-my-time.ly` |
| Korn | Here to Stay | `korn-here-to-stay.ly` |
| Linkin Park | One Step Closer | `linkin-park-one-step-closer.ly` |
| Muse | Time Is Running Out | `muse-time-is-running-out.ly` |
| Papa Roach | Last Resort | `papa-roach-last-resort.ly` |
| Rage Against The Machine | Killing In The Name | `ratm-killing-in-the-name.ly` |
| System Of A Down | Toxicity | `soad-toxicity.ly` |
| Sum 41 | Fat Lip | `sum41-fat-lip.ly` |
| Trivium | Until The World Goes Cold | `trivium-until-the-world-goes-cold.ly` |
| Underschool Element | Petit Tom | `underschool-element-petit-tom.ly` |

## Layout

| Path | Holds |
| --- | --- |
| `songs/` | Finished songs, built and published by CI |
| `drafts/` | Songs in progress (create it when needed); not built by CI |
| `legend.ly` | The legend, built to `legend.pdf` |
| `lib/definitions.ly` | Note heads, staff positions and the shortcuts every song uses |
| `lib/audio.ly` | Turns the scores of a song into one MIDI file |
| `Makefile` | The build, locally and in CI |
| `.github/workflows/build.yaml` | The CI build and release |
| `archive/` | The older charts with feet stems down, kept as they were; not built |

## Naming

- One file per song: `<artist>-<title>.ly`, lower case, words joined by
  `-` (`korn-here-to-stay.ly`, `ratm-killing-in-the-name.ly`). The PDF and
  the MP3 have the same base name.
- A new song starts in `drafts/` and moves to `songs/` when it is finished;
  then add it to the Songs table above.
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

The legend PDF (`legend.pdf` in each release) shows every note head on the
staff.

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
make clean
```

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

The `build` workflow runs on every push to any branch:

1. `charts`: `make all` with LilyPond 2.24.4 in `codello/lilypond`, pinned
   by digest, and FluidSynth with `FluidR3_GM.sf2`, checked against its
   SHA-256. It fails if an MP3 is silent, then uploads the PDFs and MP3s as
   the artifact `drum-charts-<sha>` (kept 7 days).
2. `release`, on `main` only: creates the release
   `charts-<date>-<short sha>` with every PDF and MP3 of that build.

Actions are pinned to commit SHAs. The workflow token is read-only except
for `contents: write` in the `release` job. Releases replace the PDFs that
used to be committed in `pdf/`: they do not expire, link to the file itself
and are tied to the commit they were built from.

## License

The charts are licensed under [CC BY 4.0](LICENSE). The songs belong to
their authors; these are my transcriptions of the drum parts.
