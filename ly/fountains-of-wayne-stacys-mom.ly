\version "2.24.4"
\include "definitions.ly"

\layout{
  \set DrumStaff.drumStyleTable = #(alist->hash-table custom-notes)
}

\header {
  title = "Fountains of Wayne"
  subtitle = "Stacy's Mom"
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
  \tempo 4 = 118
    \set DrumStaff.instrumentName = #"Pre-Intro"
    \new DrumVoice = "all" {
      \numericTimeSignature
      \voiceOne
      \bar ".|:-|"
      \drummode {
        r1
        r2 r4 r8 <hho sn>
        hhp1
        r2 r4 r8 <hho sn>
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
      <>^\markup \bold "4×"
      \numericTimeSignature
      \voiceOne
      \bar ".|:-|"
      \repeat volta 4 {
        \drummode {
          <hh bd>8 hh <hh bd> hh <hh bd> hh <hh bd> hh
          <hh bd>8 hh <hh bd> hh <hh bd> hh <hh bd> <hho sn>
          \alternative {
            \volta 4 {
              <hh bd>8 hh <hh bd> hh <hh bd> hh <hh bd> hh
              <hh bd>8 hh <hh bd> hh <hh bd> sn sn sn
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
    \set DrumStaff.instrumentName = #"Verse"
    \new DrumVoice = "all" {
      \numericTimeSignature
      \voiceOne
      \bar ".|:-|"
      \repeat volta 8 {
        \drummode {
          \alternative {
            \volta 1,2,5,7 {
              <hh bd>8 hh <hh sn> hh <hh bd> hh <hh sn> hh
            }
            \volta 3,6 {
              <hh bd>8 hh <hh sn> hh <hh bd> hh <hh sn> <hh bd>
            }
            \volta 4,8 {
              <hh bd>8 hh <hh sn> hh <hh bd> hh <hh sn> <hho sn>
            }
          }
        }
      }
      \repeat volta 8 {
        \drummode {
          \alternative {
            \volta 1,2,3,5,6,7 {
              <hh bd>8 <hh bd> <hh sn> hh <hh bd> <hh bd> <hh sn> hh
            }
            \volta 4 {
              <hh bd>8 <hh bd> <hh sn> hh <hh bd> <hh bd> <hh sn> <hho sn>
            }
            \volta 8 {
              <hh bd>8 <hh bd> <hh sn> hh16 sn <hh bd>8 bd sn bd
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
    \set DrumStaff.instrumentName = #"Pre-Chorus"
    \new DrumVoice = "all" {
      \numericTimeSignature
      \voiceOne
      \bar ".|:-|"
      \repeat volta 4 {
        \drummode {
          \alternative {
            \volta 1,2,3 {
              \alternative {
                \volta 1 {
                  <cymc bd>8
                }
                \volta 2,3 {
                  <hho bd>8[
                }
              }
              hho <hho sn> hho] <hho bd> <hho bd> <hho sn> hho
            }
            \volta 4 {
              <cymc bd>8 <cymc bd> <cymc bd> <cymc bd> <\parenthesize cymc bd>2
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
            \volta 1,6 {
              <cymc bd>8 <cymc bd> <cymc sn> <cymc bd> cymc <cymc bd> <cymc sn> <cymc bd>
            }
            \volta 2 {
              cymc8 <cymc bd> <cymc sn> cymc <cymc bd> <cymc bd> <cymc sn> cymc
            }
            \volta 3,5 {
              <cymc bd>8 <cymc bd> <cymc sn> <cymc bd> cymc <cymc bd> <cymc sn> cymc
            }
            \volta 4 {
              <cymc bd>8 <cymc bd> <cymc sn> cymc <cymc bd> <cymc bd> <cymc sn> \parenthesize cymc16 r
            }
            \volta 7 {
              <cymc bd>8 <hho bd> <hho sn> hho <hho bd> <hho bd> <hho sn> hho
            }
            \volta 8 {
              <toml tomfh bd hhp>8 <toml tomfh> <toml tomfh bd hhp> <toml tomfh> <toml tomfh bd hhp> <toml tomfh> <toml tomfh bd hhp> <hho sn>
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
    { "Intro - only 4 last bars" }
    \hspace #0
    { "Verse" }
    \hspace #0
    { "Pre-Chorus" }
    \hspace #0
  }
}

\score {
  \new DrumStaff {
    \set DrumStaff.instrumentName = #"Chorus"
    \new DrumVoice = "all" {
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
              <hho bd>8 <hho bd> <hho sn> sn16 sn bd8 <sn bd> sn16 sn sn sn
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
      <>^\markup \bold "8×"
      \numericTimeSignature
      \voiceOne
      \bar ".|:-|"
      \repeat volta 8 {
        \drummode {
          \makePercent
          s1
          \alternative {
            \volta 4 {
              cymc8 <cymc bd> <cymc sn> cymc16 sn <cymc bd>8 <cymc sn> sn16 sn sn sn
            }
            \volta 8 {
              <cymc bd>8 <cymc bd> <cymc sn> <cymc bd> <cymc bd> <cymc sn>16 sn sn sn sn sn
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
    { "Chorus - same than the last one" }
    \hspace #0
  }
}

\score {
  \layout{ ragged-right = ##f }
  \new DrumStaff {
    \set DrumStaff.instrumentName = #"Chorus"
    \new DrumVoice = "all" {
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
              <cymc tomfh bd>8 <cymc tomfh bd> <cymc tomfh bd> <cymc tomfh bd> <cymc tomfh bd> <cymc tomfh bd> <cymc tomfh bd> cymc
            }
          }
        }
      }
      \bar "|."
    }
  }
}
