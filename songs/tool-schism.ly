\version "2.24.4"
\include "definitions.ly"
% chart: long
\layout{
  \set DrumStaff.drumStyleTable = #(alist->hash-table custom-notes)
}
#(set-global-staff-size 17)
\paper {
  system-system-spacing.basic-distance = #10
  score-system-spacing.basic-distance = #10
  markup-system-spacing.basic-distance = #8
}
\header {
  title = "Tool"
  subtitle = "Schism"
  composer = "nedsi"
  tagline = #f
}
% Cymbals from the Drumeo part: its circled cross on a ledger line is the
% china (cymch), its bow-tie cross and its plain cross on a ledger line are
% both the crash (cymc).
% TODO(operator): check the bow-tie cymbal; mapped to the crash.
% Toms: the Drumeo top-line and top-space toms are both tomh here.

%% The riff phrases. Each is the 4 bars the bass riff takes, whatever the
%% meters inside it; the drums follow its "pa-la-la-la la la la" phrasing.

hhTriplet = \drummode { \tuplet 3/2 { <hh bd>16 hh hh } }
tomTriplet = \drummode { \tuplet 3/2 { tomfh16 bd bda } }
sextuplet = \drummode { \tuplet 6/4 { tomfh16 bd bda tomfh bd bda } }

% Verse groove, 4-bar phrase: 5/8 7/8 5/8 7/8. The first seven opens the
% hi-hat on a quarter, the second closes the phrase on two eighths.
fiveEnd = \drummode { <hh sn>8 hh \hhTriplet }
five = \drummode { \time 2,3 5/8 <hh bd>8 hh \fiveEnd }
sevenOpen = \drummode {
  \time 2,2,3 7/8 <hh bd>8 hh <hho bd>4 <sn hhp>8 hh \hhTriplet
}
sevenClose = \drummode {
  \time 2,2,3 7/8 <hh bd>8 hh <hh bd> <hho bd> <sn hhp> hh \hhTriplet
}
verseGroove = { \five \sevenOpen \five \sevenClose }

% Interlude riff, 4-bar phrase: 6/8 7/8 6/8 7/8, quiet then loud.
sevenRiff = \drummode {
  \time 2,2,3 7/8 <hh bd>8 hh <hh sn>16 hh hh8 <hh bd> hh
  \tuplet 3/2 { tomfh16 toml bd }
}
sixLoud = \drummode {
  \time 6/8 <hh sn>8 hh <tomfh bd> <cymc bd> hh \tuplet 3/2 { sn16 tomh bd }
}
sevenLoud = \drummode {
  \time 2,2,3 7/8 <hh sn>8 hh <rb bd> hh <rb sn> hh \tuplet 3/2 { sn16 tomh bd }
}
interludeQuiet = \drummode {
  \repeat volta 2 {
    \alternative {
      \volta 1 { \time 6/8 <cymc sn>8 hh <tomfh bd> <cymc bd> r <hh bd> }
      \volta 2 { \time 6/8 <hh sn>8 hh <tomfh bd> <cymc bd> r <hh bd> }
    }
    \sevenRiff
  }
}

% Chorus bar after its first quarter: 5 beats.
chorusTail = \drummode {
  <hho bd>8^\act <hh bd> <hh bd>16 <hho sn>^\act <hho bd>8^\act
  <hho bd>^\act <hho bd>^\act \tuplet 3/2 { tomfh16 toml bd } <cymc sn>8
}

% Verse 4 riff, 4-bar phrase: 4/4 4/4 6/8 6/8.
fourA = \drummode {
  \time 4/4 <hh sn>8 hh <hh bd> <hh bd> <hh sn>16 hh hh8 <hh bd> hh
}
fourB = \drummode {
  <hh sn>16 hh hh8 <hh bd> <hh bd> <hh sn> hh <hh bd> hh16 bd32 bda
}
sixC = \drummode { \time 6/8 \repeat unfold 2 { <cymc sn>8 q hh16 bd } }
sixD = \drummode { <cymc sn>8 q bd <cymc cymch bd> r bd }

% Verse 5, 4-bar phrase: 5/8 7/8 5/8 7/8, toms and both bass drums.
fiveSext = \drummode {
  \time 2,3 5/8 <toml tomfh>8^\act tomfh16 bd \flam sn8^\act \sextuplet
}
sevenSext = \drummode {
  \time 2,2,3 7/8 <toml tomfh>8^\act tomfh16 bd <toml tomfh>8^\act tomfh16 bd
  \flam sn8^\act \sextuplet
}
fiveTri = \drummode {
  \time 2,3 5/8 <toml tomfh>8^\act \tomTriplet \flam sn8^\act \sextuplet
}

