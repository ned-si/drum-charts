\version "2.24.4"
\include "definitions.ly"

\layout{
  \set DrumStaff.drumStyleTable = #(alist->hash-table custom-notes)
}

\header {
  title = "Sum 41"
  subtitle = "Fat Lip"
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
    \tempo 4 = 196
    \set DrumStaff.instrumentName = #"Pre-Intro"
    \new DrumVoice = "hands" {
      \numericTimeSignature
      \voiceOne
      \drummode {
        \compressEmptyMeasures
        \override MultiMeasureRest.expand-limit = 1
        R1*7
        r2 \flam sn8 sn sn sn
      }
    }
  }
}

\score {
  \layout{ ragged-right = ##f }
  \new DrumStaff {
    \set DrumStaff.instrumentName = #"Intro"
    \new DrumVoice = "hands" {
      <>^\markup \bold "4×"
      \numericTimeSignature
      \voiceOne
      \bar ".|:-|"
      \repeat volta 4 {
        \drummode {
          <cymc bd>4 <cymc bd> <cymc sn> cymc8 bd
          \alternative {
            \volta 1,2,3 {
              <cymc bd>8 sn <cymc bd>8 bd <cymc sn> bd cymc sn
            }
            \volta 4 {
              <cymc bd>8 sn <sn bd>4 <sn bd> <sn bd>8 sn
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
    \new DrumVoice = "hands" {
      <>^\markup \bold "4×"
      \numericTimeSignature
      \voiceOne
      \bar ".|:-|"
      \repeat volta 4 {
        \drummode {
          <cymc bd>8 bd hh4 <hh sn> hh8 sn
          \alternative {
            \volta 1,3 {
              hh4 <hh bd> <hh sn> hho
            }
            \volta 2 {
              hh4 <hh bd> <hh sn> <hh bd>
            }
            \volta 4 {
              hh4 <hh bd> <hho sn> <sn bd hhp>16 sn sn sn
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
    \new DrumVoice = "hands" {
      \numericTimeSignature
      \voiceOne
      \bar ".|:-|"
      \repeat volta 8 {
        \drummode {
          \alternative {
            \volta 1,2,3,6 {
              \alternative {
                \volta 1 {
                  <cymc bd>8 bd
                }
                \volta 2,3,6 {
                  <hh bd>8[ <hh bd>]
                }
              }
              <hh sn>8 hh <hh bd> <hh bd> <hh sn> hh
            }
            \volta 4,5 {
              <hh bd>8 <hh bd> <hh sn> hh <hh bd> <hh bd> <hh sn> sn16 sn
            }
            \volta 7 {
              <hh bd>8 <hh bd> <hh sn> hh <hh bd> <hh bd> <hho sn>4
            }
            \volta 8 {
              <sn bd hhp>16 sn sn sn <tomh bd> tomh tomh tomh <sn bd> sn tomh
              tomh <tomfh bd> tomfh tomfh tomfh
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
    \new DrumVoice = "hands" {
      <>^\markup \bold "4×"
      \numericTimeSignature
      \voiceOne
      \bar ".|:-|"
      \repeat volta 4 {
        \drummode {
          <cymc bd>4 <cymc sn>8 bd <cymc bd>4 <cymc sn>8 bd
          \alternative {
            \volta 1,3 {
              <cymc bd>4 <cymc sn> <cymc bd>8 bd <cymc sn> bd
            }
            \volta 2 {
              <cymc bd>4 <cymc sn>8 bd <cymc bd>4 <cymc sn>
            }
            \volta 4 {
              <cymc bd>8 sn <sn bd> sn <sn bd> sn <sn bd> sn
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
    \set DrumStaff.instrumentName = #"Post-Chorus"
    \new DrumVoice = "hands" {
      \numericTimeSignature
      \voiceOne
      \bar ".|:-|"
      \repeat volta 5 {
        \drummode {
          \alternative {
            \volta 1,2,3 {
              <cymc bd>4 <cymc bd> <cymc sn> cymc8 bd
              <cymc bd>8 sn <cymc bd>8 bd <cymc sn> bd cymc8 sn
            }
            \volta 4 {
              <cymc bd>4 <cymc bd> <cymc sn> cymc8 sn
              <cymc bd>8 <sn bd> <sn bd>4 <sn bd> <sn bd>8 sn
            }
            \volta 5 {
              <cymc bd>4 r4 r4. sn8
              <sn bd>4 <tomfh bd> sn8 sn sn4
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
    { "Pre-Chorus" }
    \hspace #0
    { "Chorus" }
  }
}

\score {
  \new DrumStaff {
    \set DrumStaff.instrumentName = #"Post-Chorus-2"
    \new DrumVoice = "hands" {
      \numericTimeSignature
      \voiceOne
      \bar ".|:-|"
      \repeat volta 4 {
        \drummode {
          \alternative {
            \volta 1,3 {
              <cymc bd>8 sn <hho bd>8 bd <hho sn>4 <hho sn>8 bd
              hho8 sn <hho bd>8 bd <hho sn>4 hho8 bd
            }
            \volta 2 {
              <cymc bd>8 bd hho4 <hho sn> <hho sn>8 bd
              hho8 sn hho8 bd16 bd <cymc sn>4 hho
            }
            \volta 4 {
              <hho bd>8 bd hho4 <hho sn> <sn bd hhp>8 sn
              r1
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
    \override Score.MetronomeMark.outside-staff-horizontal-padding = 1
    \set DrumStaff.instrumentName = #"Bridge-1"
    \new DrumVoice = "hands" {
      \numericTimeSignature
      \voiceOne
      \drummode {
        \compressEmptyMeasures
        \override MultiMeasureRest.expand-limit = 1
        R1*8
      }
    }
  }
}

\score {
  \layout{ ragged-right = ##f }
  \new DrumStaff {
    \set DrumStaff.instrumentName = #"Bridge-2"
    \new DrumVoice = "hands" {
      \numericTimeSignature
      \voiceOne
      \bar ".|:-|"
      \repeat volta 4 {
        \drummode {
          <>^\markup \bold "4×"
          <cymc bd>4 <hh bd> <hh sn> hh8 sn
          \alternative {
            \volta 1,3 {
              <hh bd>4 <hh bd> <hh sn> hh8 sn
            }
            \volta 2 {
              hh4 <hh bd> <hh sn> hho
            }
            \volta 4 {
              hh4 hh8 bd \flam sn bd \flam sn bd
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
    \set DrumStaff.instrumentName = #"Bridge-3"
    \new DrumVoice = "hands" {
      \numericTimeSignature
      \voiceOne
      \bar ".|:-|"
      \repeat volta 4 {
        \drummode {
          <>^\markup \bold "4×"
          <cymc bd>4 <cymc bd> <cymc sn> cymc8 bd
          \alternative {
            \volta 1,4 {
              <cymc bd>8 sn <cymc bd> bd <cymc sn> bd cymc8 sn
            }
            \volta 2 {
              <cymc bd>8 sn <cymc bd> bd <cymc sn> bd cymc4
            }
            \volta 3 {
              <cymc bd>8 sn <cymc bd> bd \flam sn bd \flam sn bd
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
    \set DrumStaff.instrumentName = #"Bridge-4"
    \new DrumVoice = "hands" {
      \numericTimeSignature
      \voiceOne
      \bar ".|:-|"
      \drummode {
        <cymc bd>4 <cymc bd> <cymc sn> cymc8 sn
        <cymc bd>4 <\parenthesize cymc bd>4 r2
        <cymc bd>4 <\parenthesize cymc bd>4 r2
        <cymc bd>4 <cymc bd> <cymc sn>8 bd cymc sn
        <cymc bd>4 <cymc bd>8 bd <cymc sn> bd cymc sn
        <cymc bd>4 <cymc bd> <cymc sn> cymc4
        <cymc bd>4 <hho bd> <hho sn> <hho sn>8 bd
        hho8 sn hho bd <hho sn> bd hho sn:16
        <hho bd>4 <hho bd> <hho sn> <hho sn>8 bd
        hho8 sn hho bd <hho sn>4 hho
        <sn tomfh hhp>8 bd \repeat unfold 3 { <sn tomfh> bd }
        \repeat unfold 4 { <sn tomfh> bd }
        \repeat unfold 4 { <sn tomfh> bd }
        \repeat unfold 2 { <sn tomfh bd> <sn tomfh> } \repeat unfold 2 { <sn
        bd>16 sn sn sn }
      }
      \bar "|."
    }
  }
}

\score {
  \new DrumStaff {
    \set DrumStaff.instrumentName = #"Chorus"
    \new DrumVoice = "hands" {
      <>^\markup \bold "4×"
      \numericTimeSignature
      \voiceOne
      \bar ".|:-|"
      \repeat volta 4 {
        \drummode {
          \makePercent
          s1
          \alternative {
            \volta 4 {
              <cymc bd>4 <cymc sn>8 bd \flam sn bd \flam sn bd
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
    \set DrumStaff.instrumentName = #"Post-Chorus-3"
    \new DrumVoice = "hands" {
      \numericTimeSignature
      \voiceOne
      \bar ".|:-|"
      \repeat volta 4 {
        \drummode {
          <cymc bd>4 <cymc bd> <cymc sn> cymc8 sn
          \alternative {
            \volta 1,3 {
              <cymc bd>4 <cymc bd> <cymc sn> cymc8 sn
            }
            \volta 2 {
              <cymc bd>4 <cymc bd>8 bd <cymc sn>4 cymc8 sn16 sn
            }
            \volta 4 {
              <cymc bd>8 sn <sn bd> sn <sn bd> sn <sn bd> sn
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
      \repeat volta 4 {
        \drummode {
          <>^\markup \bold "4×"
          <cymc bd>4 <cymc bd> <cymc sn> cymc8 bd
          \alternative {
            \volta 1,2,3 {
              <cymc bd>8 sn <cymc bd> bd <cymc sn> bd cymc sn
            }
            \volta 4 {
              <cymc bd>8 sn <cymc bd> bd <cymc sn> bd cymc4
            }
          }
          <sn tomfh bd>8 <sn tomfh> r4 r4 <sn tomfh bd>8 <sn tomfh>
        }
      }
      \bar "|."
    }
  }
}
