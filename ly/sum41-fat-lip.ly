\version "2.24.4"
\include "definitions.ly"

\layout{
  \set DrumStaff.drumStyleTable = #(alist->hash-table custom-notes)
}

\header {
  title = "Sum 41"
  subtitle = "Fat Lip"
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
    \tempo 4 = 196
    \set DrumStaff.instrumentName = #"Pre-Intro"
    \new DrumVoice = "hands" {
      \numericTimeSignature
      \voiceOne
      \drummode {
        \compressEmptyMeasures
        \override MultiMeasureRest.expand-limit = 1
        R1*7
        r2 \flam sn8 sn sn sn
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
          <>^\markup \bold "4×"
          \numericTimeSignature
          \voiceOne
          \bar ".|:-|"
          \repeat volta 4 {
            \drummode {
              cymc4 cymc <cymc sn> cymc
              \alternative {
                \volta 1,2,3 {
                  cymc8 sn cymc4 <cymc sn> cymc8 sn
                }
                \volta 4 {
                  cymc8 sn sn4 sn sn8 sn
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
              bd4 bd s4. bd8
              \alternative {
                \volta 1,2,3 {
                  bd4 bd8 bd s bd4.
                }
                \volta 4 {
                  bd4 bd bd bd
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
      \set DrumStaff.instrumentName = #"Verse"
      <<
        \new DrumVoice = "hands" {
          <>^\markup \bold "4×"
          \numericTimeSignature
          \voiceOne
          \bar ".|:-|"
          \repeat volta 4 {
            \drummode {
              cymc4 hh <hh sn> hh8 sn
              \alternative {
                \volta 1,3 {
                  hh4 hh <hh sn> hho
                }
                \volta 2 {
                  hh4 hh <hh sn> hh
                }
                \volta 4 {
                  hh4 hh <hho sn> sn16 sn sn sn
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
              bd8 bd s2.
              \alternative {
                \volta 1,3 {
                  s4 bd s2
                }
                \volta 2 {
                  s4 bd s bd
                }
                \volta 4 {
                  s4 bd s <bd hhp>
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
          \numericTimeSignature
          \voiceOne
          \bar ".|:-|"
          \repeat volta 8 {
            \drummode {
              \alternative {
                \volta 1,2,3,6 {
                  \alternative {
                    \volta 1 {
                      cymc4
                    }
                    \volta 2,3,6 {
                      hh8[ hh]
                    }
                  }
                  <hh sn>8 hh hh hh <hh sn> hh
                }
                \volta 4,5 {
                  hh8 hh <hh sn> hh hh hh <hh sn> sn16 sn
                }
                \volta 7 {
                  hh8 hh <hh sn> hh hh hh <hho sn>4
                }
                \volta 8 {
                  sn16 sn sn sn tomh tomh tomh tomh sn sn tomh tomh tomfh tomfh
                  tomfh tomfh
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
                \volta 1,2,3,6 {
                  \alternative {
                    \volta 1 {
                      bd8 bd
                    }
                    \volta 2,3,6 {
                      bd8[ bd]
                    }
                  }
                  s4 bd8 bd s4
                }
                \volta 4,5 {
                  bd8 bd s4 bd8 bd s4
                }
                \volta 7 {
                  bd8 bd s4 bd8 bd s4
                }
                \volta 8 {
                  <bd hhp>4 bd bd bd
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
          <>^\markup \bold "4×"
          \numericTimeSignature
          \voiceOne
          \bar ".|:-|"
          \repeat volta 4 {
            \drummode {
              cymc4 <cymc sn> cymc <cymc sn>
              \alternative {
                \volta 1,3 {
                  cymc4 <cymc sn> cymc <cymc sn>
                }
                \volta 2 {
                  cymc4 <cymc sn> cymc <cymc sn>
                }
                \volta 4 {
                  cymc8 sn sn sn sn sn sn sn
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
              bd4. bd8[ bd8] s4 bd8
              \alternative {
                \volta 1,3 {
                  bd2 bd8 bd s bd
                }
                \volta 2 {
                  bd4. bd8[ bd] s4.
                }
                \volta 4 {
                  bd4 bd bd bd
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
      \set DrumStaff.instrumentName = #"Post-Chorus"
      <<
        \new DrumVoice = "hands" {
          \numericTimeSignature
          \voiceOne
          \bar ".|:-|"
          \repeat volta 5 {
            \drummode {
              \alternative {
                \volta 1,2,3 {
                  cymc4 cymc <cymc sn> cymc
                  cymc8 sn cymc4 <cymc sn> cymc8 sn
                }
                \volta 4 {
                  cymc4 cymc <cymc sn> cymc8 sn
                  cymc8 sn sn4 sn sn8 sn
                }
                \volta 5 {
                  cymc4 r2 s8 sn
                  sn4 tomfh sn8 sn sn4
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
                  bd4 bd s4. bd8
                  bd4 bd8 bd s bd4.
                }
                \volta 4 {
                  bd4 bd s2
                  bd4 bd bd bd
                }
                \volta 5 {
                  bd4 s2.
                  bd4 bd s2
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
    { "Verse" }
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
      \set DrumStaff.instrumentName = #"Post-Chorus-2"
      <<
        \new DrumVoice = "hands" {
          \numericTimeSignature
          \voiceOne
          \bar ".|:-|"
          \repeat volta 4 {
            \drummode {
              \alternative {
                \volta 1,3 {
                  cymc8 sn hho4 <hho sn> <hho sn>
                  hho8 sn hho4 <hho sn>4 hho
                }
                \volta 2 {
                  cymc4 hho <hho sn> <hho sn>
                  hho8 sn hho4 <cymc sn> hho
                }
                \volta 4 {
                  hho4 hho <hho sn> sn8 sn
                  r1
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
                \volta 1,3 {
                  bd4 bd8 bd s4. bd8
                  s4 bd8 bd s8 bd4.
                }
                \volta 2 {
                  bd8 bd s2 s8 bd
                  s4. bd16 bd s2
                }
                \volta 4 {
                  bd8 bd s2 <bd hhp>4
                  s1
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
  \new DrumStaff {
    \override Score.MetronomeMark.outside-staff-horizontal-padding = 1
    \set DrumStaff.instrumentName = #"Bridge-1"
    \new DrumVoice = "hands" {
      \numericTimeSignature
      \voiceOne
      \drummode {
        \compressEmptyMeasures
        \override MultiMeasureRest.expand-limit = 1
        R1*7
      }
    }
  }
}

\score {
  \layout{ ragged-right = ##f }
  <<
    \new DrumStaff {
      \set DrumStaff.instrumentName = #"Bridge-2"
      <<
        \new DrumVoice = "hands" {
          \numericTimeSignature
          \voiceOne
          \bar ".|:-|"
          \repeat volta 4 {
            \drummode {
              <>^\markup \bold "4×"
              cymc4 hh <hh sn> hh8 sn
              \alternative {
                \volta 1,3 {
                  hh4 hh <hh sn> hh8 sn
                }
                \volta 2 {
                  hh4 hh <hh sn> hho
                }
                \volta 4 {
                  hh4 hh \flam sn \flam sn
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
              bd4 bd s2
              \alternative {
                \volta 1,3 {
                  bd4 bd s2
                }
                \volta 2 {
                  s4 bd s2
                }
                \volta 4 {
                  s4. bd4 bd4 bd8
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
      \set DrumStaff.instrumentName = #"Bridge-3"
      <<
        \new DrumVoice = "hands" {
          \numericTimeSignature
          \voiceOne
          \bar ".|:-|"
          \repeat volta 4 {
            \drummode {
              <>^\markup \bold "4×"
              cymc4 cymc <cymc sn> cymc
              \alternative {
                \volta 1,4 {
                  cymc8 sn cymc4 <cymc sn> cymc8 sn
                }
                \volta 2 {
                  cymc8 sn cymc4 <cymc sn> cymc
                }
                \volta 3 {
                  cymc8 sn cymc4 \flam sn \flam sn
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
              bd4 bd s4. bd8
              \alternative {
                \volta 1,4 {
                  bd4 bd8 bd s bd4.
                }
                \volta 2 {
                  bd4 bd8 bd s bd4.
                }
                \volta 3 {
                  bd4 bd8 bd s bd4 bd8
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
      \set DrumStaff.instrumentName = #"Bridge-4"
      <<
        \new DrumVoice = "hands" {
          \numericTimeSignature
          \voiceOne
          \bar ".|:-|"
          \drummode {
            cymc4 cymc <cymc sn> cymc8 sn
            cymc4 \parenthesize cymc2.
            cymc4 \parenthesize cymc2.
            cymc4 cymc <cymc sn> cymc8 sn
            cymc4 cymc <cymc sn> cymc8 sn
            cymc4 cymc <cymc sn> cymc4
            cymc4 hho <hho sn> <hho sn>
            hho8 sn hho s <hho sn>4 hho8 sn16 sn
            hho4 hho <hho sn> <hho sn>
            hho8 sn hho s <hho sn>4 hho
            <sn tomfh>4 \repeat unfold 3 <sn tomfh>
            <sn tomfh>4 \repeat unfold 3 <sn tomfh>
            <sn tomfh>4 \repeat unfold 3 <sn tomfh>
            <sn tomfh>8 \repeat unfold 3 <sn tomfh> sn16 \repeat unfold 7 { sn }
          }
          \bar "|."
        }
        \new DrumVoice = "feet" {
          \voiceTwo
          \drummode {
            bd4 bd2.
            bd4 bd2.
            bd4 bd2.
            bd4 bd4. bd
            bd4 bd8 bd s bd4.
            bd4 bd2.
            bd4 bd s4. bd8
            s4. bd4 bd4.
            bd4 bd s4. bd8
            s4. bd4 s4.
            hhp8 bd8 s bd4 bd bd8
            s8 bd4 bd bd bd8
            s8 bd4 bd bd bd8
            bd4 bd bd bd
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
              \makePercent
              s1
              \alternative {
                \volta 4 {
                  cymc4 <cymc sn> \flam sn \flam sn
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
              s1
              \alternative {
                \volta 4 {
                  bd4 bd s8 bd s bd
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
      \set DrumStaff.instrumentName = #"Post-Chorus-3"
      <<
        \new DrumVoice = "hands" {
          \numericTimeSignature
          \voiceOne
          \bar ".|:-|"
          \repeat volta 4 {
            \drummode {
              cymc4 cymc <cymc sn> cymc8 sn
              \alternative {
                \volta 1,3 {
                  cymc4 cymc <cymc sn> cymc8 sn
                }
                \volta 2 {
                  cymc4 cymc <cymc sn> cymc8 sn16 sn
                }
                \volta 4 {
                  cymc8 sn sn sn sn sn sn sn
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
              bd4 bd2.
              \alternative {
                \volta 1,3 {
                  bd4 bd2.
                }
                \volta 2 {
                  bd4 bd8 bd s2
                }
                \volta 4 {
                  bd4 bd bd bd
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
              <>^\markup \bold "4×"
              cymc4 cymc <cymc sn> cymc
              \alternative {
                \volta 1,2,3 {
                  cymc8 sn cymc4 <cymc sn> cymc8 sn
                }
                \volta 4 {
                  cymc8 sn cymc4 <cymc sn> cymc4
                }
              }
              <sn tomfh>8 <sn tomfh> r2 <sn tomfh>8 <sn tomfh>
            }
          }
          \bar "|."
        }
        \new DrumVoice = "feet" {
          \voiceTwo
          \repeat volta 4 {
            \drummode {
              bd4 bd s4. bd8
              \alternative {
                \volta 1,2,3 {
                  bd4 bd8 bd s bd4.
                }
                \volta 4 {
                  bd4 bd8 bd s bd4.
                }
              }
              bd2. bd4
            }
          }
        }
      >>
    }
  >>
}
