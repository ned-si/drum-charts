\version "2.24.3"
\layout {
  ragged-right = ##f
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

\score {
  <<
    \new DrumStaff {
      \set DrumStaff.instrumentName = #"TEST-ALT"
      \set DrumStaff.drumStyleTable = #(alist->hash-table custom-notes)
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
  \layout{ ragged-right = ##f }
  <<
    \new DrumStaff {
      \set DrumStaff.instrumentName = #"TEST-ALT-ALT"
      \set DrumStaff.drumStyleTable = #(alist->hash-table custom-notes)
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