% Outro, one bar of 4/4 per riff turn.
outroTail = \drummode {
  <cymc sn>8 bd \tomTriplet <cymc sn>8 \tomTriplet <cymc sn>8
}
sextChord = \drummode { \tuplet 6/4 { tomfh16 bd bda <toml sn>^\act bd bda } }
sextFlam = \drummode { \tuplet 6/4 { \flam sn16^\act bd bda tomfh bd bda } }

% Custom markup to create vertical space after header
\markup {
  \vspace #-1
}
\score {
  \layout{ ragged-right = ##f }
  \new DrumStaff {
    \override Score.MetronomeMark.outside-staff-horizontal-padding = 1
    \tempo 4 = 108
    \set DrumStaff.instrumentName = #"Intro"
    \new DrumVoice = "all" {
      \voiceOne
      <>^\markup \bold "4-bar phrase ×2, rest"
      \bar ".|:-|"
      \repeat volta 2 {
        \drummode {
          \time 2,3 5/8 R8*5 \time 2,2,3 7/8 R8*7 \time 2,3 5/8 R8*5
          \alternative {
            \volta 1 { \time 2,2,3 7/8 R8*7 }
            \volta 2 { \time 2,2,3 7/8 r2 r4 \tuplet 3/2 { tomh16 tomh tomh } }
          }
        }
      }
      <>^\markup \bold "4-bar phrase ×2"
      <>_\markup "Snare wires off."
      \repeat volta 2 {
        \drummode {
          \alternative {
            \volta 1 { \time 2,3 5/8 <tomh bd>8 hh \fiveEnd }
            \volta 2 { \five }
          }
          \sevenOpen \five \sevenClose
        }
      }
      \bar "|."
    }
  }
}
\score {
  \layout{ ragged-right = ##f }
  \new DrumStaff {
    \set DrumStaff.instrumentName = #"Verse 1"
    \new DrumVoice = "all" {
      \voiceOne
      <>^\markup \bold "4-bar phrase ×4"
      \bar ".|:-|"
      \repeat volta 4 {
        \drummode {
          \alternative {
            \volta 1,4 { \time 2,3 5/8 <cymch bd>4 \fiveEnd }
            \volta 2 { \five }
            \volta 3 { \time 2,3 5/8 <cymc bd>4 \fiveEnd }
          }
          \sevenOpen
          \alternative {
            \volta 1,2,3 { \five }
            \volta 4 { \time 2,3 5/8 <cymc bd>4 \fiveEnd }
          }
          \alternative {
            \volta 1,2,3 { \sevenClose }
            \volta 4 {
              \time 2,2,3 7/8 <hh bd>8 hh <hh bd> <hho bd> <sn hhp> hh
              \tuplet 3/2 { <tomh bd>16 tomh tomh }
            }
          }
        }
      }
      \bar ":|."
      <>^\markup \bold "4-bar phrase ×2, toms"
      \repeat volta 2 {
        \drummode {
          \time 2,3 5/8 <tomh bd>8 hh <hh sn> hh \tuplet 3/2 { <tomh bd>16 tomh tomh }
          \time 2,2,3 7/8 <tomh bd>8 hh <hho bd>4 <sn hhp>8 hh
          \tuplet 3/2 { <tomh bd>16 tomh tomh }
          \time 2,3 5/8 <tomh bd>8 hh <hh sn> hh \tuplet 3/2 { <tomh bd>16 tomh tomh }
          \alternative {
            \volta 1 {
              \time 2,2,3 7/8 <tomh bd>8 hh <hh bd> <hho bd> <sn hhp> hh
              \tuplet 3/2 { <tomh bd>16 tomh tomh }
            }
            \volta 2 {
              \time 2,2,3 7/8 <tomh bd>8\< hh <hh bd> <hho bd> <hho sn> hho
              \tuplet 3/2 { tomfh16 toml bd\! }
            }
          }
        }
      }
      \bar "|."
    }
  }
}
\score {
  \layout{ ragged-right = ##f }
  \new DrumStaff {
    \set DrumStaff.instrumentName = #"Interlude 1"
    \new DrumVoice = "all" {
      \voiceOne
      <>^\markup \bold "4-bar phrase ×2"
      \bar ".|:-|"
      \interludeQuiet
      \repeat volta 2 {
        \drummode {
          \sixLoud
          \alternative {
            \volta 1 { \sevenLoud }
            \volta 2 {
              \time 2,2,3 7/8 <hh sn>8 hh <rb bd> hh <toml sn bd> <toml bd>
              \tuplet 3/2 { <tomfh bd>16 sn sn }
            }
          }
        }
      }
      \bar "|."
    }
  }
}
\score {
  \layout{ ragged-right = ##f }
  \new DrumStaff {
    \set DrumStaff.instrumentName = #"Verse 2"
    \new DrumVoice = "all" {
      \voiceOne
      <>^\markup \bold "4-bar phrase ×4"
      \bar ".|:-|"
      \repeat volta 4 {
        \drummode {
          \alternative {
            \volta 1 { \time 2,3 5/8 <cymch bd>4 \fiveEnd }
            \volta 2 { \five }
            \volta 3 { \time 2,3 5/8 <cymc bd>4 \fiveEnd }
            \volta 4 { \time 2,3 5/8 <rb bd>4 \fiveEnd }
          }
          \alternative {
            \volta 1,2,3 { \sevenOpen }
            \volta 4 {
              \time 2,2,3 7/8 <rb bd>4 <hho bd> <sn hhp>8 hh \hhTriplet
            }
          }
          \five
          \alternative {
            \volta 1,2,3 { \sevenClose }
            \volta 4 {
              \time 2,2,3 7/8 <hh bd>8\< hho <hho bd> <hho bd> <hho sn> hho
              \tuplet 3/2 { tomfh16 toml bd\! }
            }
          }
        }
      }
      \bar "|."
    }
  }
}
\score {
  \layout{ ragged-right = ##f }
  \new DrumStaff {
    \set DrumStaff.instrumentName = #"Interlude 2"
    \new DrumVoice = "all" {
      \voiceOne
      <>^\markup \bold "4-bar phrase ×2"
      \bar ".|:-|"
      \interludeQuiet
      \repeat volta 2 {
        \drummode {
          \sixLoud
          \alternative {
            \volta 1 { \sevenLoud }
            \volta 2 {
              \time 2,2,3 7/8 <hh sn>8 hh <rb bd> hh <toml sn bd> <tomfh bd> q
            }
          }
        }
      }
      \bar "|."
    }
  }
}
\score {
  \layout{ ragged-right = ##f }
  \new DrumStaff {
    \set DrumStaff.instrumentName = #"Chorus"
    \new DrumVoice = "all" {
      \voiceOne
      \numericTimeSignature
      \bar ".|:-|"
      \repeat volta 2 {
        \drummode {
          \time 6/4
          \alternative {
            \volta 1 { <cymch bd>4 <hh sn>8^\act hh16 \ghost sn \chorusTail }
            \volta 2 { <cymc bd>4 <hh sn>8^\act hh16 \ghost sn \chorusTail }
          }
        }
      }
      \drummode {
        <cymc bd>4 <hho sn>8^\act hho16 \ghost sn \chorusTail
        \time 11/8
        <cymc bd>4 <hho sn>8^\act hho16 \ghost sn <hho bd>8^\act <hho bd>16
        hhp <hh bd> <hho sn>^\act <hho bd>8^\act <hho bd>^\act <hho bd>^\act
        \tuplet 3/2 { tomfh16 toml bd }
        \time 2,3 5/8 <sn hhp>4 r4.
        \time 2,2,3 7/8 r2 <cymch sn>4^\act \hhTriplet
      }
      \bar "|."
    }
  }
}
\score {
  \layout{ ragged-right = ##f }
  \new DrumStaff {
    \set DrumStaff.instrumentName = #"Verse 3"
    \new DrumVoice = "all" {
      \voiceOne
      <>^\markup \bold "4-bar phrase ×4"
      \bar ".|:-|"
      \repeat volta 4 {
        \drummode {
          \alternative {
            \volta 1,2,3 { \five }
            \volta 4 { \time 2,3 5/8 <hh bd>8 hh <hh sn>16 bd hh8 \hhTriplet }
          }
          \sevenOpen \five
          \alternative {
            \volta 1,3 { \sevenClose }
            \volta 2 {
              \time 2,2,3 7/8 <hh bd>8 hh <hh bd> <hh bd> <hh sn> hh \hhTriplet
            }
            \volta 4 {
              \time 2,2,3 7/8 <hh bd>8 hh <hh bd> <hh bd>16\< bd <hho sn>8 hho
              \tuplet 3/2 { tomfh16 toml bd\! }
            }
          }
        }
      }
      \bar "|."
    }
  }
}
\score {
  \layout{ ragged-right = ##f }
  \new DrumStaff {
    \set DrumStaff.instrumentName = #"Interlude 3"
    \new DrumVoice = "all" {
      \voiceOne
      <>^\markup \bold "4-bar phrase ×2"
      \bar ".|:-|"
      \interludeQuiet
      \drummode {
        \time 6/8 <hh sn>8 hh <tomfh bd> <cymc bd> r <hh bd>
        \sevenRiff
        \sixLoud
        \time 4/4 <hh sn>8^\act hh16 sn^\act <sn bd>8^\act sn16 tomh^\act
        <toml bd>8^\act <sn bd>16 toml^\act <sn bd>8 <tomfh sn bd>16 toml^\act
        \break
        \time 7/4
        <cymc bd>4 sn8 <cymc bd> r bd~ <cymc bd> sn <tomfh bd> <cymc bd> r bd
        <cymch sn>4
        <hh cymc bd>8 hh <hh sn>16 hh <hh cymc bd>8 hh <hh bd> <rb bd>
        <hh sn> <tomfh bd> <cymc bd> hh <hh bd> <cymch sn>4
        <hh cymc bd>8 hh <hh sn>16 hh <hh cymc bd>8 hh16 hh <hh bd>8 <rb bd>
        sn <tomfh bd> <cymc bd> hh <hh cymc bd> sn <cymch sn>
        \time 5/4
        <cymc bd>8 <hh sn>16 bd hh tomh <cymc bd>8 <hh sn>16 bd hh tomh
        <rb bd>8 <toml sn tomfh bd> <toml sn bd> <cymc bd>
        \time 4/4 R1
      }
      \bar "|."
    }
  }
}
\score {
  \layout{ ragged-right = ##f }
  \new DrumStaff {
    \set DrumStaff.instrumentName = #"Bridge"
    \new DrumVoice = "all" {
      \voiceOne
      \drummode {
        \compressEmptyMeasures
        \override MultiMeasureRest.expand-limit = 1
      }
      <>^\markup \bold "4-bar phrase ×12, rest"
      \bar ".|:-|"
      \repeat volta 12 {
        \drummode { \time 6/8 R2.*3 \time 9/8 R8*9 }
      }
      \bar ":|."
    }
  }
}
% Page turn here, in the 48 bars of rest.
\pageBreak
\score {
  \layout{ ragged-right = ##f }
  \new DrumStaff {
    \set DrumStaff.instrumentName = #"Bridge"
    \new DrumVoice = "all" {
      \voiceOne
      \drummode {
        \compressEmptyMeasures
        \override MultiMeasureRest.expand-limit = 1
      }
      \drummode {
        \time 6/8 R2.*2 \time 2/4 R2 \time 6/8 R2.*2
        \time 2/4 r4 r8 \tuplet 3/2 { tomfh16 tomh bd }
        <toml sn>8^\act <tomfh bd> <toml sn bd>^\act <tomfh bd>
      }
      <>^\markup \bold "3-bar phrase ×2, swell"
      \bar ".|:-|"
      \repeat volta 2 {
        \drummode {
          \time 6/8 <toml tomfh bd>8^\act\< q q q q q
          \repeat unfold 6 q
          \time 2/4
          \alternative {
            \volta 1 { q q q q\! }
            \volta 2 { q q q sn32 tomh tomfh bda\! }
          }
        }
      }
      \bar ":|."
      \drummode { \sixC \sixD }
      \bar "|."
    }
  }
}
\score {
  \layout{ ragged-right = ##f }
  \new DrumStaff {
    \set DrumStaff.instrumentName = #"Verse 4"
    \new DrumVoice = "all" {
      \voiceOne
      \numericTimeSignature
      <>^\markup \bold "4-bar phrase ×2"
      \bar ".|:-|"
      \repeat volta 2 {
        \drummode {
          \fourA \fourB
          \alternative {
            \volta 1 { \sixC \sixD }
            \volta 2 {
              \time 6/8 <cymc sn>8 q hh16 bd <cymc sn>8 q hh16 bd32 bda
              <cymc sn>8 q bd <cymc cymch bd> r <hh bd>
            }
          }
        }
      }
      \drummode {
        \time 5/4
        <hh sn>16 bd <toml tomfh> <cymc bd> r16 tomh8 <cymc bd>16
        <hh sn>16 bd hh sn bd bd \flam sn^\act bd \flam sn^\act sn toml toml
        \time 7/4
        <cymc bd>8 q <hh bd>16 bd32 bda <cymc sn>8 <cymc bd> hh16 bd32 bda
        <cymc sn>8 q bd <cymc cymch bd> r4 <cymc sn>4
      }
      \bar "|."
    }
  }
}
\score {
  \layout{ ragged-right = ##f }
  \new DrumStaff {
    \set DrumStaff.instrumentName = #"Interlude 4"
    \new DrumVoice = "all" {
      \voiceOne
      \drummode {
        \time 7/4
        <hh bd>8^\act hh <hh sn> <hh cymc bd> hh <hh bd> <rb bd> <hh sn>
        <tomfh bd> <cymc bd> hh <hh bd> <cymch sn>4
        <hh cymc bd>8 hh <hh sn>16 hh <hh cymc bd>8 hh <hh bd> <rb bd> <hh sn>
        <tomfh bd> <cymc bd> r bd <cymch sn>4
        <hh cymc bd>8 hh <hh sn> <hh cymc bd> hh <hh bd> <rb bd> <hh sn>
        <tomfh bd> <cymc bd> hh <hh bd> <rb sn>8 hh16 bd32 bda
        \time 3/4
        <hh sn>8 q <hh bd> <hh toml> <hh toml bd> <hh sn bd>
      }
      \bar "|."
    }
  }
}
\score {
  \layout{ ragged-right = ##f }
  \new DrumStaff {
    \set DrumStaff.instrumentName = #"Verse 5"
    \new DrumVoice = "all" {
      \voiceOne
      <>^\markup \bold "4-bar phrase ×4"
      \drummode {
        \time 2,3 5/8 <toml tomfh bd>8^\act tomfh16 bd \flam sn8^\act tomfh16 bd
        \tomTriplet
        \time 2,2,3 7/8 <toml tomfh>8^\act tomfh16 bd <toml tomfh>8^\act
        \tomTriplet \flam sn8^\act \sextuplet
        \time 2,3 5/8 <toml tomfh>8^\act tomfh16 bd <toml tomfh>8^\act tomfh16 bd
        \tomTriplet
        \time 2,2,3 7/8 <toml tomfh>8^\act tomfh16 bd <toml tomfh>8^\act
        tomfh16 bd \flam sn8^\act tomfh16 bd \tomTriplet
      }
      \bar ".|:-|"
      \repeat volta 2 { \fiveSext \sevenSext }
      \bar ".|:-|"
      \repeat volta 2 {
        \drummode {
          \fiveTri
          \alternative {
            \volta 1 {
              \time 2,2,3 7/8 <toml tomfh>8^\act tomfh16 bd <toml tomfh>8^\act
              \tomTriplet \flam sn8^\act \sextuplet
            }
            \volta 2 {
              \time 2,2,3 7/8
              \repeat unfold 2 {
                \tuplet 6/4 { <toml tomfh>16^\act bd bda tomfh bd bda }
              }
              \tuplet 3/2 { \flam sn16^\act bd bda } \sextuplet
            }
          }
          \fiveTri
          \alternative {
            \volta 1 {
              \time 2,2,3 7/8 <toml tomfh>8^\act \tomTriplet <toml tomfh>8^\act
              \tomTriplet \flam sn8^\act \sextuplet
            }
            \volta 2 {
              \time 2,2,3 7/8 <toml tomfh>8^\act \tomTriplet <tomh tomfh>8^\act
              \tomTriplet \flam sn8^\act
              \tuplet 6/4 { tomh16 tomh tomh tomh toml toml }
            }
          }
        }
      }
      \bar "|."
    }
  }
}
\score {
  \layout{ ragged-right = ##f }
  \new DrumStaff {
    \set DrumStaff.instrumentName = #"Outro"
    \new DrumVoice = "all" {
      \voiceOne
      \numericTimeSignature
      \drummode {
        \time 4/4
        \repeat percent 3 { <cymc bd>8 \tomTriplet \outroTail }
        <cymc bd>8 tomfh16 bd \outroTail
        \tuplet 6/4 { <cymch tomfh>16^\act bd bda tomfh bd bda }
        \sextFlam \sextChord \sextChord
        \repeat percent 2 {
          \tuplet 6/4 { <toml tomfh>16^\act bd bda tomfh bd bda }
          \sextFlam \sextChord \sextChord
        }
        \tuplet 6/4 { <toml tomfh>16^\act bd bda tomfh bd bda }
        \sextFlam \tomTriplet <toml tomfh>8^\act \tomTriplet <toml tomfh>8^\act
      }
      \bar "|."
    }
  }
}
