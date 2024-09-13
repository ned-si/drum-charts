\version "2.24.0"
\include "definitions.ly"

\header {
  title = "I'm a test!"
  subtitle = "test-subtitle"
}

  hand = \drummode {
    \time 4/4
    \numericTimeSignature

    \bar ".|:-|"
    \repeat unfold 3 {hh8[ hh] <hh sn>8[ hh] hh8[ hh] <hh sn>8[ hh]}
    \bar ":|."
  }
  foot = \drummode {
    bd4.[ bd4.] bd4.[ bd4.] bd4.[ bd4.] bd4.[ bd4.]
  }

\score {
    <<
    \new DrumStaff
    <<
    \set DrumStaff.drumStyleTable = #(alist->hash-table custom-notes)
    \new DrumVoice { \voiceOne \hand }
    \new DrumVoice { \voiceTwo \foot }
    >>
    >>
  }

% example for alternative beginnings
\score {
  <<
    \new DrumStaff {
      \set DrumStaff.instrumentName = #"Intro: 4"
      \set DrumStaff.drumStyleTable = #(alist->hash-table custom-notes)
      <<
        \new DrumVoice = "hands" {
          \numericTimeSignature
          \voiceOne
          \bar ".|:-|"
          _\markup \bold "3×"
          \repeat volta 3 {
            \drummode {
              \alternative {
                \volta 1 { cymc8 }
                \volta 2-3 { hho8 }
              }
              [ hho] <hho sn>[ hho] hho[ hho] <hho sn>[ hho]
            }
          }
          %\bar ":|."
          \hands-hho
          \"hands-fill-1"
          \bar "|."
        }
        \new DrumVoice = "feet" {
          \voiceTwo
          s8
          \repeat unfold 3 {
            \"feet-3"
          }
          \"feet-2"
        }
      >>
    }
  >>
}
