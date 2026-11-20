\version "2.24.4"
\include "definitions.ly"

\layout{
  \set DrumStaff.drumStyleTable = #(alist->hash-table custom-notes)
}

\header {
  title = "Underschool Element"
  subtitle = "Petit Tom"
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
    \set DrumStaff.instrumentName = #"Pre-Intro"
    \new DrumVoice = "all" {
      \numericTimeSignature
      \voiceOne
      \drummode {
        \compressEmptyMeasures
        \override MultiMeasureRest.expand-limit = 1
        R1*3
        r2 r8 \parenthesize cymc8 r4
      }
    }
  }
}

\score {
  \layout{ ragged-right = ##f }
    \new DrumStaff {
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
              <hh bd>16[ \parenthesize sn
            }
          }
          hho8] <hh sn>8 hho16 \parenthesize sn hh \parenthesize sn <hho bd>8
          \alternative {
            \volta 1,2,3,5,6,7 {
              <hh sn>8 hho16 bd
            }
            \volta 4 {
              sn16 tomh tomh <hh bd>
            }
            \volta 8 {
              <tomfh sn>8. <cymc sn>16
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
      <>^\markup \bold "8×"
      \numericTimeSignature
      \voiceOne
      \bar ".|:-|"
      \repeat volta 8 {
        \drummode {
          bd8 tomfh16 bd \flam sn8 <hho bd>
          \alternative {
            \volta 1,2,3,5,6,7 {
              r16 tomh16 tomh8 <sn toml>8. \flam tomfh16
            }
            \volta 4 {
              r16 <tomh sn> <tomh sn>8 <toml sn>8. <cymc sn>16 
            }
            \volta 8 {
              r16 tomh tomh bd tomh sn sn sn
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
    \set DrumStaff.instrumentName = #"Chorus "
    \new DrumVoice = "all" {
      <>^\markup \bold "3×"
      \numericTimeSignature
      \voiceOne
      \bar ".|:-|"
      \repeat volta 3 {
        \drummode {
          <cymc bd>8 hho8 <hh sn>8 hho16 \parenthesize sn hh16 \parenthesize sn 
          <hho bd>8 <hh sn> hho16 bd
          \repeat unfold 2 { <hh bd>16 \parenthesize sn hho8 <hh sn>8 hho16 
          \parenthesize sn hh16 \parenthesize sn <hho bd>8 <hh sn> hho16 bd }
          <hh bd>16 \parenthesize sn hho8 <hh sn>8 hho16 \parenthesize sn
          \alternative {
            \volta 1 {
              hh16 \parenthesize sn hho bd sn cymch cymch bd
            }
            \volta 2 {
              \tuplet 6/2 { hh16 hh hh hh hh hh} hho8 \tuplet 3/2 { tomh sn16 }
            }
            \volta 3 {
              hh16 \parenthesize sn hho bd \flam sn8 hh16 sn
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
  }
}

\score {
  \new DrumStaff {
    \set DrumStaff.instrumentName = #"Chorus"
    \new DrumVoice = "all" {
      <>^\markup \bold "3×"
      \numericTimeSignature
      \voiceOne
      \bar ".|:-|"
      \repeat volta 3 {
        \drummode {
          \makePercent
          s1
          \alternative {
            \volta 1 {
              <hh bd>16 \parenthesize sn hho8 <hh sn>8 hho16 \parenthesize sn
              hh \parenthesize sn hho bd sn cymch cymch bd
            }
            \volta 2 {
              <hh bd>16 \parenthesize sn hho8 <hh sn>8 hho16 \parenthesize sn
              hh \parenthesize sn <hho bd> bd sn tomh32 tomh toml16 bd
            }
            \volta 3 {
              <hh bd>16 \parenthesize sn hho bd <hh sn>8 <hho sn>16 bd hh sn <hho bd> bd <hh sn>8. <cymc sn>16
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
    \set DrumStaff.instrumentName = #"Breakdown"
    \new DrumVoice = "all" {
      \numericTimeSignature
      \voiceOne
      \bar ".|:-|"
      \drummode {
        <cymc bd>8. bd16 <hho sn>8 bd hho4 <hho sn>
        <hho bd>8. bd16 <hho sn>8 bd hho16 bd8 bd16 <hho sn>8. sn16
        <hho bd>16 \parenthesize sn8 bd16 <hho sn>8 bd hho4 <hho sn>8 bd
        hho16 bd8 sn16 hho8 bd <hho sn>16 bd8. hho8 bd16 bd
        <hho sn>4 hho8 bd hho4 <hho sn> hho8 bd hho sn hho8 bd16 bd <hho sn>8 bd
        <cymc bd>8. bd16 \flam sn16 bd <cymc bd>8 sn16 <hho bd>8 <hho bd> sn16 sn bd
        \flam sn16 <cymc bd>8 <cymch bd> tomh32 tomh tomh16 toml32 toml toml16
        tomfh32 tomfh tomfh16 hho32 hho <hho bd>16 sn32\< \repeat unfold 4 { sn32 } sn\!
      }
    }
  }
}

\score {
  \new DrumStaff {
    \override Score.MetronomeMark.outside-staff-horizontal-padding = 1
    \tempo 4 = 124
    \set DrumStaff.instrumentName = #"Section 2"
    \new DrumVoice = "all" {
      \numericTimeSignature
      \voiceOne
      \drummode {
        \compressEmptyMeasures
        \override MultiMeasureRest.expand-limit = 1
        <cymc bd>1
        R1*3
      }
    }
  }
}

\score {
  \new DrumStaff {
    \set DrumStaff.instrumentName = #"Bridge 1"
    \new DrumVoice = "all" {
      \numericTimeSignature
      \voiceOne
      \bar ".|:-|"
      \repeat volta 8 {
        \drummode {
          \alternative {
            \volta 1,2,3,5,6 {
              \repeat unfold 2 { hh16 hh hho8 } \repeat unfold 6 { hh16 } hho8
            }
            \volta 4 {
              \repeat unfold 2 { hh16 hh hho8 } hh4 hh
            }
            \volta 7 {
              \repeat unfold 2 { \repeat unfold 6 { hh16 } hho8 }
            }
            \volta 8 {
              hh16 hh hho8 hh16 hh hho8 sn tomfh16 tomfh sn <cymc bd>8.
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
    \set DrumStaff.instrumentName = #"Outro 1"
    \new DrumVoice = "all" {
      <>^\markup \bold "8×"
      \numericTimeSignature
      \voiceOne
      \bar ".|:-|"
      \repeat volta 8 {
        \drummode {
          <cymc bd>8 bd <cymc sn> bd
          \alternative {
            \volta 1,2,3,5,6,7 {
              <cymc bd>4 <cymc sn>
            }
            \volta 4 {
              <cymc bd>8 tomfh16 tomfh sn <cymc bd>8.
            }
            \volta 8 {
              <cymc bd>8 tomfh32 tomfh tomfh16 sn <cymc bd>8.
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
    \set DrumStaff.instrumentName = #"Outro 2"
    \new DrumVoice = "all" {
      <>^\markup \bold "8×"
      \numericTimeSignature
      \voiceOne
      \bar ".|:-|"
      \repeat volta 8 {
        \drummode {
          <cymc bd>8 <cymch bd> <cymc sn> <cymch bd>
          \alternative {
            \volta 1,2,3,5,6,7 {
              <cymc bd>8 cymch <cymc sn> cymch
            }
            \volta 4,8 {
              <cymc bd>8 tomfh16 tomfh sn <cymc bd>8.
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
    \set DrumStaff.instrumentName = #"Bridge 2"
    \new DrumVoice = "all" {
      \numericTimeSignature
      \voiceOne
      \bar ".|:-|"
      \repeat volta 4 {
        \drummode {
          \alternative {
            \volta 1 {
              <cymc sn bd>1
            }
            \volta 2 {
              r2. sn16\< \repeat unfold 3 { sn16 }
            }
            \volta 3,4 {
              \repeat unfold 15 { sn16 } sn\!
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
    { "Outro 1 - 4x" }
    \hspace #0
    { "Outro 2 - 4x" }
    \hspace #0
  }
}

\score {
  \new DrumStaff {
    \set DrumStaff.instrumentName = #"Ending"
    \new DrumVoice = "all" {
      \numericTimeSignature
      \voiceOne
      \bar ".|:-|"
      \repeat volta 4 {
        \drummode {
          <cymc bd>1
        }
      }
      \bar "|."
    }
  }
}

