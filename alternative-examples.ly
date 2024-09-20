\version "2.24.3"

\header {
  title = "Alternative"
  subtitle = "Examples"
  composer = "nedsi"
  tagline = #f
}

#(define custom-notes '(
  (bassdrum         default          #f  -3)
  (acousticbassdrum default          #f  -6)
  (pedalhihat       cross            #f  -5)
  (closedhihat      xcircle          #f  -5)
  (snare            default          #f   1)
  (sidestick        cross            #f   1)
  (hightom          default          #f   3)
  (lowtom           default          #f   2)
  (highfloortom     default          #f  -1)
  (lowfloortom      default          #f  -2)
  (hihat            cross            #f   5)
  (openhihat        xcircle          #f   5)
  (ridecymbal       cross            #f   6)
  (ridebell         harmonic-black   #f   6)
  (crashcymbal      cross            #f   7)
  (chinesecymbal    xcircle          #f   8)
  (cowbell          harmonic-black   #f   4)
))

\layout {
  ragged-right = ##f
  \set DrumStaff.drumStyleTable = #(alist->hash-table custom-notes)
}

% Custom markup to create vertical space after header
\markup {
  \vspace #2
}

\score {
  <<
    \new DrumStaff {
      <<
        \new DrumVoice = "hands" {
          \numericTimeSignature
          \voiceOne
          \bar ".|:-|"
          <>_\markup \bold "3×"
          \repeat volta 3 {
            \drummode {
              \alternative {
                \volta 1 { cymc8 }
                \volta 2,3 { hho8 }
              }
              [ hho] <hho sn>[ hho] hho[ hho] <hho sn>[ hho]
            }
          }
          \drummode {
            hho8[ hho] <hho sn>[ hho]
            hho8[ hho] <hho sn>16 tomh32 tomh sn16 sn
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
  <<
    \new DrumStaff {
      <<
        \new DrumVoice = "hands" {
          \numericTimeSignature
          \voiceOne
          \bar ".|:-|"
          \repeat volta 4 {
            \drummode {
              \alternative {
                \volta 1 { cymc8 }
                \volta 2,3,4 { hho8 }
              }
              [ hho] <hho sn>[ hho] hho[ hho]
              \alternative {
                \volta 1,2,3 { <hho sn>[ hho] }
                \volta 4 { <hho sn>16 tomh32 tomh sn16 sn }
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
                \volta 1 { bd8 }
                \volta 2,3,4 { bd8 }
              }
              [ bd] s16 bd8 s16 bd8[ bd]
              \alternative {
                \volta 1,2,3 { s16 bd8 s16 }
                \volta 4 { s4 }
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
      <<
        \new DrumVoice = "hands" {
          \time 12/8
          \voiceOne
          \bar ".|:-|"
          \repeat volta 4 {
            \drummode {
              \alternative {
                \volta 1,2,4 { cymc8 sn16 s8 s16 sn8[ s sn]
                  \alternative {
                    \volta 1 { sn16[ tomh tomh sn toml toml] sn32[ sn sn sn sn16 tomh tomh toml] }
                    \volta 2 { tomh16[ sn sn toml toml toml] sn[ sn toml tomfh tomfh tomfh] }
                    \volta 4 { sn16[ tomh sn sn tomh tomh] sn[ sn toml tomfh tomfh tomfh] }
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
