\version "2.24.4"
\include "definitions.ly"

\layout{
  \set DrumStaff.drumStyleTable = #(alist->hash-table custom-notes)
}

\header {
  title = "Muse"
  subtitle = "Time Is Running Out"
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
    \tempo 4 = 92
    \set DrumStaff.instrumentName = #"Intro"
    \new DrumVoice = "hands" {
      \numericTimeSignature
      \voiceOne
      \drummode {
        \compressEmptyMeasures
        \override MultiMeasureRest.expand-limit = 1
        R1*3
        r2 r4. \parenthesize hho8
      }
    }
  }
}

\score {
  \layout{ ragged-right = ##f }
  <<
    \new DrumStaff {
      \set DrumStaff.instrumentName = #"Verse 1"
      <<
        \new DrumVoice = "hands" {
          <>^\markup \bold "16×"
          \numericTimeSignature
          \voiceOne
          \bar ".|:-|"
          \repeat volta 16 {
            \drummode {
              hh8 hh <hh sn> hh
              \alternative {
                \volta 1,2,3,5,6,7,9,10,11,13,14,15 {
                   hh hh <hh sn> hh
                }
                \volta 4,8,12 {
                  hh hh <hh sn> hho]
                }
                \volta 8 {
                  hh hh <hho sn>4
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
              bd4 s
              \alternative {
                \volta 1,2,3,5,6,7,9,10,11,13,14,15 {
                  s2
                }
                \volta 4,8,12 {
                  s2
                }
                \volta 8 {
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
  \layout{ ragged-right = ##f }
  <<
    \new DrumStaff {
      \set DrumStaff.instrumentName = #"Pre-Chorus 1"
      <<
        \new DrumVoice = "hands" {
          <>^\markup \bold "8×"
          \numericTimeSignature
          \voiceOne
          \bar ".|:-|"
          \repeat volta 8 {
            \drummode {
              <tomfh sn>8 <tomfh sn> <tomfh sn> <tomfh sn> <tomfh sn>[ <tomfh
              sn>]
              \alternative {
                \volta 1,2,3,4,5,6,7 {
                  <tomfh sn>[ <tomfh sn>]
                }
                \volta 8 {
                  sn16 sn sn sn
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
              bd8 bd bd bd bd[ bd]
              \alternative {
                \volta 1,2,3,4,5,6,7 {
                  bd[ bd]
                }
                \volta 8 {
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

\score {
  \layout{ ragged-right = ##f }
  <<
    \new DrumStaff {
      \set DrumStaff.instrumentName = #"Chorus 1"
      <<
        \new DrumVoice = "hands" {
          \numericTimeSignature
          \voiceOne
          \bar ".|:-|"
          \repeat volta 8 {
            \drummode {
              \alternative {
                \volta 1,2,3,4,5,6,7 {
                  cymc8 cymc <cymc sn> cymc cymc cymc <cymc sn> cymc
                }
                \volta 8 {
                  \repeat unfold 2 { <tomfh toml>8 <tomfh toml> \flam sn4 }
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
                \volta 1,2,3,4,5,6,7 {
                  bd8 bd s bd[ bd bd] s bd
                }
                \volta 8 {
                  bd8 bd s bd[ bd bd] s bd
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
      \set DrumStaff.instrumentName = #"Bridge 1"
      <<
        \new DrumVoice = "hands" {
          <>^\markup \bold "4×"
          \numericTimeSignature
          \voiceOne
          \bar ".|:-|"
          \repeat volta 4 {
            \drummode {
              <tomfh toml>8 <tomfh toml> \flam sn4
              \alternative {
                \volta 1,2,3 {
                   r4 \flam sn4
                }
                \volta 4 {
                  <tomfh toml>8 <tomfh toml> \flam sn4
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
              bd8 bd s bd
              \alternative {
                \volta 1,2,3 {
                  s2
                }
                \volta 4 {
                  bd8 bd s bd
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
      \set DrumStaff.instrumentName = #"Verse 2"
      <<
        \new DrumVoice = "hands" {
          <>^\markup \bold "12×"
          \numericTimeSignature
          \voiceOne
          \bar ".|:-|"
          \repeat volta 12 {
            \drummode {
              <hh tomfh>8 <hh tomfh> <hh sn>4
              \alternative {
                \volta 1,2,3,5,6,7,9,10,11 {
                  hh4 <hh sn>
                }
                \volta 4 {
                  <hh tomfh>8 <hh tomfh> <hh sn>4
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
              bd8 bd s bd
              \alternative {
                \volta 1,2,3,5,6,7,9,10,11 {
                  s2
                }
                \volta 4 {
                  bd8 bd s bd
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
      \set DrumStaff.instrumentName = #"Pre-Chorus 2"
      <<
        \new DrumVoice = "hands" {
          \numericTimeSignature
          \voiceOne
          \bar ".|:-|"
          \repeat volta 8 {
            \drummode {
              \alternative {
                \volta 1,2,3,4,5,6 {
                  tomfh16 tomh tomfh8 \flam sn8. tomh16 toml toml tomfh8 \flam
                  sn hho
                }
                \volta 7 {
                  tomfh16 tomh tomfh8 \flam sn8. tomh16 toml toml tomfh8 \flam
                  sn8 tomfh16 sn
                }
                \volta 8 {
                  s8 \flam sn4 \flam sn8 \flam sn4 \flam sn8 sn16 sn
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
                \volta 1,2,3,4,5,6 {
                  <bd hhp>8. bd16 s4 bd8. bd16 s4
                }
                \volta 7 {
                  <bd hhp>8. bd16 s4 bd8. bd16 s4
                }
                \volta 8 {
                  bd8. bd8 bd4 bd8 bd8 bd8.
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
      \set DrumStaff.instrumentName = #"Chorus 2"
      <<
        \new DrumVoice = "hands" {
          \numericTimeSignature
          \voiceOne
          \bar ".|:-|"
          \repeat volta 8 {
            \drummode {
              \alternative {
                \volta 1,2,3,4,5,6,7 {
                  cymc8 cymc <cymc sn> cymc cymc cymc <cymc sn> cymc
                }
                \volta 8 {
                  cymc8 cymc <cymc sn> cymc cymc8 sn16 sn sn sn sn sn
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
                \volta 1,2,3,4,5,6,7 {
                  bd8 bd s bd[ bd bd] s bd
                }
                \volta 8 {
                  bd8 bd s bd bd2
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
      \set DrumStaff.instrumentName = #"Bridge 2"
      <<
        \new DrumVoice = "hands" {
          \numericTimeSignature
          \voiceOne
          \bar ".|:-|"
          \repeat volta 8 {
            \drummode {
              \alternative {
                \volta 1,2,3,5 {
                  \repeat unfold 2 { cymc8 cymc <cymc sn> cymc }
                }
                \volta 4 {
                  \repeat unfold 2 { <cymc sn>8 cymc <cymc sn> cymc }
                }
                \volta 6 {
                  cymc8 cymc <cymc sn> cymc cymc cymc <cymc sn> sn16 sn
                }
                \volta 7 {
                  cymc8 cymc <cymc sn> cymc16 sn cymc8 cymc <cymc sn> cymc
                }
                \volta 8 {
                  cymc8 sn16 sn sn sn tomh sn sn sn tomh tomfh \flam sn4
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
                \volta 1,2,3,5 {
                  bd2 bd
                }
                \volta 4 {
                  bd8 bd bd bd bd bd bd bd
                }
                \volta 6 {
                  bd2 bd
                }
                \volta 7 {
                  bd8 bd s4 bd8 bd s4
                }
                \volta 8 {
                  bd4 s8 bd s8. bd16 s8 bd
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
    { "Verse 1 - 12x" }
    \hspace #0
    { "Pre-Chorus 2" }
    \hspace #0
    { "Chorus 2" }
    \hspace #0
  }
}

\score {
  \layout{ ragged-right = ##f }
  <<
    \new DrumStaff {
      \set DrumStaff.instrumentName = #"Bridge 2"
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
                  cymc8 cymc <cymc sn> cymc <toml tomfh>8 <toml tomfh> \flam sn4
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
                  bd8 bd s bd bd bd s4
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
          \numericTimeSignature
          \voiceOne
          \bar ".|:-|"
          \repeat volta 4 {
            \drummode {
              \alternative {
                \volta 1,2 {
                  <toml tomfh>8 <toml tomfh> \flam sn <toml tomfh> r4 \flam sn
                }
                \volta 3 {
                  <toml tomfh>8 <toml tomfh> \flam sn <toml tomfh> r4 \flam sn8
                  sn16 sn
                }
                \volta 4 {
                  <toml tomfh>8 <toml tomfh> \flam sn <toml tomfh> r2
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
                \volta 1,2 {
                  bd8 bd s bd s2
                }
                \volta 3 {
                  bd8 bd s bd s2
                }
                \volta 4 {
                  bd8 bd s bd s2
                }
              }
            }
          }
        }
      >>
    }
  >>
}
