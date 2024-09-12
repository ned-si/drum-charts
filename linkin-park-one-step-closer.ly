\version "2.24.3"
\include "definitions.ly"

\header {
  title = "Linkin Park"
  subtitle = "One Step Closer"
}

% Custom markup to create vertical space
\markup {
  \vspace #2  % Adjust this value to set the amount of space you need
}

"empty-4" = \drummode {
  \compressEmptyMeasures
  \override MultiMeasureRest.expand-limit = 1
    R1*4
}

hands-hh = \drummode {
  \numericTimeSignature
    hh8[ hh] <hh sn>[ hh]
}

hands-hho = \drummode {
    hho8[ hho] <hho sn>[ hho]
}

"hands-fill-1" = \drummode {
  hho8[ hho] <hho sn>16 tomh32 tomh toml16 toml
}

"feet-2" = \drummode {
  bd8[ bd] s4
}

"feet-3" = \drummode {
  bd8[ bd] s16 bd8 s16
}

\score {
    \new DrumStaff {
      \set DrumStaff.instrumentName = #"Guitar: 4"
      \set DrumStaff.drumStyleTable = #(alist->hash-table custom-notes)
      \new DrumVoice = "hands" { \numericTimeSignature \voiceOne \"empty-4" }
    }
}

\score {
  <<
    \new DrumStaff {
      \set DrumStaff.instrumentName = #"Intro: 4"
      \set DrumStaff.drumStyleTable = #(alist->hash-table custom-notes)
      <<
        \new DrumVoice = "hands" {
          \numericTimeSignature
          ^\markup \bold "3×"
          \voiceOne
          \bar ".|:-|"
          \repeat unfold 2 {
            \hands-hho
          }
          \bar ":|."
          \hands-hho
          \"hands-fill-1"
          \bar "|."
        }
        \new DrumVoice = "feet" {
          \voiceTwo
          \repeat unfold 3 {
            \"feet-3"
          }
          \"feet-2"
        }
      >>
    }
  >>
}
