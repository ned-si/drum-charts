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
