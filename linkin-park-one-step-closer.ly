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

empty = \drummode {
  \numericTimeSignature
  \compressEmptyMeasures
  \override MultiMeasureRest.expand-limit = 1
    R1*4
}

hands-hh = \drummode {
  \numericTimeSignature
    hh8[ hh] <hh sn>[ hh] hh8[ hh] <hh sn>[ hh]
}

hands-hho = \drummode {
  \numericTimeSignature
    hho8[ hho] <hho sn>[ hho] hho8[ hho] <hho sn>[ hho]
}

"hands-fill-1" = \drummode {
  hho8[ hho] <hho sn>[ hho] hho8[ hho] [<hho sn>16 tomh32 tomh toml16 toml]
}

"feet-2" = \drummode {
  bd8[ bd] s4 bd8[ bd] s4
}

"feet-3" = \drummode {
  bd8[ bd] s16 bd8 s16 bd8[ bd] s16 bd8 s16
}

"feet-fill-1" = \drummode {
  bd8[ bd] s16 bd8 s16 bd8[ bd] s4
}

\score {
    \new DrumStaff {
      \set DrumStaff.instrumentName = #"Guitar: 4"
      \set DrumStaff.drumStyleTable = #(alist->hash-table custom-notes)
      \new DrumVoice = "hands" { \voiceOne \empty }
    }
}

\score {
  <<
    \new DrumStaff {
      \set DrumStaff.instrumentName = #"Intro: 4"
      \set DrumStaff.drumStyleTable = #(alist->hash-table custom-notes)
      <<
        \new DrumVoice = "hands" {
          ^\markup { \bold "3×" }
          \voiceOne
          \bar ".|:-|"
          \hands-hho |
          \bar ":|."
          \"hands-fill-1"
          \bar "|."
        }
        \new DrumVoice = "feet" {
          \voiceTwo
          \"feet-3" |
          \"feet-fill-1"
        }
      >>
    }
  >>
}


