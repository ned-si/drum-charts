\version "2.24.3"
\include "definitions.ly"

\layout{
  \set DrumStaff.drumStyleTable = #(alist->hash-table custom-notes)
}

\header {
  title = "System Of A Down"
  subtitle = "Toxicity"
  composer = "nedsi"
  tagline = #f
}

% Custom markup to create vertical space after header
\markup {
  \vspace #0
}

\score {
  \new DrumStaff {
    \override Score.MetronomeMark.outside-staff-horizontal-padding = 1
    \tempo 4. = 82
    \set DrumStaff.instrumentName = #"Pre-intro"
    \new DrumVoice = "hands" {
      \time 12/8
      \voiceOne
      \drummode {
        \compressEmptyMeasures
        \override MultiMeasureRest.expand-limit = 1
        R1*6
      }
    }
  }
}

\score {
  <<
    \new DrumStaff {
      \set DrumStaff.instrumentName = #"Intro"
      <<
        \new DrumVoice = "hands" {
          \time 12/8
          \voiceOne
          \bar ".|:-|"
          \repeat volta 4 {
            \drummode {
              \alternative {
                \volta 1,2,4 { cymc8 \flam sn16 s8 s16 \flam sn8[ s \flam sn]
                  \alternative {
                    \volta 1 { sn16[ tomh tomh sn toml toml] sn32[ sn sn sn sn16 tomh tomh toml] }
                    \volta 2 { tomh16[ sn sn toml toml toml] sn[ sn toml tomfh tomfh tomfh] }
                    \volta 4 { sn16[ tomh sn sn tomh tomh] sn[ sn toml tomfh tomfh tomfh]}
                    }
                  }
                \volta 3 { cymc16 tomh tomh tomh toml toml sn sn toml toml tomfh tomfh
                           cymc toml \repeat unfold 4 { tomh } sn sn toml toml tomfh tomfh
                }
              }
            }
          }
          \bar ":|."
          \repeat volta 4 {
            \drummode {
              cymc8 hho16 sn hho8 <hho sn> hho16 sn hho8
              \alternative {
                \volta 1,2,3 { cymc8 hho16 sn hho8 <hho sn>[ hho8 <hho sn>] }
                \volta 4 { cymc8[ sn16 sn hho] s <hho sn>8[ sn16 toml toml toml] }
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
                \volta 1,2,4 { bd8 s16 bd8 bd16 s8 bd4 }
                  \alternative {
                    \volta 1 { bd s s }
                    \volta 2 { bd s s }
                    \volta 4 { bd s s }
                    }
                \volta 3 { \repeat unfold 4 { bd4 s8 } }
              }
            }
          }
          \repeat volta 4 {
            \drummode {
              bd4 s16 bd4 s16 bd8
              \alternative {
                \volta 1,2,3 { bd[ s bd] s8 bd4 }
                \volta 4 { bd4 s16 bd4 s16 }
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
      \set DrumStaff.instrumentName = #"Verse1"
      <<
        \new DrumVoice = "hands" {
          \time 12/8
          \voiceOne
          \bar ".|:-|"
          \drummode {
            cymc8 hh16 sn hh8 <hh sn> hh16 sn hh8 hh8 hh16 sn hh8 <hho sn> hh16 sn hh8 |
            hh8 hh16 sn hh8 <hho sn> hh16 sn hh8 hh8 hh16 \parenthesize sn hh8 <hho sn> hh16 \repeat unfold 2 { \parenthesize sn32 } hh16 sn
          }
          \repeat volta 10 {
            \drummode {
              \alternative {
                \volta 9 { cymc8 }
                \volta 1,2,3,4,5,6,7,8,10 { hh8 }
              }
              hh16 sn hh8 <hh sn> hh16 sn hh8 
              \alternative {
                \volta 1,3,5,7,9 {
                  hh8 hh16 sn hh8 <hh sn> hh16 sn hh8
                }
                \volta 2,4,6,8 {
                  hh8 hh16 sn hh8 <hho sn> hh16 \repeat unfold 2 { \parenthesize sn32 } hh16 sn
                }
                \volta 12 {
                  hho8 hho16 sn hho8 <hho sn>8 hho <hho sn>
                }
              }
            }
          }
          \bar "|."
        }
        \new DrumVoice = "feet" {
          \voiceTwo
          \drummode {
            bd4 s16 bd4 s16 bd8 bd[ s bd] hpp bd |
            bd4 s16 bd8 hpp s16 bd8 bd[ s bd] hpp bd
          }
          \repeat volta 10 {
            \drummode {
              \alternative {
                \volta 9 { cymc8 }
                \volta 1,2,3,4,5,6,7,8,10 { hh8 }
              }
              hh16 sn hh8 <hh sn> hh16 sn hh8 
              \alternative {
                \volta 1,3,5,7,9 {
                  hh8 hh16 sn hh8 <hh sn> hh16 sn hh8
                }
                \volta 2,4,6,8 {
                  hh8 hh16 sn hh8 <hho sn> hh16 \repeat unfold 2 { \parenthesize sn32 } hh16 sn
                }
                \volta 12 {
                  hho8 hho16 sn hho8 <hho sn>8 hho <hho sn>
                }
              }
            }
          }
        }
      >>
    }
  >>
}
