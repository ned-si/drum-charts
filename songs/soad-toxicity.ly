\version "2.24.3"
\include "definitions.ly"

\layout{
  \set DrumStaff.drumStyleTable = #(alist->hash-table custom-notes)
}

\header {
  title = "System Of A Down"
  subtitle = "Toxicity"
  composer = "nedsi"
  tagline = #f
}

% Custom markup to create vertical space after header
\markup {
  \vspace #-2
}

\score {
  \new DrumStaff {
    \override Score.MetronomeMark.outside-staff-horizontal-padding = 1
    \tempo 4. = 82
    \set DrumStaff.instrumentName = #"Pre-intro"
    \new DrumVoice = "all" {
      \time 12/8
      \voiceOne
      \drummode {
        \compressEmptyMeasures
        \override MultiMeasureRest.expand-limit = 1
        R1*6
      }
    }
  }
}

\score {
  \new DrumStaff {
    \set DrumStaff.instrumentName = #"Intro"
    \new DrumVoice = "all" {
      \time 12/8
      \voiceOne
      \bar ".|:-|"
      \repeat volta 4 {
        \drummode {
          \alternative {
            \volta 1,2,4 { <cymc bd>8 \flam sn16 bd8 bd16 \flam sn8 bd \flam sn
              \alternative {
                \volta 1 { <sn bd>16 tomh tomh sn toml toml sn:32 sn:32 sn16 tomh tomh toml }
                \volta 2 { <tomh bd>16 sn sn toml toml toml sn sn toml tomfh tomfh tomfh }
                \volta 4 { <sn bd>16 tomh sn sn tomh tomh sn sn toml tomfh tomfh tomfh}
                }
              }
            \volta 3 { <cymc bd>16 tomh tomh tomh toml toml <sn bd> sn toml toml tomfh tomfh
              <cymc bd> toml \repeat unfold 4 { tomh } <sn bd> sn toml toml tomfh tomfh
            }
          }
        }
      }
      \bar ":|."
      \repeat volta 4 {
        \drummode {
          <cymc bd>8 hho16 sn hho bd <hho sn>8 hho16 sn <hho bd>8
          \alternative {
            \volta 1,2,3 { <cymc bd>8 hho16 sn <hho bd>8 <hho sn> <hho bd>8 <hho sn> }
            \volta 4 { <cymc bd>8 sn16 sn hho bd <hho sn>8 sn16 toml toml toml }
          }
        }
      }
      \bar "|."
    }
  }
}

