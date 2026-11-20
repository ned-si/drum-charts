LILYPOND ?= lilypond
FLUIDSYNTH ?= fluidsynth
FFMPEG ?= ffmpeg
SOUNDFONT ?= /usr/share/sounds/sf2/FluidR3_GM.sf2

SONGS := $(notdir $(basename $(wildcard songs/*.ly)))
LYFLAGS := -I $(CURDIR)/lib -dno-point-and-click

.PHONY: all pdf midi audio clean
.SECONDARY:

all: pdf audio
pdf: build/legend.pdf $(SONGS:%=build/%.pdf)
midi: $(SONGS:%=build/%.midi)
audio: $(SONGS:%=build/%.mp3)

build:
	mkdir -p $@

build/legend.pdf: legend.ly lib/definitions.ly | build
	$(LILYPOND) $(LYFLAGS) -o build/legend $<

build/%.pdf: songs/%.ly lib/definitions.ly | build
	$(LILYPOND) $(LYFLAGS) -o build/$* $<

# One MIDI per song: lib/audio.ly collects every score of the song.
build/%.midi: songs/%.ly lib/definitions.ly lib/audio.ly | build
	printf '\\version "2.24.0"\n\\include "audio.ly"\n\\include "%s"\n\\audioScore\n' \
	  "$(CURDIR)/$<" > build/$*.audio.ly
	$(LILYPOND) $(LYFLAGS) -dno-print-pages -o build/$* build/$*.audio.ly

build/%.wav: build/%.midi
	$(FLUIDSYNTH) -n -i -q -r 44100 -F $@ $(SOUNDFONT) $<

build/%.mp3: build/%.wav
	$(FFMPEG) -nostdin -loglevel error -y -i $< -af loudnorm=I=-16:TP=-1.5 -codec:a libmp3lame -q:a 2 $@

clean:
	rm -rf build
