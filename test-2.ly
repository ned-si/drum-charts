\version "2.24.3"
\include "definitions.ly"

\header {
  title = "I'm a test!"
  subtitle = "test-subtitle"
}

% Custom markup to create vertical space
\markup {
  \vspace #2  % Adjust this value to set the amount of space you need
}

% Define the hands and feet sections
hand = \drummode {
  \time 4/4
  \numericTimeSignature
  \repeat unfold 3 {
    hh8[ hh] <hh sn>8[ hh] hh8[ hh] <hh sn>8[ hh]
  }
}

foot = \drummode {
  bd4.[ bd4.] bd4.[ bd4.] bd4.[ bd4.] bd4.[ bd4.]
}

empty = \drummode {
  \time 4/4
  \numericTimeSignature
  \compressEmptyMeasures
  \override MultiMeasureRest.expand-limit = 3
    R1*4
}

\score {
  <<
    \new DrumStaff {
      % Set the instrument name to display "Intro" or any other section
      \set DrumStaff.instrumentName = #"Intro: 3"
      
      \set DrumStaff.drumStyleTable = #(alist->hash-table custom-notes)

        % Voice for hands (stems up)
        \new DrumVoice = "hands" {
          \voiceOne
          \stemUp  % Force stems up
          \empty
        }
    }
  >>
}

\score {
  <<
    \new DrumStaff {
      % Set the instrument name to display "Intro" or any other section
      \set DrumStaff.instrumentName = #"Verse1: 4"
      
      \set DrumStaff.drumStyleTable = #(alist->hash-table custom-notes)

      <<
        % Voice for hands (stems up)
        \new DrumVoice = "hands" {
          \voiceOne
          \stemUp  % Force stems up
          \hand
        }

        % Voice for feet (stems down)
        \new DrumVoice = "feet" {
          \voiceTwo
          \stemDown  % Force stems down
          \foot
        }
      >>
    }
  >>
}

