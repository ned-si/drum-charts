\version "2.24.3"
\include "definitions.ly"

\layout{
  \set DrumStaff.drumStyleTable = #(alist->hash-table custom-notes)
}

\header {
  title = "Linkin Park"
  subtitle = "One Step Closer"
  composer = "nedsi"
  tagline = #f
}

% Custom markup to create vertical space after header
\markup {
  \vspace #-1
}

\score {
  \new DrumStaff {
    \set DrumStaff.instrumentName = #"Guitar: 4"
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
          \numericTimeSignature
          \voiceOne
          \bar ".|:-|"
          \repeat volta 3 {
            \drummode {
              \alternative {
                \volta 1 { cymc8 }
                \volta 2,3 { hho8 }
              }
              [ hho] <hho sn>[ hho] hho[ hho] <hho sn>[ hho]
            }
          }
          \bar ":|."
          \drummode {
            hho8[ hho] <hho sn>[ hho] hho[ hho] <hho sn>16 tomh32 tomh sn16 sn
          }
          \bar "|."
        }
        \new DrumVoice = "feet" {
          \voiceTwo
          \repeat volta 3 {
            \drummode {
              \alternative {
                \volta 1 { bd8 }
                \volta 2,3 { bd8 }
              }
              [ bd] s16 bd8 s16 bd8[ bd] s16 bd8 s16
            }
          }
          \drummode {
            bd8[ bd] s16 bd8 s16 bd8[ bd] s4
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
      \set DrumStaff.instrumentName = #"Verse1-1"
      <<
        \new DrumVoice = "hands" {
          \numericTimeSignature
          \voiceOne
          \bar ".|:-|"
          \repeat volta 3 {
            \drummode {
              \alternative {
                \volta 1,3 { cymc16 }
                \volta 2 { hh16 }
              }
              [ hh hh hh] <hh sn>8 hh16 hho hh8[ hh] <hh sn>16 hh hh hho
            }
          }
          \drummode {
            hh16[ hh hh hh] <hh sn>8 hh16 hho hho8[ hho] <hho sn>16 tomh32 tomh sn16 sn
          }
          \bar "|."
        }
        \new DrumVoice = "feet" {
          \voiceTwo
          \repeat volta 3 {
            \drummode {
              \alternative {
                \volta 1,3 { <bd hhp>16 }
                \volta 2 { <bd hhp>16 }
              }
              [s bd8] s16 bd8 s16 <bd hhp>8[ bd] s4
            }
          }
          \drummode {
            <bd hhp>4 s16 bd8 s16 bd8[ bd] s4
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
      \set DrumStaff.instrumentName = #"Verse1-2"
      <<
        \new DrumVoice = "hands" {
          \numericTimeSignature
          \voiceOne
          \bar ".|:-|"
          <>^\markup \bold "3×"
          \drummode {
            cymc8[ hho] <hho sn>[ hho] hho[ hho] <hho sn> hho16 hho
          }
          \bar ":|."
          \repeat unfold 2 {
            \drummode {
              hho16[ hho hho8] <hho sn>8 hho16 hho
            }
          }
        }
        \new DrumVoice = "feet" {
          \voiceTwo
          \repeat unfold 4 {
            \drummode {
              bd8[ bd] s16 bd8 s16
            }
          }
          \drummode {
            <bd hhp>4 r2.
          }
          \bar "|."
        }
      >>
    }
  >>
}

\score {
  <<
    \new DrumStaff {
      \set DrumStaff.instrumentName = #"Pre-chorus1"
        \new DrumVoice = "hands" {
          \numericTimeSignature
          \time 2/4
          \voiceOne
          \drummode {
            s2
          }
          \bar "|."
        }
    }
  >>
}

\score {
  <<
    \new DrumStaff {
      \set DrumStaff.instrumentName = #"Chorus1"
      <<
        \new DrumVoice = "hands" {
          \numericTimeSignature
          \voiceOne
          \bar ".|:-|"
          <>^\markup \bold "3×"
          \drummode {
            cymc8[ hho] <hho sn>[ hho] hho[ hho] <hho sn>[ hho]
          }
          \bar ":|."

          \drummode {
            cymc8[ hho] <hho sn>[ hho] hho[ hho] <hho sn>16 tomh32 tomh sn16 sn
          }
          \bar "|."
        }
        \new DrumVoice = "feet" {
          \voiceTwo
          \repeat unfold 3 {
            \drummode {
              bd8[ bd] s16 bd8 s16
            }
          }
          \drummode {
            bd8[ bd] s4
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
      \set DrumStaff.instrumentName = #"Verse2-1"
      <<
        \new DrumVoice = "hands" {
          \numericTimeSignature
          \voiceOne
          \bar ".|:-|"
          \repeat volta 3 {
            \drummode {
              \alternative {
                \volta 1,3 { cymc16 }
                \volta 2 { hh16 }
              }
              [ hh hh hh] <hh sn>8 hh16 hho hh8[ hh] <hh sn>16 s hh hho
            }
          }
          \drummode {
            hh16[ hh hh hh] <hh sn>8 hh16 hho hho8[ hho] <hho sn>16 tomh32 tomh sn16 sn
          }
          \bar "|."
        }
        \new DrumVoice = "feet" {
          \voiceTwo
          \repeat volta 3 {
            \drummode {
              \alternative {
                \volta 1,3 { <bd hhp>16 }
                \volta 2 { <bd hhp>16 }
              }
              [s bd8] s16 bd8 s16 <bd hhp>8[ bd] s4
            }
          }
          \drummode {
            <bd hhp>4 s16 bd8 s16 bd8[ bd] s4
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
      \set DrumStaff.instrumentName = #"Verse2-2"
      <<
        \new DrumVoice = "hands" {
          \numericTimeSignature
          \voiceOne
          \bar ".|:-|"
          <>^\markup \bold "3×"
          \drummode {
            cymc8[ hho] <hho sn>[ hho] hho[ hho] <hho sn> hho16 hho
          }
          \bar ":|."
          \repeat unfold 2 {
            \drummode {
              hho16[ hho hho8] <hho sn> hho16 hho
            }
          }
        }
        \new DrumVoice = "feet" {
          \voiceTwo
          \repeat unfold 4 {
            \drummode {
              bd8[ bd] s16 bd8 s16
            }
          }
          \drummode {
            <bd hhp>4 r2.
          }
          \bar "|."
        }
      >>
    }
  >>
}

\score {
  <<
    \new DrumStaff {
      \set DrumStaff.instrumentName = #"Pre-chorus2"
        \new DrumVoice = "hands" {
          \numericTimeSignature
          \time 2/4
          \voiceOne
          \drummode {
            r4 sn16 sn sn sn
          }
          \bar "|."
        }
    }
  >>
}

\score {
  \layout{ ragged-right = ##f }
  <<
    \new DrumStaff {
      \set DrumStaff.instrumentName = #"Chorus2"
      <<
        \new DrumVoice = "hands" {
          \numericTimeSignature
          \voiceOne
          \bar ".|:-|"
          <>^\markup \bold "8×"
          \repeat volta 8 {
            \drummode {
              cymc8[ hho] <hho sn>[ hho]
              \alternative {
                \volta 1,2,3,5,6,7,8 {
                  cymc[ hho] <hho sn>[ hho]
                }
                \volta 4 {
                  hho[ hho] <hho sn>16 sn32 sn sn16 sn
                }
              }
            }
          }
          \drummode {
            cymch8 cymch <cymch sn> cymch cymch cymch <cymch sn> \parenthesize cymch
            \compressEmptyMeasures
            \override MultiMeasureRest.expand-limit = 1
            R1*4
          }
          \bar "|."
        }
        \new DrumVoice = "feet" {
          \voiceTwo
          \repeat unfold 2 {
            \drummode {
              bd8[ bd] s16 bd8 s16
            }
          }
          \drummode {
          bd8[ bd] s4 bd8[ bd] s bd[ bd bd] s bd
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
      \set DrumStaff.instrumentName = #"Bridge"
      <<
        \new DrumVoice = "hands" {
          \numericTimeSignature
          \voiceOne
          \bar ".|:-|"
          \repeat volta 8 {
            \drummode {
              cymc8[ hho] <hho sn>[ hho] cymc[ hho]
              \alternative {
                \volta 1,2,3,5,6,7 {
                  <hho sn>8[ sn16 sn]
                }
                \volta 4 {
                  \tuplet 3/2 { \repeat unfold 3 { <sn tomfh>8 }}
                }
                \volta 8 {
                  \repeat unfold 4 { <sn tomfh>16 }
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
              bd8 bd s16 bd s8 bd8. bd16
              \alternative {
                \volta 1,2,3,5,6,7 {
                  s16 bd16 s8
                }
                \volta 4,8 {
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
      \set DrumStaff.instrumentName = #"Chorus3"
      <<
        \new DrumVoice = "hands" {
          \numericTimeSignature
          \voiceOne
          \bar ".|:-|"
          <>^\markup \bold "8×"
          \repeat volta 8 {
            \drummode {
              cymc8[ hho] <hho sn>[ hho]
              \alternative {
                \volta 1,2,3,5,6,7,8 {
                  cymc[ hho] <hho sn>[ hho]
                }
                \volta 4 {
                  hho8 hho <hho sn>16 tomh hho tomh
                }
              }
            }
          }
          \drummode {
            cymch8 cymch <cymch sn> cymch cymch cymch <cymch sn> \parenthesize cymch
          }
          \bar "|."
        }
        \new DrumVoice = "feet" {
          \voiceTwo
          \repeat unfold 2 {
            \drummode {
              bd8[ bd] s16 bd8 s16
            }
          }
          \drummode {
          bd8[ bd] s4 bd8[ bd] s bd[ bd bd] s bd
          }
        }
      >>
    }
  >>
}
