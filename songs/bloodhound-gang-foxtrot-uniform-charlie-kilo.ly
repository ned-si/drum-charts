\version "2.24.4"
\include "definitions.ly"

\layout{
  \set DrumStaff.drumStyleTable = #(alist->hash-table custom-notes)
}

\header {
  title = "Bloodhound Gang"
  subtitle = "Foxtrot Uniform Charlie Kilo"
  composer = "nedsi"
  tagline = #f
}

% Custom markup to create vertical space after header
\markup {
  \vspace #-1
}

\score {
  \new DrumStaff {
  \override Score.MetronomeMark.outside-staff-horizontal-padding = 5
  \tempo 4 = 136
    \set DrumStaff.instrumentName = #"Pre-Intro"
    \new DrumVoice = "all" {
      \numericTimeSignature
      \voiceOne
      \bar ".|:-|"
      \drummode {
        r2. <\parenthesize cymc bd>4
      }
      \bar "|."
    }
  }
}

\score {
  \layout{ ragged-right = ##f }
  \new DrumStaff {
    \set DrumStaff.instrumentName = #"Intro"
    \new DrumVoice = "all" {
      <>^\markup \bold "8×"
      \numericTimeSignature
      \voiceOne
      \bar ".|:-|"
      \repeat volta 8 {
        \drummode {
          <hh bd>8 <hh bd> <hh sn> <hh bd> <hh bd> hh <hh sn> hh
          \alternative {
            \volta 8 {
              <hh bd>8 <hh bd> <hh sn> <hh bd> <hh bd> hh <\parenthesize cymc
              bd>4
            }
          }
        }
      }
      \bar "|."
    }
  }
}

\score {
  \layout{ ragged-right = ##f }
  \new DrumStaff {
    \set DrumStaff.instrumentName = #"Verse"
    \new DrumVoice = "all" {
      <>^\markup \bold "16×"
      \numericTimeSignature
      \voiceOne
      \bar ".|:-|"
      \repeat volta 16 {
        \drummode {
          <hh bd>8 hh <hh sn> hh <hh bd> hh <hh sn> hh
          \alternative {
            \volta 16 {
              <\parenthesize cymc bd>4 hhp hhp hhp 
            }
          }
        }
      }
      \bar "|."
    }
  }
}

\score {
  \new DrumStaff {
    \set DrumStaff.instrumentName = #"Pre-Chorus"
    \new DrumVoice = "all" {
      <>^\markup \bold "4×"
      \numericTimeSignature
      \voiceOne
      \bar ".|:-|"
      \repeat volta 4 {
        \drummode {
          <cymc bd>4 <cymc sn> <cymc bd>8 bd <cymc sn> bd
          cymc8 bd <cymc sn>4 <cymc bd>8 bd <cymc sn>4
          \alternative {
            \volta 4 {
              <cymc bd>4 <cymc sn>8. sn16 <cymc bd>8 <cymc bd> <cymch sn>4
              <cymc bd>4 <cymc sn>8. sn16 <cymc bd>8 <cymc bd> <cymch sn>4
            }
          }
        }
      }
      \bar "|."
    }
  }
}

\score {
  \layout{ ragged-right = ##f }
  \new DrumStaff {
    \set DrumStaff.instrumentName = #"Chorus"
    \new DrumVoice = "all" {
      \numericTimeSignature
      \voiceOne
      \bar ".|:-|"
      \repeat volta 8 {
        \drummode {
          \alternative {
            \volta 1,5 {
              <cymc bd>4 <hho sn>8 hho <hho bd> hho <hho sn> hho
            }
            \volta 2,3,4,6,7,8 {
              <hho bd>8 hho <hho sn> hho <hho bd> hho <hho sn> hho
            }
          }
        }
      }
      \bar "|."
    }
  }
}

\markuplist {
  \column
  \bold {
    { "Intro" }
    \hspace #0
    { "Verse" }
    \hspace #0
    { "Pre-Chorus" }
    \hspace #0
    { "Chorus" }
    \hspace #0
  }
}

\score {
  \layout{ ragged-right = ##f }
  \new DrumStaff {
    \set DrumStaff.instrumentName = #"Outro"
    \new DrumVoice = "all" {
      <>^\markup \bold "16×"
      \numericTimeSignature
      \voiceOne
      \bar ".|:-|"
      \repeat volta 16 {
        \drummode {
          <cymc bd>8 bd <cymc sn> bd <cymc bd>4 <cymc sn>
          \alternative {
            \volta 4,8,12 {
              <cymc bd>8 bd <cymc sn> bd cymc bd <cymc sn>4
            }
            \volta 16 {
              <cymc bd>1
            }
          }
        }
      }
      \bar "|."
    }
  }
}
