\version "2.24.4"
\include "definitions.ly"

\layout{
  \set DrumStaff.drumStyleTable = #(alist->hash-table custom-notes)
}

\header {
  title = "Bloodhound Gang"
  subtitle = "Foxtrot Uniform Charlie Kilo"
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
    \override Score.MetronomeMark.outside-staff-horizontal-padding = 5
    \tempo 4 = 136
      \set DrumStaff.instrumentName = #"Pre-Intro"
      <<
        \new DrumVoice = "hands" {
          \numericTimeSignature
          \voiceOne
          \bar ".|:-|"
          \drummode {
            r2. \parenthesize cymc4
          }
          \bar "|."
        }
        \new DrumVoice = "feet" {
          \voiceTwo
          \drummode {
            s2. bd4
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
          <>^\markup \bold "8×"
          \numericTimeSignature
          \voiceOne
          \bar ".|:-|"
          \repeat volta 8 {
            \drummode {
              hh8 hh <hh sn> hh hh hh <hh sn> hh
              \alternative {
                \volta 8 {
                  hh8 hh <hh sn> hh hh hh \parenthesize cymc4
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
              bd8 bd s bd[ bd] s4.
              \alternative {
                \volta 8 {
                  bd8 bd s bd[ bd] s bd4
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
          <>^\markup \bold "16×"
          \numericTimeSignature
          \voiceOne
          \bar ".|:-|"
          \repeat volta 16 {
            \drummode {
              hh8 hh <hh sn> hh hh hh <hh sn> hh
              \alternative {
                \volta 16 {
                  \parenthesize cymc4 s2.
                }
              }
            }
          }
          \bar "|."
        }
        \new DrumVoice = "feet" {
          \voiceTwo
          \repeat volta 16 {
            \drummode {
              bd2 bd
              \alternative {
                \volta 16 {
                  bd4 hhp hhp hhp
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
          <>^\markup \bold "4×"
          \numericTimeSignature
          \voiceOne
          \bar ".|:-|"
          \repeat volta 4 {
            \drummode {
              cymc4 <cymc sn> cymc <cymc sn>
              cymc4 <cymc sn> cymc <cymc sn>
              \alternative {
                \volta 4 {
                  cymc4 <cymc sn>8. sn16 cymc8 cymc <cymch sn>4
                  cymc4 <cymc sn>8. sn16 cymc8 cymc <cymch sn>4
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
              bd2 bd8 bd s bd
              s8 bd4. bd8 bd s4
              \alternative {
                \volta 4 {
                  bd2 bd8 bd s4
                  bd2 bd8 bd s4
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
                \volta 1,5 {
                  cymc4 <hho sn>8 hho hho hho <hho sn> hho
                }
                \volta 2,3,4,6,7,8 {
                  hho8 hho <hho sn> hho hho hho <hho sn> hho
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
                \volta 1,5 {
                  bd2 bd
                }
                \volta 2,3,4,6,7,8 {
                  bd2 bd
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
    { "Intro" }
    \hspace #0
    { "Verse" }
    \hspace #0
    { "Pre-Chorus" }
    \hspace #0
    { "Chorus" }
    \hspace #0
  }
}

\score {
  \layout{ ragged-right = ##f }
  <<
    \new DrumStaff {
      \set DrumStaff.instrumentName = #"Outro"
      <<
        \new DrumVoice = "hands" {
          <>^\markup \bold "16×"
          \numericTimeSignature
          \voiceOne
          \bar ".|:-|"
          \repeat volta 16 {
            \drummode {
              cymc4 <cymc sn> cymc <cymc sn>
              \alternative {
                \volta 4,8,12 {
                  cymc4 <cymc sn> cymc <cymc sn>
                }
                \volta 16 {
                  cymc1
                }
              }
            }
          }
          \bar "|."
        }
        \new DrumVoice = "feet" {
          \voiceTwo
          \repeat volta 16 {
            \drummode {
              bd8 bd s bd[ bd] s4.
              \alternative {
                \volta 4,8,12 {
                  bd8 bd s bd4 bd4.
                }
                \volta 16 {
                  bd1
                }
              }
            }
          }
        }
      >>
    }
  >>
}
