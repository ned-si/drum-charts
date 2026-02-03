\version "2.24.3"
\include "definitions.ly"

\layout{
  \set DrumStaff.drumStyleTable = #(alist->hash-table custom-notes)
}

\header {
  title = "Linkin Park"
  subtitle = "One Step Closer"
  composer = "nedsi"
  tagline = #f
}

% Custom markup to create vertical space after header
\markup {
  \vspace #-1
}

\score {
  \new DrumStaff {
    \override Score.MetronomeMark.outside-staff-horizontal-padding = 1
    \tempo 4 = 95
    \set DrumStaff.instrumentName = #"Intro"
    \new DrumVoice = "hands" {
      \numericTimeSignature
      \voiceOne
      \drummode {
        \compressEmptyMeasures
        \override MultiMeasureRest.expand-limit = 1
        R1*4
      }
    }
  }
}

\score {
  \layout{ ragged-right = ##f }
  \new DrumStaff {
    \set DrumStaff.instrumentName = #"Chorus"
    \new DrumVoice = "hands" {
      \numericTimeSignature
      \voiceOne
      \bar ".|:-|"
      \repeat volta 3 {
        \drummode {
          \alternative {
            \volta 1 { <cymc bd>8 }
            \volta 2,3 { <hho bd>8 }
          }
          [ <hho bd>] <hho sn>16 bd hho8 <hho bd> <hho bd> <hho sn>16 bd hho8
        }
      }
      \bar ":|."
      \drummode {
        <hho bd>8 <hho bd> <hho sn>16 bd hho8 <hho bd> <hho bd> <hho sn>16 tomh32 tomh sn16 sn
      }
      \bar "|."
    }
  }
}

\score {
  \layout{ ragged-right = ##f }
  \new DrumStaff {
    \set DrumStaff.instrumentName = #"Verse-1"
    \new DrumVoice = "hands" {
      \numericTimeSignature
      \voiceOne
      \bar ".|:-|"
      \repeat volta 3 {
        \drummode {
          \alternative {
            \volta 1,3 { <cymc bd>8 }
            \volta 2 { <hh bd>8 }
          }
          [ <hh bd>] <hh sn>16 bd hh hho <hh bd hhp>8 <hh bd> <hh sn>8 hh16 hho
        }
      }
      \drummode {
        <hh bd hhp>8 hh <hh sn>16 bd hh hho <hho bd>8 <hho bd> <hho sn>16 tomh32 tomh sn16 sn
      }
      \bar "|."
    }
  }
}

\score {
  \layout{ ragged-right = ##f }
  \new DrumStaff {
    \set DrumStaff.instrumentName = #"Verse-2"
    \new DrumVoice = "hands" {
      \numericTimeSignature
      \voiceOne
      \bar ".|:-|"
      <>^\markup \bold "3×"
      \drummode {
        <cymc bd>8 <hho bd> <hho sn>16 bd hho8 <hho bd> <hho bd> <hho sn>16 bd hho hho
      }
      \bar ":|."
      \repeat unfold 2 {
        \drummode {
          <hho bd>16 hho <hho bd>8 <hho sn>16 bd hho hho
        }
      }
      \drummode {
        <bd hhp>1
      }
    }
  }
}

\score {
  \new DrumStaff {
    \set DrumStaff.instrumentName = #"Pre-Chorus"
    \new DrumVoice = "hands" {
      \numericTimeSignature
      \time 2/4
      \voiceOne
      \drummode {
        r2
      }
      \bar "|."
    }
  }
}

\markuplist {
  \column
  \bold {
    { "Chorus" }
    \hspace #0
    { "Verse-1" }
    \hspace #0
    { "Verse-2" }
    \hspace #0
  }
}

\score {
  \new DrumStaff {
    \set DrumStaff.instrumentName = #"Pre-Bridge"
    \new DrumVoice = "hands" {
      \numericTimeSignature
      \time 2/4
      \voiceOne
      \drummode {
        r4 sn16 sn sn sn
      }
      \bar "|."
    }
  }
}

\score {
  \layout{ ragged-right = ##f }
  \new DrumStaff {
    \set DrumStaff.instrumentName = #"Bridge"
    \new DrumVoice = "hands" {
      \numericTimeSignature
      \voiceOne
      \bar ".|:-|"
      <>^\markup \bold "8×"
      \repeat volta 8 {
        \drummode {
          <cymc bd>8 <hho bd> <hho sn>16 bd hho8
          \alternative {
            \volta 1,2,3,5,6,7,8 {
              <cymc bd>8 <hho bd> <hho sn>16 bd hho8
            }
            \volta 4 {
              <hho bd>8 <hho bd> <hho sn>16 sn32 sn sn16 sn
            }
          }
        }
      }
      \drummode {
        <cymch bd>8 <cymch bd> <cymch sn> <cymch bd> <cymch bd> <cymch bd> <cymch sn> <\parenthesize cymch bd>
        \compressEmptyMeasures
        \override MultiMeasureRest.expand-limit = 1
        R1*4
      }
      \bar "|."
    }
  }
}

\score {
  \layout{ ragged-right = ##f }
  \new DrumStaff {
    \set DrumStaff.instrumentName = #"Breakdown"
    \new DrumVoice = "hands" {
      \numericTimeSignature
      \voiceOne
      \bar ".|:-|"
      \repeat volta 8 {
        \drummode {
          <cymc bd>8 <hho bd> <hho sn>16 bd hho8 <cymc bd> hho16 bd
          \alternative {
            \volta 1,2,3,5,6,7 {
              <hho sn>16 bd sn sn
            }
            \volta 4 {
              \tuplet 3/2 { \repeat unfold 3 { <sn tomfh>8 }}
            }
            \volta 8 {
              \repeat unfold 4 { <sn tomfh>16 }
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
    \set DrumStaff.instrumentName = #"Outro"
    \new DrumVoice = "hands" {
      \numericTimeSignature
      \voiceOne
      \bar ".|:-|"
      <>^\markup \bold "8×"
      \repeat volta 8 {
        \drummode {
          <cymc bd>8 <hho bd> <hho sn>16 bd hho8
          \alternative {
            \volta 1,2,3,5,6,7,8 {
              <cymc bd>8 <hho bd> <hho sn>16 bd hho8
            }
            \volta 4 {
              <hho bd>8 <hho bd> <hho sn>16 tomh hho tomh
            }
          }
        }
      }
      \drummode {
        <cymch bd>8 <cymch bd> <cymch sn> <cymch bd> <cymch bd> <cymch bd> <cymch sn> <\parenthesize cymch bd>
      }
      \bar "|."
    }
  }
}