\score {
  \new DrumStaff {
    \set DrumStaff.instrumentName = #"Verse1"
    \new DrumVoice = "all" {
      \time 12/8
      \voiceOne
      \bar ".|:-|"
      \repeat volta 12 {
        \drummode {
          \alternative {
            \volta 1 {
              <cymc bd hhp>8 hh16 \parenthesize sn hh bd <hh sn>8 hh16 sn <hh bd>8 <hh bd> hh16 \parenthesize sn hh bd <hho sn>8 <hh hhp>16 sn <hh bd>8
            }
            \volta 2 {
              <hh bd>8 hh16 \parenthesize sn hh bd <hho sn>8 <hh hhp>16 sn <hh bd>8 <hh bd> hh16 \parenthesize sn hh bd <hho sn>8 <hh hhp>16  \parenthesize sn:32 <hh bd>  sn
            }
            \volta 3,5,7,9,11 {
              \alternative {
                \volta 9 { <cymc bd>8 }
                \volta 3,5,7,11 { <hh bd>16 \parenthesize sn }
              }
              hh16 \parenthesize sn hh bd <hh sn>8 hh16 sn <hh bd>8
              <hh bd>8 hh16 \parenthesize sn hh bd <hh sn>8 hh16 sn <hh bd>8
            }
            \volta 4,6,8,10 {
              <hh bd>8 hh16 sn hh bd <hh sn>8 hh16 \parenthesize sn <hh bd>8
              <hh bd>8 hh16 sn hh bd <hho sn>8 hh16 \parenthesize sn:32 <hh bd> sn
            }
            \break
            \volta 12 {
              <hh bd>8 hh16 \parenthesize sn hh bd <hh sn>8 hh16 sn <hh bd>8
              <hho bd>8 hho16 \parenthesize sn hho bd <hho sn>8 <hho bd> <hho sn>
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
    \set DrumStaff.instrumentName = #"Chorus1"
    \new DrumVoice = "all" {
      \time 12/8
      \voiceOne
      \bar ".|:-|"
      \repeat volta 4 {
        \drummode {
          \alternative {
            \volta 1,2,4 { <cymc bd>8 \flam sn16 bd8 bd16 \flam sn8 bd \flam sn
              \alternative {
                \volta 1 { <toml bd>16 sn sn toml toml toml sn sn toml tomfh tomfh tomfh }
                \volta 2 { <tomh bd>16 sn sn toml toml toml sn sn toml tomfh tomfh tomfh }
                \volta 4 { <sn bd>16 tomh sn sn tomh tomh sn:32 sn:32 sn16 tomh tomh toml }
                }
              }
            \volta 3 { <cymc bd>16 tomh tomh tomh toml toml <sn bd> sn toml toml tomfh tomfh
              <cymc bd> toml \repeat unfold 4 { tomh } <sn bd> sn toml toml tomfh tomfh
            }
          }
        }
      }
      \bar ":|."
      \repeat volta 4 {
        \drummode {
          <cymc bd>8 hho16 sn hho bd <hho sn>8 hho16 sn <hho bd>8
          \alternative {
            \volta 1,2,3 { <cymc bd>8 hho16 sn <hho bd>8 <hho sn> <hho bd>8 <hho sn> }
            \volta 4 { <cymc bd>8 sn16 sn hho bd <hho sn>8 sn16 toml toml toml }
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
    { "Verse1" }
  }
}

\score {
  \new DrumStaff {
    \set DrumStaff.instrumentName = #"Chorus2"
    \new DrumVoice = "all" {
      \time 12/8
      \voiceOne
      \bar ".|:-|"
      \repeat volta 4 {
        \drummode {
          \alternative {
            \volta 1,2,4 { <cymc bd>8 \flam sn16 bd8 bd16 \flam sn8 bd \flam sn
              \alternative {
                \volta 1 { <toml bd>16 sn sn toml toml toml sn sn toml tomfh tomfh tomfh }
                \volta 2 { <tomh bd>16 sn sn toml toml toml sn sn toml tomfh tomfh tomfh }
                \volta 4 { <sn bd>16 tomh sn sn tomh tomh sn:32 sn:32 sn16 tomh tomh toml }
                }
              }
            \volta 3 { <cymc bd>16 tomh tomh tomh toml toml <sn bd> sn toml toml tomfh tomfh
              <cymc bd> toml \repeat unfold 4 { tomh } <sn bd> sn toml toml tomfh tomfh
            }
          }
        }
      }
      \bar ":|."
      \break
      \repeat volta 4 {
        \drummode {
          <cymc bd>8 hho16 sn hho bd <hho sn>8 hho16 sn <hho bd>8
          <cymc bd>8 hho16 sn <hho bd>8 <hho sn> <hho bd>8 <hho sn>
        }
      }
      \drummode {
        <\parenthesize cymc bd>4. r r r
        \compressEmptyMeasures
        \override MultiMeasureRest.expand-limit = 1
        R1*3/2
      }
      \bar "|."
    }
  }
}

\score {
  \layout{ ragged-right = ##f }
  \new DrumStaff {
    \set DrumStaff.instrumentName = #"Bridge"
    \new DrumVoice = "all" {
      \time 12/8
      \voiceOne
      \bar ".|:-|"
      \repeat volta 12 {
        \drummode {
          \alternative {
            \volta 1,2,3,4,9,10,11,12 {
              <cymc bd>8 <cymc bd>16 sn <cymc bd>8 <cymc bd> <cymc bd>16 sn <cymc bd>8
            }
            \volta 5,6,7,8 {
              <cymc bd>8 <cymc bd>16 sn <cymc bd>8 <cymc bd>8 bd16 <cymc sn>8.^\act
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
    \set DrumStaff.instrumentName = #"Chorus3"
    \new DrumVoice = "all" {
      \time 12/8
      \voiceOne
      \bar ".|:-|"
      \repeat volta 4 {
        \drummode {
          \alternative {
            \volta 1,2,4 { <cymc bd>8 \flam sn16
              \alternative { 
                \volta 1 { r8 }
                \volta 2,4 { bd8 }
              }
              bd16 \flam sn8 bd \flam sn
              \alternative {
                \volta 1 { <sn bd>16 sn sn sn \repeat unfold 2 {
                \parenthesize sn:32 } \repeat unfold 4 { sn } tomh toml }
                \volta 2 { <sn bd>16 tomh^\act \parenthesize sn tomh^\act \repeat
                unfold 2 { \parenthesize sn:32 } sn sn sn tomh tomh toml}
                \volta 4 { <sn bd>16^\act toml^\act sn \parenthesize sn \repeat
                unfold 2 { \parenthesize sn:32 } sn sn sn tomh tomh toml }
                }
              }
            \volta 3 { <cymc bd>16 tomh tomh tomh toml toml <sn bd> sn toml toml tomfh tomfh
              <cymc bd> toml \repeat unfold 4 { tomh } <sn bd> sn toml toml tomfh tomfh
            }
          }
        }
      }
      \bar ":|."
      \repeat volta 4 {
        \drummode {
          <cymc bd>8 hho16 sn hho bd <hho sn>8 hho16 sn <hho bd>8
          <cymc bd>8 hho16 sn <hho bd>8 <hho sn> <hho bd>8 <hho sn>
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
    \new DrumVoice = "all" {
      \time 12/8
      \voiceOne
      \bar ".|:-|"
      <>^\markup \bold "8×"
      \repeat volta 8 {
        \drummode {
          <cymc bd>16 \parenthesize sn <cymc bd> sn^\act <cymc bd> \parenthesize sn
        }
      }
      \repeat volta 4 {
        \drummode {
          <cymc bd>8.^\act cymc
          \alternative {
            \volta 1,2,3 {
              <cymc sn bd>^\act cymc
            }
            \volta 4 {
              sn16 sn sn <\parenthesize cymc bd>8 r16
            }
          }
        }
      }
      \bar "|."
    }
  }
}
