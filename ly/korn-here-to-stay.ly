\version "2.24.3"
\include "definitions.ly"

\layout{
  \set DrumStaff.drumStyleTable = #(alist->hash-table custom-notes)
}

\header {
  title = "Korn"
  subtitle = "Here to Stay"
  composer = "nedsi"
  tagline = #f
}

% Work in progress scaffold to outline song sections.
\markup { \vspace #-1 }

\score {
  \new DrumStaff {
    \override Score.MetronomeMark.outside-staff-horizontal-padding = 1
    \tempo 4 = 96
    \set DrumStaff.instrumentName = #"Intro"
    <<
      \new DrumVoice = "hands" {
        \numericTimeSignature
        \voiceOne
        \drummode {
          \compressEmptyMeasures
          R1*4
        }
      }
      \new DrumVoice = "feet" {
        \voiceTwo
        \drummode {
          \compressEmptyMeasures
          R1*4
        }
      }
    >>
  }
}

\score {
  <<
    \new DrumStaff {
      \set DrumStaff.instrumentName = #"Verse A"
      <<
        \new DrumVoice = "hands" {
          \numericTimeSignature
          \voiceOne
          \drummode {
            \compressEmptyMeasures
            R1*4
          }
        }
        \new DrumVoice = "feet" {
          \voiceTwo
          \drummode {
            \compressEmptyMeasures
            R1*4
          }
        }
      >>
    }
  >>
}

\score {
  <<
    \new DrumStaff {
      \set DrumStaff.instrumentName = #"Chorus"
      <<
        \new DrumVoice = "hands" {
          \numericTimeSignature
          \voiceOne
          \drummode {
            \compressEmptyMeasures
            R1*4
          }
        }
        \new DrumVoice = "feet" {
          \voiceTwo
          \drummode {
            \compressEmptyMeasures
            R1*4
          }
        }
      >>
    }
  >>
}

\score {
  <<
    \new DrumStaff {
      \set DrumStaff.instrumentName = #"Bridge"
      <<
        \new DrumVoice = "hands" {
          \numericTimeSignature
          \voiceOne
          \drummode {
            \compressEmptyMeasures
            R1*4
          }
        }
        \new DrumVoice = "feet" {
          \voiceTwo
          \drummode {
            \compressEmptyMeasures
            R1*4
          }
        }
      >>
    }
  >>
}

\score {
  <<
    \new DrumStaff {
      \set DrumStaff.instrumentName = #"Outro"
      <<
        \new DrumVoice = "hands" {
          \numericTimeSignature
          \voiceOne
          \drummode {
            \compressEmptyMeasures
            R1*4
          }
        }
        \new DrumVoice = "feet" {
          \voiceTwo
          \drummode {
            \compressEmptyMeasures
            R1*4
          }
        }
      >>
    }
  >>
}

