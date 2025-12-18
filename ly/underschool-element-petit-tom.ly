\version "2.24.4"
\include "definitions.ly"

\layout{
  \set DrumStaff.drumStyleTable = #(alist->hash-table custom-notes)
}

\header {
  title = "Underschool Element"
  subtitle = "Petit Tom"
  composer = "nedsi"
  tagline = #f
}

% TODO: Open hh all need to close after being open...
% TODO: Add sticking patterns for fills

% Custom markup to create vertical space after header
\markup {
  \vspace #-1
}

\score {
  \new DrumStaff {
    \override Score.MetronomeMark.outside-staff-horizontal-padding = 1
    \tempo 4 = 92
    \set DrumStaff.instrumentName = #"Pre-Intro"
    \new DrumVoice = "hands" {
      \numericTimeSignature
      \voiceOne
      \drummode {
        \compressEmptyMeasures
        \override MultiMeasureRest.expand-limit = 1
        R1*3
        r2 r8 \parenthesize cymc8 r4
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
          \numericTimeSignature
          \voiceOne
          \bar ".|:-|"
          \repeat volta 8 {
            \drummode {
              \alternative {
                \volta 1 {
                  cymc8
                }
                \volta 2,3,4,5,6,7,8 {
                  hh16[ \parenthesize sn
                }
              }
              hho8] <hh sn>8 hho16 \parenthesize sn hh \parenthesize sn hho8
              \alternative {
                \volta 1,2,3,5,6,7 {
                  <hh sn>8[ hho16 \parenthesize sn]
                }
                \volta 4 {
                  sn16 tomh tomh hh
                }
                \volta 8 {
                  <tomfh sn>8. <cymc sn>16
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
                \volta 1 {
                  bd8
                }
                \volta 2,3,4,5,6,7,8 {
                  bd8
                }
              }
              s4. s8 bd8
              \alternative {
                \volta 1,2,3,5,6,7 {
                  s8. bd16
                }
                \volta 4 {
                  s8. bd16
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
      \set DrumStaff.instrumentName = #"Verse"
      <<
        \new DrumVoice = "hands" {
          <>^\markup \bold "8×"
          \numericTimeSignature
          \voiceOne
          \bar ".|:-|"
          \repeat volta 8 {
            \drummode {
              s8 tomfh \flam sn16 \parenthesize sn16 hho8
              \alternative {
                \volta 1,2,3,5,6,7 {
                  r16 tomh16 tomh8 <sn toml>8. \flam toml16
                }
                \volta 4 {
                  r16 <tomh sn> <tomh sn>8 <toml sn>8. <cymc sn>16 
                }
                \volta 8 {
                  r16 tomh tomh8 tomh16 sn sn sn
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
              bd8. bd bd8
              \alternative {
                \volta 1,2,3,5,6,7 {
                  s2
                }
                \volta 4 {
                  s2
                }
                \volta 8 {
                  s8. bd8 s8.
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
      \set DrumStaff.instrumentName = #"Chorus "
      <<
        \new DrumVoice = "hands" {
          <>^\markup \bold "3×"
          \numericTimeSignature
          \voiceOne
          \bar ".|:-|"
          \repeat volta 3 {
            \drummode {
                  cymc8
              hho8] <hh sn>8 hho16 \parenthesize sn
                  hh16 \parenthesize sn hho8 <hh sn>[ hho16 \parenthesize sn]
                  \repeat unfold 2 { hh16[ \parenthesize sn
              hho8] <hh sn>8 hho16 \parenthesize sn
                hh16 \parenthesize sn hho8 <hh sn>[ hho16 \parenthesize sn] }
                  hh16[ \parenthesize sn
              hho8] <hh sn>8 hho16 \parenthesize sn
              \alternative {
                \volta 1 {
                  hh16 \parenthesize sn hho8 sn16 cymch cymch8
                }
                \volta 2 {
                  \tuplet 6/2 { cymc16 hh hh hh8 hh16 } hho8 \tuplet 3/2 { <hh tomh> sn16 }
                }
                \volta 3 {
                  hh16 \parenthesize sn hho8 \flam sn8 hh16 sn
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
              \repeat unfold 3 {
                bd8 s4. s8 bd8 s8. bd16 
              }
              bd8 s4.
              \alternative {
                \volta 1 {
                  s8. bd16 s8. bd16
                }
                \volta 2 {
                  s4.
                }
                \volta 3 {
                  s8. bd16 s4
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
  }
}

\score {
  <<
    \new DrumStaff {
      \set DrumStaff.instrumentName = #"Chorus"
      <<
        \new DrumVoice = "hands" {
          <>^\markup \bold "3×"
          \numericTimeSignature
          \voiceOne
          \bar ".|:-|"
          \repeat volta 3 {
            \drummode {
              \makePercent
              s1
              \alternative {
                \volta 1 {
                  hh16[ \parenthesize sn hho8] <hh sn>8 hho16 \parenthesize sn
                  hh16 \parenthesize sn hho8 sn16 cymch cymch8
                }
                \volta 2 {
                  hh16[ \parenthesize sn hho8] <hh sn>8 hho16 \parenthesize sn
                  hh16 \parenthesize sn hho8 sn16 tomh32 tomh toml16 tomfh
                }
                \volta 3 {
                  hh16[ \parenthesize sn hho8] <hh sn>8 <hho sn>8 hh16 sn hho8 <hh sn>8 hh16 <cymc sn>
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
              s1
              \alternative {
                \volta 1 {
                  bd8 s4.
                  s8. bd16 s8. bd16
                }
                \volta 2 {
                  bd8 s4.
                  s8 bd16 bd s8. bd16
                }
                \volta 3 {
                  bd8. bd4 bd8. bd16 bd s4
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
      \set DrumStaff.instrumentName = #"Breakdown"
      <<
        \new DrumVoice = "hands" {
          \numericTimeSignature
          \voiceOne
          \bar ".|:-|"
          \drummode {
            cymc4 <hho sn> hho <hho sn>
            hho8 hho <hho sn> \parenthesize sn hho \parenthesize sn <hho sn>8. sn16
            cymc16 \parenthesize sn hho8 <hho sn>4 hho <hho sn>
            hho8. sn16 hho4 <hho sn>8 hho hho hho
            <hho sn>4 hho hho <hho sn>
            hho hho8 sn hho4 <hho sn>4
            cymc4 \flam sn8 cymc sn16 hho8 hho sn16 sn8
            \flam sn16 cymc8 cymch8 tomh16 tomh toml toml32 tomfh tomfh
            tomfh16 s32 hho hho hho16. \repeat unfold 5 { sn32 }
          }
        }
        \new DrumVoice = "feet" {
          \voiceTwo
          \drummode {
            bd8. bd bd8 s2
            bd8. bd bd8 s8 bd16 bd s4
            bd8. bd bd8 s4. bd8
            s16 bd8.[ s8 bd8. bd8] s s16 bd bd
            s4. bd4 s4.
            s8 bd2 bd16 bd s8 bd
            bd8. bd8 bd16 bd8 s16 bd8 bd8 s bd16
            s16 bd8 bd s4 s8. bd4
          }
        }
      >>
    }
  >>
}

\score {
  <<
    \new DrumStaff {
      \override Score.MetronomeMark.outside-staff-horizontal-padding = 1
      \tempo 4 = 124
      \set DrumStaff.instrumentName = #"Section 2"
      <<
        \new DrumVoice = "hands" {
          \numericTimeSignature
          \voiceOne
          \drummode {
            \compressEmptyMeasures
            \override MultiMeasureRest.expand-limit = 1
            cymc1
            R1*3
          }
        }
        \new DrumVoice = "feet" {
          \voiceTwo
          \drummode {
            \compressEmptyMeasures
            \override MultiMeasureRest.expand-limit = 1
            bd1
            s1*3
          }
        }
      >>
    }
  >>
}

\score {
  <<
    \new DrumStaff {
      \set DrumStaff.instrumentName = #"Bridge 1"
      <<
        \new DrumVoice = "hands" {
          \numericTimeSignature
          \voiceOne
          \bar ".|:-|"
          \repeat volta 8 {
            \drummode {
              \alternative {
                \volta 1,2,3,5,6 {
                  \repeat unfold 2 { hh16 hh hho8 } \repeat unfold 6 { hh16 } hho8
                }
                \volta 4 {
                  \repeat unfold 2 { hh16 hh hho8 } hh4 hh
                }
                \volta 7 {
                  \repeat unfold 2 { \repeat unfold 6 { hh16 } hho8 }
                }
                \volta 8 {
                  \repeat unfold 2 { hh16 hh hho8 } sn8 sn16 tomfh tomfh
                  cymc8.
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
                \volta 1,2,3,5,6 {
                  s1
                }
                \volta 4 {
                  s1
                }
                \volta 7 {
                  \repeat unfold 2 { \repeat unfold 6 { bd16 } bd8 }
                }
                \volta 8 {
                  \repeat unfold 6 { bd16 } bd8 bd4 s16 bd8.
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
      \set DrumStaff.instrumentName = #"Outro 1"
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
                \volta 1,2,3,5,6,7 {
                  cymc4 <cymc sn>
                }
                \volta 4 {
                  cymc8 tomfh16 tomfh sn cymc8.
                }
                \volta 8 {
                  cymc8 \tuplet 3/2 { tomfh16 tomfh tomfh } sn16 cymc8.
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
              bd8 bd s bd[ 
              \alternative {
                \volta 1,2,3,5,6,7 {
                  bd8] s4.
                }
                \volta 4 {
                  bd8 bd8. bd8.
                }
                \volta 8 {
                  bd8 bd8. bd8.
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
      \set DrumStaff.instrumentName = #"Outro 2"
      <<
        \new DrumVoice = "hands" {
          <>^\markup \bold "8×"
          \numericTimeSignature
          \voiceOne
          \bar ".|:-|"
          \repeat volta 8 {
            \drummode {
              cymc8 cymc <cymc sn> cymc
              \alternative {
                \volta 1,2,3,5,6,7 {
                  cymc8 cymc <cymc sn> cymc
                }
                \volta 4,8 {
                  cymc8 tomfh16 tomfh sn cymc8.
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
              bd8 bd s bd[ 
              \alternative {
                \volta 1,2,3,5,6,7 {
                  bd8] s4.
                }
                \volta 4,8 {
                  bd8 bd8. bd8.
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
      \set DrumStaff.instrumentName = #"Bridge 2"
      <<
        \new DrumVoice = "hands" {
          \numericTimeSignature
          \voiceOne
          \bar ".|:-|"
          \repeat volta 4 {
            \drummode {
              \alternative {
                \volta 1 {
                  <cymc sn>1
                }
                \volta 2 {
                  r2. \repeat unfold 4 { sn16 }
                }
                \volta 3,4 {
                  \repeat unfold 16 { sn16 }
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
                \volta 1 {
                  bd1
                }
                \volta 2 {
                  s1
                }
                \volta 3,4 {
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

\markuplist {
  \column
  \bold {
    { "Outro 1 - 4x" }
    \hspace #0
    { "Outro 2 - 4x" }
    \hspace #0
  }
}

\score {
  <<
    \new DrumStaff {
      \set DrumStaff.instrumentName = #"Ending"
      <<
        \new DrumVoice = "hands" {
          \numericTimeSignature
          \voiceOne
          \bar ".|:-|"
          \repeat volta 4 {
            \drummode {
            cymc1
            }
          }
          \bar "|."
        }
        \new DrumVoice = "feet" {
          \voiceTwo
          \repeat volta 4 {
            \drummode {
              bd1
            }
          }
        }
      >>
    }
  >>
}
