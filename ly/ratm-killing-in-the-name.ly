\version "2.24.4"
\include "definitions.ly"

\layout{
  \set DrumStaff.drumStyleTable = #(alist->hash-table custom-notes)
}

\header {
  title = "Rage Against The Machine"
  subtitle = "Killing In The Name"
  composer = "nedsi"
  tagline = #f
}

% Custom markup to create vertical space after header
\markup {
  \vspace #-1
}

\score {
  \layout{ ragged-right = ##f }
  \new DrumStaff {
  \override Score.MetronomeMark.outside-staff-horizontal-padding = 1
  \tempo 4 = 110
    \set DrumStaff.instrumentName = #"Pre-Intro"
    \new DrumVoice = "all" {
      \numericTimeSignature
      \voiceOne
      \bar ".|:-|"
      \repeat volta 8 {
        \drummode {
          \alternative {
            \volta 1,2,3,4 {
              <cymc cymch bd>4 hho hho hho
            }
            \volta 5 {
              <bd hhp>1
            }
            \volta 6,7 {
              R1
            }
            \volta 8 {
              r2. r8 \flam sn
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
  \tempo 4 = 124
    \set DrumStaff.instrumentName = #"Intro"
    \new DrumVoice = "all" {
      \numericTimeSignature
      \voiceOne
      \bar ".|:-|"
      \repeat volta 8 {
        \drummode {
          \alternative {
            \volta 1 {
              <cymc bd>8
            }
            \volta 2,3,4,5,6,7,8 {
              <hh bd>8[
            }
          }
          hh16 bd <hh sn>8 <hh bd>] hh16 sn hh bd <hh sn>8 <hh bd>
        }
      }
      \bar "|."
    }
  }
}

\score {
  \layout{ ragged-right = ##f }
  \new DrumStaff {
  \tempo 4 = 115
    \set DrumStaff.instrumentName = #"Post-Intro"
    \new DrumVoice = "all" {
      <>^\markup \bold "4×"
      \numericTimeSignature
      \voiceOne
      \bar ".|:-|"
      \repeat volta 4 {
        \drummode {
          \tuplet 3/2 {
            <cymc sn>8 bd <cymc sn> bd <cymc sn> bd
          }
          \alternative {
            \volta 1,2,3 {
              \tuplet 3/2 {
                <cymc bd>4 <cymc bd> <cymc bd>
              }
            }
            \volta 4 {
              bd2
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
  \tempo 4 = 80
    \set DrumStaff.instrumentName = #"Pre-Verse"
    \new DrumVoice = "all" {
      \numericTimeSignature
      \voiceOne
      \bar ".|:-|"
      \repeat volta 4 {
        \drummode {
          \alternative {
            \volta 1 {
              <cymc cymch bd>8
            }
            \volta 2,3,4 {
              <hho bd>8[
            }
          }
          hho8 <hho sn> hho] 
          \alternative {
            \volta 1,2,3 {
              <hho bd> hho <hho sn> hho
            }
            \volta 4 {
              <hho bd>16 bd hho bd <hho sn> bd \flam sn8
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
      \numericTimeSignature
      \voiceOne
      \bar ".|:-|"
      \repeat volta 8 {
        \drummode {
          \alternative {
            \volta 1 {
              <cymc cymch bd>8
            }
            \volta 2,3,4,5,6,7,8 {
              <hh bd>8[
            }
          }
          hh8 <hh sn> hh] 
          \alternative {
            \volta 1,2,3,5,6,7 {
              <hh bd>8 hh <hh sn> hho
            }
            \volta 4 {
              <hh bd>16 bd hh bd <hh sn>8 <hho bd>
            }
            \volta 8 {
              <hho bd>8 hho16 bd <hho sn> bd <hho sn>8
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
      <>^\markup \bold "4×"
      \numericTimeSignature
      \voiceOne
      \bar ".|:-|"
      \repeat volta 4 {
        \drummode {
          <cymc bd>8 hho <hho sn> hho
          \alternative {
            \volta 1,3 {
              <cymc bd>8 hho <hho sn> hho
            }
            \volta 2 {
              <cymc bd>8 hho16 bd <hho sn>8 <cymc bd>
            }
            \volta 4 {
              <cymc sn bd>16 <cymc sn bd> <cymc sn bd> <cymc sn bd> <cymc sn bd>
              <cymc sn bd> <cymc sn bd> <cymc sn bd> 
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
  \tempo 4 = 89
    \set DrumStaff.instrumentName = #"Bridge"
    \new DrumVoice = "all" {
      \numericTimeSignature
      \voiceOne
      \bar ".|:-|"
      \repeat volta 12 {
        \drummode {
          \alternative {
            \volta 1,2,3,4 {
              <sn tomfh hhp>16 <sn tomfh hhp>8. <sn tomfh hhp>4 hhp hhp
            }
            \volta 5,6,7,8,9,10,11 {
              <sn tomfh>16 <sn tomfh> hhp bd <sn tomfh>16 bd8 bd16 \flam sn8
              sn16 bd
            }
            \volta 12 {
              <sn tomfh>16 <sn tomfh> hhp bd <sn tomfh> bd <cymc sn>8 \tuplet
              6/4 { sn16 sn sn sn sn sn } \tuplet 6/4 { sn sn sn sn sn sn }
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
    \set DrumStaff.instrumentName = #"Break"
    \new DrumVoice = "all" {
      \numericTimeSignature
      \voiceOne
      \bar ".|:-|"
      \repeat volta 8 {
        \drummode {
          \alternative {
            \volta 1,2,3,5,6,7 {
              <cymc bd>16 bd hho bd <hho sn>8 hho16 bd hho8 <hho bd>16 bd <hho
              sn>8 hho
            }
            \volta 4,8 {
              <cymc bd>16 bd hho bd <hho sn>8 hho16 sn hho sn <hho bd> bd <hho
              sn> bd <hho sn>8
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
    \hspace #0
    { "Verse" }
    \hspace #0
    { "Chorus" }
    \hspace #0
    { "Bridge" }
    \hspace #0
    { "Break - 16x" }
  }
}

\score {
  \layout{ ragged-right = ##f }
  \new DrumStaff {
    \set DrumStaff.instrumentName = #"Pre-Outro"
    \new DrumVoice = "all" {
      \numericTimeSignature
      \voiceOne
      \bar ".|:-|"
      \repeat volta 8 {
        \drummode {
          \alternative {
            \volta 1 {
              \repeat unfold 4 {
                <cymc bd>32 <cymch hhp> <cymc bd> <cymch hhp> <cymc bd> <cymch
                hhp> <cymc bd> <cymch hhp>
              }
            }
            \volta 2,3,4,5,6 {
              \repeat unfold 4 {
                <cymc bd>32 <cymch hhp> <sn bd> <sn hhp> <sn bd> <sn hhp> <sn
                bd> <sn hhp>
              }
            }
            \volta 7 {
              \repeat unfold 4 {
                <cymc bd>32 cymch cymc cymch cymc cymch <cymc bd> cymch
              }
            }
            \volta 8 {
              \repeat unfold 4 {
                <cymc bd>32 cymch cymc cymch cymc cymch cymc cymch
              }
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
    \hspace #0
    { "Break - 12x" }
  }
}

\score {
  \layout{ ragged-right = ##f }
  \new DrumStaff {
    \set DrumStaff.instrumentName = #"Outro"
    \new DrumVoice = "all" {
      \numericTimeSignature
      \voiceOne
      \bar ".|:-|"
      \drummode {
        \repeat unfold 4 {
          \tuplet 6/4 {
            sn16 sn sn sn sn sn
          }
        }
        \tuplet 3/2 { <cymc bd>4_\markup { \italic "rit." } <cymc bd> <cymc bd>
        }
        \tuplet 3/2 { <cymc sn>4 <cymc sn> <cymc sn> }
      }
      \bar "|."
    }
  }
}
