\version "2.24.4"
\include "definitions.ly"

\layout{
  \set DrumStaff.drumStyleTable = #(alist->hash-table custom-notes)
}

\header {
  title = "Muse"
  subtitle = "Time Is Running Out"
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
    \tempo 4 = 92
    \set DrumStaff.instrumentName = #"Intro"
    \new DrumVoice = "hands" {
      \numericTimeSignature
      \voiceOne
      \drummode {
        \compressEmptyMeasures
        \override MultiMeasureRest.expand-limit = 1
        R1*3
        r2 r4. \parenthesize hho8
      }
    }
  }
}

\score {
  \layout{ ragged-right = ##f }
  \new DrumStaff {
    \set DrumStaff.instrumentName = #"Verse 1"
    \new DrumVoice = "hands" {
      <>^\markup \bold "16×"
      \numericTimeSignature
      \voiceOne
      \bar ".|:-|"
      \repeat volta 16 {
        \drummode {
          <hh bd>8 hh <hh sn> hh
          \alternative {
            \volta 1,2,3,5,6,7,9,10,11,13,14,15 {
              <hh bd> hh <hh sn> hh
            }
            \volta 4,8,12 {
              <hh bd> hh <hh sn> hho]
            }
            \volta 8 {
              <hh bd> hh <hho sn>4
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
    \set DrumStaff.instrumentName = #"Pre-Chorus 1"
    \new DrumVoice = "hands" {
      <>^\markup \bold "8×"
      \numericTimeSignature
      \voiceOne
      \bar ".|:-|"
      \repeat volta 8 {
        \drummode {
          <tomfh sn bd>8 <tomfh sn bd> <tomfh sn bd> <tomfh sn bd> <tomfh sn bd>[ <tomfh
          sn bd>]
          \alternative {
            \volta 1,2,3,4,5,6,7 {
              <tomfh sn bd>[ <tomfh sn bd>]
            }
            \volta 8 {
              sn16 sn sn sn
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
    \set DrumStaff.instrumentName = #"Chorus 1"
    \new DrumVoice = "hands" {
      \numericTimeSignature
      \voiceOne
      \bar ".|:-|"
      \repeat volta 8 {
        \drummode {
          \alternative {
            \volta 1,2,3,4,5,6,7 {
              <cymc bd>8 <cymc bd> <cymc sn> <cymc bd> <cymc bd> <cymc bd> <cymc sn> <cymc bd>
            }
            \volta 8 {
              \repeat unfold 2 { <tomfh toml>8 bd \flam sn bd }
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
    \set DrumStaff.instrumentName = #"Bridge 1"
    \new DrumVoice = "hands" {
      <>^\markup \bold "4×"
      \numericTimeSignature
      \voiceOne
      \bar ".|:-|"
      \repeat volta 4 {
        \drummode {
          <tomfh toml bd>8 <tomfh toml bd> \flam sn bd
          \alternative {
            \volta 1,2,3 {
                r4 \flam sn4
            }
            \volta 4 {
              <tomfh toml bd>8 <tomfh toml bd> \flam sn bd
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
    \set DrumStaff.instrumentName = #"Verse 2"
    \new DrumVoice = "hands" {
      <>^\markup \bold "12×"
      \numericTimeSignature
      \voiceOne
      \bar ".|:-|"
      \repeat volta 12 {
        \drummode {
          <hh bd>8 bd <hh sn> bd
          \alternative {
            \volta 1,2,3,5,6,7,9,10,11 {
              hh4 <hh sn>
            }
            \volta 4,8,12 {
              <hh bd>8 bd <hh sn> bd
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
    \set DrumStaff.instrumentName = #"Pre-Chorus 2"
    \new DrumVoice = "hands" {
      \numericTimeSignature
      \voiceOne
      \bar ".|:-|"
      \repeat volta 8 {
        \drummode {
          \alternative {
            \volta 1,2,3,4,5,6,7 {
              tomfh16 toml tomfh bd \flam sn8 tomfh16 toml tomfh toml tomfh bd \flam
              sn8 hho
            }
            \volta 8 {
              bd8 \flam sn16 bd8  bd16 \flam sn8 \flam sn16 bd8 bd16 \flam sn16 bd sn sn
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
    \set DrumStaff.instrumentName = #"Chorus 2"
    \new DrumVoice = "hands" {
      \numericTimeSignature
      \voiceOne
      \bar ".|:-|"
      \repeat volta 8 {
        \drummode {
          \alternative {
            \volta 1,2,3,4,5,6,7 {
              <cymc bd>8 <cymc bd> <cymc sn> <cymc bd> <cymc bd> <cymc bd> <cymc sn> <cymc bd>
            }
            \volta 8 {
              <cymc bd>8 <cymc bd> <cymc sn> <cymc bd> <cymc bd>8 sn16 sn sn sn sn sn
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
    \set DrumStaff.instrumentName = #"Bridge 2"
    \new DrumVoice = "hands" {
      \numericTimeSignature
      \voiceOne
      \bar ".|:-|"
      \repeat volta 8 {
        \drummode {
          \alternative {
            \volta 1,2,3,5 {
              \repeat unfold 2 { <cymc bd>8 cymc <cymc sn> cymc }
            }
            \volta 4 {
              \repeat unfold 2 { <cymc sn bd>8 <cymc bd> <cymc sn bd> <cymc bd> }
            }
            \volta 6 {
              <cymc bd>8 cymc <cymc sn> cymc <cymc bd> cymc <cymc sn> sn16 sn
            }
            \volta 7 {
              <cymc bd>8 <cymc bd> <cymc sn> cymc16 sn <cymc bd>8 <cymc bd> <cymc sn> cymc
            }
            \volta 8 {
              <cymc bd>8 sn16 sn sn sn tomh8 sn16 tomh tomfh bd \flam sn8 bd
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
    { "Verse 1 - 12x" }
    \hspace #0
    { "Pre-Chorus 2" }
    \hspace #0
    { "Chorus 2" }
  }
}

\score {
  \layout{ ragged-right = ##f }
  \new DrumStaff {
    \set DrumStaff.instrumentName = #"Bridge 2"
    \new DrumVoice = "hands" {
      <>^\markup \bold "8×"
      \numericTimeSignature
      \voiceOne
      \bar ".|:-|"
      \repeat volta 8 {
        \drummode {
          \makePercent
          s1
          \alternative {
            \volta 8 {
              <cymc bd>8 <cymc bd> <cymc sn> <cymc bd> <toml tomfh bd>8 <toml tomfh bd> \flam sn4
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
          \alternative {
            \volta 1,2 {
              <toml tomfh bd>8 <toml tomfh bd> \flam sn <toml tomfh bd> r4 \flam sn
            }
            \volta 3 {
              <toml tomfh bd>8 <toml tomfh bd> \flam sn <toml tomfh bd> r4 \flam sn8
              sn16 sn
            }
            \volta 4 {
              <toml tomfh bd>8 <toml tomfh bd> \flam sn <toml tomfh bd> r2
            }
          }
        }
      }
      \bar "|."
    }
  }
}
