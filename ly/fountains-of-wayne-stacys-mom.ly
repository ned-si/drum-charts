\version "2.24.4"
\include "definitions.ly"

\layout{
  \set DrumStaff.drumStyleTable = #(alist->hash-table custom-notes)
}

\header {
  title = "Fountains of Wayne"
  subtitle = "Stacy's Mom"
  composer = "nedsi"
  tagline = #f
}

% Custom markup to create vertical space after header
\markup {
  \vspace #-1
}

\score {
  <<
    \new DrumStaff {
    \override Score.MetronomeMark.outside-staff-horizontal-padding = 1
    \tempo 4 = 118
      \set DrumStaff.instrumentName = #"Pre-Intro"
      <<
        \new DrumVoice = "hands" {
          \numericTimeSignature
          \voiceOne
          \bar ".|:-|"
          \drummode {
            r1
            r2. r8 <hho sn>
            s1
            r2. r8 <hho sn>
          }
          \bar "|."
        }
        \new DrumVoice = "feet" {
          \voiceTwo
          \drummode {
            s1
            s1
            hhp4 s2.
            s1
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
      \set DrumStaff.instrumentName = #"Intro"
      <<
        \new DrumVoice = "hands" {
          <>^\markup \bold "4×"
          \numericTimeSignature
          \voiceOne
          \bar ".|:-|"
          \repeat volta 4 {
            \drummode {
              hh8 hh hh hh hh hh hh hh
              hh8 hh hh hh hh hh hh <hho sn>
              \alternative {
                \volta 4 {
                  hh8 hh hh hh hh hh hh hh
                  hh8 hh hh hh hh sn sn sn
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
              bd4 bd bd bd
              bd4 bd bd bd
              \alternative {
                \volta 4 {
                  bd4 bd bd bd
                  bd4 bd bd2
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
%  \layout{ ragged-right = ##f }
  <<
    \new DrumStaff {
      \set DrumStaff.instrumentName = #"Verse"
      <<
        \new DrumVoice = "hands" {
          \numericTimeSignature
          \voiceOne
          \bar ".|:-|"
          \repeat volta 8 {
            \drummode {
              \alternative {
                \volta 1,2,5,7 {
                  hh8 hh <hh sn> hh hh hh <hh sn> hh
                }
                \volta 3,6 {
                  hh8 hh <hh sn> hh hh hh <hh sn> hh
                }
                \volta 4,8 {
                  hh8 hh <hh sn> hh hh hh <hh sn> <hho sn>
                }
              }
            }
          }
          \repeat volta 8 {
            \drummode {
              \alternative {
                \volta 1,2,3,5,6,7 {
                  hh8 hh <hh sn> hh hh hh <hh sn> hh
                }
                \volta 4 {
                  hh8 hh <hh sn> hh hh hh <hh sn> <hho sn>
                }
                \volta 8 {
                  hh8 hh <hh sn> hh16 sn hh4 sn
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
              \alternative {
                \volta 1,2,5,7 {
                  bd2 bd
                }
                \volta 3,6 {
                  bd2 bd4 s8 bd
                }
                \volta 4,8 {
                  bd2 bd
                }
              }
            }
          }
          \repeat volta 8 {
            \drummode {
              \alternative {
                \volta 1,2,3,5,6,7 {
                  bd8 bd s4 bd8 bd s4
                }
                \volta 4 {
                  bd8 bd s4 bd8 bd s4
                }
                \volta 8 {
                  bd8 bd s4 bd8 bd s bd
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
      \set DrumStaff.instrumentName = #"Pre-Chorus"
      <<
        \new DrumVoice = "hands" {
          \numericTimeSignature
          \voiceOne
          \bar ".|:-|"
          \repeat volta 4 {
            \drummode {
              \alternative {
                \volta 1,2,3 {
                  \alternative {
                    \volta 1 {
                      cymc8
                    }
                    \volta 2,3 {
                      hho8[
                    }
                  }
                  hho <hho sn> hho] hho hho <hho sn> hho
                }
                \volta 4 {
                  cymc8 cymc cymc cymc \parenthesize cymc2
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
                  \alternative {
                    \volta 1 {
                      bd8
                    }
                    \volta 2,3 {
                      bd8
                    }
                  }
                  s4. bd8 bd s4
                }
                \volta 4 {
                  bd8 bd bd bd bd2
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
      \set DrumStaff.instrumentName = #"Chorus"
      <<
        \new DrumVoice = "hands" {
          \numericTimeSignature
          \voiceOne
          \bar ".|:-|"
          \repeat volta 8 {
            \drummode {
              \alternative {
                \volta 1,6 {
                  cymc8 cymc <cymc sn> cymc cymc cymc <cymc sn> cymc
                }
                \volta 2 {
                  cymc8 cymc <cymc sn> cymc cymc cymc <cymc sn> cymc
                }
                \volta 3,5 {
                  cymc8 cymc <cymc sn> cymc cymc cymc <cymc sn> cymc
                }
                \volta 4 {
                  cymc8 cymc <cymc sn> cymc cymc cymc <cymc sn> \parenthesize cymc16 s
                }
                \volta 7 {
                  cymc8 hho <hho sn> hho hho hho <hho sn> hho
                }
                \volta 8 {
                  <toml tomfh>8 <toml tomfh> <toml tomfh> <toml tomfh> <toml tomfh> <toml tomfh> <toml tomfh> <hho sn>
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
              \alternative {
                \volta 1,6 {
                  bd8 bd s bd4 bd bd8
                }
                \volta 2 {
                  s8 bd4. bd8 bd s4
                }
                \volta 3,5 {
                  bd8 bd s bd4 bd4.
                }
                \volta 4 {
                  bd8 bd s4 bd8 bd s4
                }
                \volta 7 {
                  bd8 bd s4 bd8 bd s4
                }
                \volta 8 {
                  <bd hhp>4 <bd hhp> <bd hhp> <bd hhp>
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
    { "Intro - only 4 last bars" }
    \hspace #0
    { "Verse" }
    \hspace #0
    { "Pre-Chorus" }
    \hspace #0
  }
}

\score {
  <<
    \new DrumStaff {
      \set DrumStaff.instrumentName = #"Chorus"
      <<
        \new DrumVoice = "hands" {
          <>^\markup \bold "8×"
          \numericTimeSignature
          \voiceOne
          \bar ".|:-|"
          \repeat volta 8 {
            \drummode {
              \makePercent
              s1
              \alternative {
                \volta 8 {
                  hho8 hho <hho sn> sn16 sn s8 sn sn16 sn sn sn
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
              s1
              \alternative {
                \volta 8 {
                  bd8 bd s4 bd8 bd s4
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
      \set DrumStaff.instrumentName = #"Chorus"
      <<
        \new DrumVoice = "hands" {
          <>^\markup \bold "8×"
          \numericTimeSignature
          \voiceOne
          \bar ".|:-|"
          \repeat volta 8 {
            \drummode {
              \makePercent
              s1
              \alternative {
                \volta 4 {
                  cymc8 cymc <cymc sn> cymc16 sn cymc8 <cymc sn> sn16 sn sn sn
                }
                \volta 8 {
                  cymc8 cymc <cymc sn> cymc cymc <cymc sn>16 sn sn sn sn sn
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
              s1
              \alternative {
                \volta 4 {
                  s8 bd4. bd2
                }
                \volta 8 {
                  bd8 bd s bd[ bd] s4.
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
    { "Chorus - same than the last one" }
    \hspace #0
  }
}

\score {
  \layout{ ragged-right = ##f }
  <<
    \new DrumStaff {
      \set DrumStaff.instrumentName = #"Chorus"
      <<
        \new DrumVoice = "hands" {
          <>^\markup \bold "8×"
          \numericTimeSignature
          \voiceOne
          \bar ".|:-|"
          \repeat volta 8 {
            \drummode {
              \makePercent
              s1
              \alternative {
                \volta 8 {
                  <cymc tomfh>8 <cymc tomfh> <cymc tomfh> <cymc tomfh> <cymc tomfh> <cymc tomfh> <cymc tomfh> cymc
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
              s1
              \alternative {
                \volta 8 {
                  bd8 bd bd bd bd bd bd s
                }
              }
            }
          }
        }
      >>
    }
  >>
}
