\version "2.25.31"
\include "definitions.ly"

\layout{
  \set DrumStaff.drumStyleTable = #(alist->hash-table custom-notes)
}

\header {
  title = "Korn"
  subtitle = "Here to Stay"
  composer = "nedsi"
  tagline = #f
}

% Custom markup to create vertical space after header
\markup {
  \vspace #-1
}

\score {
  \new DrumStaff {
    \override Score.MetronomeMark.outside-staff-horizontal-padding = 1
    \tempo 4 = 99
    \set DrumStaff.instrumentName = #"Pre-intro"
    \new DrumVoice = "hands" {
      \numericTimeSignature
      \voiceOne
      \drummode {
        \compressEmptyMeasures
        \override MultiMeasureRest.expand-limit = 1
        R1*4
      }
    }
  }
}

\score {
  \layout{ ragged-right = ##f }
  <<
    \new DrumStaff {
      \set DrumStaff.instrumentName = #"Intro"
      <<
        \new DrumVoice = "hands" {
          <>^\markup \bold "8×"
          \numericTimeSignature
          \voiceOne
          \bar ".|:-|"
          \repeat volta 8 {
            \drummode {
              cymc4 <cymc sn>
              \alternative {
                \volta 1,2,3,4 {
                  cymc8 cymc <cymc sn> cymc
                }
                \volta 5,6,7 {
                  cymc8 cymc <cymc sn> cymc
                }
                \volta 8 {
                  cymc8 cymc <cymc sn> hho
                }
              }
            }
          }
          \bar "|."
        }
        \new DrumVoice = "feet" {
          \voiceTwo
          \repeat volta 8 {
            \drummode {
              bd2
              \alternative {
                \volta 1,2,3,4 {
                  bd8[ bd8.] bd
                }
                \volta 5,6,7 {
                  bd8[ bd8.] bd8 bd16
                }
                \volta 8 {
                  bd8[ bd8.] bd
                }
              }
            }
          }
        }
      >>
    }
  >>
}

\score {
  <<
    \new DrumStaff {
      \set DrumStaff.instrumentName = #"Verse"
      <<
        \new DrumVoice = "hands" {
          <>^\markup \bold "3×"
          \numericTimeSignature
          \voiceOne
          \bar ".|:-|"
          \repeat volta 3 {
            \drummode {
              cymc8 hho sn hho ss hho sn hho
              s hho sn hho ss hho sn hho
              s hho sn hho ss hho sn hho
              s hho sn hho ss[ hho]
              \alternative {
                \volta 1,2 {
                  sn[ hho]
                }
                \volta 3 {
                  <cymc sn>[ <cymc sn>]
                }
              }
            }
          }
          \bar "|."
        }
        \new DrumVoice = "feet" {
          \voiceTwo
          \repeat volta 3 {
            \drummode {
              bd4 <bd hhp> <bd hhp>8[ bd hhp16 bd8.]
              <bd hhp>4 <bd hhp> <bd hhp>8[ bd hhp16 bd8.]
              <bd hhp>4 <bd hhp> <bd hhp>8[ bd hhp16 bd8.]
              <bd hhp>4 <bd hhp> <bd hhp>8 bd
              \alternative {
                \volta 1,2 {
                  hhp16 bd8.
                }
                \volta 3 {
                  bd8 bd
                }
              }
            }
          }
        }
      >>
    }
  >>
}

\score {
  <<
    \new DrumStaff {
      \set DrumStaff.instrumentName = #"Pre-Chorus"
      <<
        \new DrumVoice = "hands" {
          <>^\markup \bold "2×"
          \numericTimeSignature
          \voiceOne
          \bar ".|:-|"
          \repeat volta 2 {
            \drummode {
              cymc8 cymc <cymc sn> cymc cymc cymc <cymc sn> cymc
              cymc cymc <cymc sn> cymc 
              \alternative {
                \volta 1 {
                  cymc[ cymc <cymc sn> cymc]
                }
                \volta 2 {
                  <cymc sn>[ sn32 sn sn16] sn[ sn tomh hho]
                }
              }
            }
          }
          \bar "|."
        }
        \new DrumVoice = "feet" {
          \voiceTwo
          \repeat volta 2 {
            \drummode {
              bd4 s8 s16 bd[ bd8] s16 bd32 bda32 s16 bd8.
              bd8 bd s4
              \alternative {
                \volta 1{
                  bd8. bd16 s16 bd8.
                }
                \volta 2 {
                  s2
                }
              }
            }
          }
        }
      >>
    }
  >>
}

\score {
  <<
    \new DrumStaff {
      \set DrumStaff.instrumentName = #"Chorus"
      <<
        \new DrumVoice = "hands" {
          <>^\markup \bold "4×"
          \numericTimeSignature
          \voiceOne
          \bar ".|:-|"
          \repeat volta 4 {
            \drummode {
              cymc8 cymc <cymc sn> cymc cymc cymc <cymc sn> cymc 
              \alternative {
                \volta 1,3 {
                  cymc8 cymc <cymc sn> cymc16 sn cymc8 cymc sn16 cymc8 cymc16
                }
                \volta 2 {
                  cymc8 cymc <cymc sn> cymc16 sn cymc8 cymc \flam tomh8
                  tomfh16 tomfh
                }
                \volta 4 {
                  s8 \flam sn8 tomh16 tomh sn sn toml8 toml tomfh16 tomfh s8
                }
              }
            }
          }
          \bar "|."
        }
        \new DrumVoice = "feet" {
          \voiceTwo
          \repeat volta 4 {
            \drummode {
              bd2 bd4 s16 bd8.
              \alternative {
                \volta 1,3 {
                  bd2 bd8 bd s16 bd8 bd16
                }
                \volta 2 {
                  bd2 bd8 s16 bd8 bd8.
                }
                \volta 4 {
                  bd2 hhp8 hhp hhp <hhp bd>16 bd
                 }
              }
            }
          }
        }
      >>
    }
  >>
}

\markuplist {
  \column
  \bold {
    { "Verse - only 2x" }
    \hspace #0
    { "Pre-Chorus" }
    \hspace #0
    { "Chorus" }
    \hspace #0
  }
}

\score {
  <<
    \new DrumStaff {
      \set DrumStaff.instrumentName = #"Pre-Bridge"
      <<
        \new DrumVoice = "hands" {
          \numericTimeSignature
          \voiceOne
          \bar ".|:-|"
          \repeat volta 4 {
            \drummode {
              \alternative {
                \volta 1,2,3 {
                  cymc8 hh16 hh hh8 hh32 hh hh hh hh8 hh16 hh hh hh hh32 hh hh
                  hh
                  hh8 hh16 hh hh8 hh32 hh hh hh hh16 hh hh32 hh hh hh hh16 cymch
                  hh8
                }
                \volta 4 {
                  \repeat unfold 2 { cymc16 hh hh hh hh hh hh32 hh hh hh }
                  \repeat unfold 3 { hho16^\act hho hho hho } hho4^\act
                }
              }
            }
          }
          \bar "|."
        }
        \new DrumVoice = "feet" {
          \voiceTwo
          \repeat volta 4 {
            \drummode {
              \alternative {
                \volta 1,2,3 {
                  bd1 s1
                }
                \volta 4 {
                  bd2 bd bd4 bd bd bd
                 }
              }
            }
          }
        }
      >>
    }
  >>
}

\score {
  <<
    \new DrumStaff {
      \set DrumStaff.instrumentName = #"Bridge"
      <<
        \new DrumVoice = "hands" {
          \numericTimeSignature
          \voiceOne
          \bar ".|:-|"
          \repeat volta 4 {
            \drummode {
              \alternative {
                \volta 1,2,3 {
                  \repeat unfold 2 {
                    hh8^\act hh16 hh hh8^\act hh16 hh \repeat unfold 2 { hh^\act
                    hh hh hh }
                  }
                }
                \volta 4 {
                  hh8^\act hh16 hh hh8^\act hh16 hh \repeat unfold 2 { hh^\act
                  hh hh hh }
                  hh8^\act hh16 hh hh8^\act s4. sn4
                }
              }
            }
          }
          \bar "|."
        }
        \new DrumVoice = "feet" {
          \voiceTwo
          \repeat volta 4 {
            \drummode {
              \alternative {
                \volta 1,2,3 {
                  bd8 bd8. bd8 bd16 bd2
                  bd8 bd8. bd bd8 bd4.
                }
                \volta 4 {
                  bd8 bd8. bd8 bd16 bd2
                  bd8 bd8. bd bd8 bd bd4
                 }
              }
            }
          }
        }
      >>
    }
  >>
}

\score {
  \layout{ ragged-right = ##f }
  <<
    \new DrumStaff {
      \set DrumStaff.instrumentName = #"Breakdown"
      <<
        \new DrumVoice = "hands" {
          <>^\markup \bold "4×"
          \numericTimeSignature
          \voiceOne
          \bar ".|:-|"
          \repeat volta 4 {
            \drummode {
              cymc8 cymc <cymc sn> cymc cymc cymc <cymc sn> cymc 
              cymc8 cymc <cymc sn>4 cymc8[ cymc]
              \alternative {
                \volta 1,2,3 {
                  <cymch sn>4
                }
                \volta 4 {
                  <cymc sn>8 <cymc sn>
                }
              }
            }
          }
          \bar "|."
        }
        \new DrumVoice = "feet" {
          \voiceTwo
          \repeat volta 4 {
            \drummode {
              bd8 bd s16 bd8 bd16 bd2
              bd8 bd s16 bd8. bd16 bda bd8
              \alternative {
                \volta 1,2,3 {
                  s4
                }
                \volta 4 {
                  s4
                }
              }
            }
          }
        }
      >>
    }
  >>
}

\markuplist {
  \column
  \bold {
    \hspace #0
    { "Verse - only 2 last bars" }
    \hspace #0
    { "Pre-Chorus" }
    \hspace #0
    { "Chorus - last bar without fill" }
    \hspace #0
  }
}

\score {
  <<
    \new DrumStaff {
      \set DrumStaff.instrumentName = #"Pre-Outro"
      <<
        \new DrumVoice = "hands" {
          \numericTimeSignature
          \voiceOne
          \bar ".|:-|"
          \repeat volta 8 {
            \drummode {
              \alternative {
                \volta 1,5,7,8 {
                  cymc4 <cymc sn>8 cymc cymc cymc <cymc sn> cymc 
                }
                \volta 2,3,6 {
                  cymc8 cymc <cymc sn> cymc cymc cymc <cymc sn> cymc 
                }
                \volta 4 {
                  cymc4 <cymc sn> cymc8 cymc <cymch sn>4
                }
              }
            }
          }
          \bar "|."
        }
        \new DrumVoice = "feet" {
          \voiceTwo
          \repeat volta 4 {
            \drummode {
              \alternative {
                \volta 1,5,7,8 {
                  bd2 bd8 bd8. bd
                }
                \volta 2,3,6 {
                  bd2 bd8 bd8. bd8 bd16
                }
                \volta 4 {
                  bd2 bd8. bd32 bda s16 bd8.
                }
              }
            }
          }
        }
      >>
    }
  >>
}

\score {
  \layout{ ragged-right = ##f }
  <<
    \new DrumStaff {
      \set DrumStaff.instrumentName = #"Outro"
      <<
        \new DrumVoice = "hands" {
          <>^\markup \bold "4×"
          \numericTimeSignature
          \voiceOne
          \bar ".|:-|"
          \repeat volta 8 {
            \drummode {
              <toml tomfh>8 <toml tomfh> \flam sn8 tomfh16 tomfh16 tomfh tomfh8. s4
              <toml tomfh>8 <toml tomfh> \flam sn4 <toml tomfh>16 <toml tomfh> <toml tomfh>8
               \alternative {
                \volta 1,2,3 {
                  s4
                }
                \volta 4 {
                  s4
                }
              }
            }
          }
          \bar "|."
        }
        \new DrumVoice = "feet" {
          \voiceTwo
          \repeat volta 4 {
            \drummode {
              bd8 bd8. bd4 s8. hhp4
              bd8 bd8. bd bd8[ bd]
               \alternative {
                \volta 1,2,3 {
                  hhp4
                }
                \volta 4 {
                  r4
                }
              }
            }
          }
        }
      >>
    }
  >>
}
