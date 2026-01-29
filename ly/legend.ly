\version "2.24.3"
\include "definitions.ly"

\header {
  title = "Legend"
}

\score {
  <<
    \new DrumStaff \with {
      \remove "Time_signature_engraver"
    }
    << \allheads >>
  >>
}

%%
\score {
  <<
    \new DrumStaff \with {
      \remove "Time_signature_engraver"
    }
    <<
      \set DrumStaff.drumStyleTable = #(alist->hash-table custom-notes)
      \new DrumVoice = "mus" { \stemUp \defnote }
      \new Lyrics \lyricsto "mus" {
        \override LyricText.font-size = #-1 % Adjust size as needed (positive to increase, negative to decrease)
        \defname
      }
    >>
  >>
}

