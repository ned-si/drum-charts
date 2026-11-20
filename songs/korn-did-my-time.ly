\version "2.24.3"
\include "definitions.ly"

\layout{
  \set DrumStaff.drumStyleTable = #(alist->hash-table custom-notes)
}

\header {
  title = "Korn"
  subtitle = "Did My Time"
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
    \tempo 4 = 96
    \set DrumStaff.instrumentName = #"Pre-Intro"
    \new DrumVoice = "all" {
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
  \new DrumStaff {
    \set DrumStaff.instrumentName = #"Intro"
    \new DrumVoice = "all" {
      \numericTimeSignature
      \voiceOne
      \drummode {
        \repeat unfold 2 {
          hho4 hho hho hho
          hhp1
        }
        <cymc cymch bd>8 bd16 bd <hho sn>8 bd16 bd <hho bd>8 bd16 bd <hho sn>8[
        bd16 tomfh32 tomfh]
        <tomfh hhp>4 hhp hhp hhp16 bd sn8
        <cymc cymch bd>8 <hho bd>16 bd <hho sn>8 <hho sn> <hho bd>16 sn <hho
        bd>8 <hho sn>8 <hho sn>16 tomfh32 tomfh
        <tomfh hhp>4 hhp hhp hhp16 bd sn8
      }
      \bar "|."
    }
  }
}

\score {
  \new DrumStaff {
    \set DrumStaff.instrumentName = #"Chorus"
    \new DrumVoice = "all" {
      <>^\markup \bold "4×"
      \numericTimeSignature
      \voiceOne
      \bar ".|:-|"
      \repeat volta 4 {
        \drummode {
          <cymc cymch bd>8 cymc16 bd <cymc sn>8 <cymc bd> cymc16 bd cymc8 <cymc
          sn>16 bd cymc8
          <cymc cymch bd>8 cymc16 bd <cymc sn>16 sn <cymc bd>8
          \alternative {
            \volta 1,2 {
              cymc16 bd <cymc sn>8 <cymc sn> r
            }
            \volta 3 {
              cymc16 bd <cymc sn>8 <cymc sn> tomh16 toml32 toml
            }
            \volta 4 {
              r16 tomh32_\right[ tomh_\left toml8_\right] toml8_\left \tuplet
              3/2 { tomfh16_\right tomfh16_\left tomfh16_\left }
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
            \volta 1,5 {
              <cymc bd>8
            }
            \volta 2,3,4,6,7,8 {
              <hh bd>8[
            }
          }
          hh16 bd] <hh sn>8 hh
          \alternative {
            \volta 1,2,3,5,6,7 {
              <hh bd>8 hh16 bd <hh sn>8 hho
            }
            \volta 4 {
              \repeat unfold 2 { sn16 <hho bd> hhp8 }
            }
            \volta 8 {
              <hh bd>8 hh16 bd <hh sn>8 \tuplet 3/2 { tomh16_\right tomh_\left
                toml_\right }
            }
          }
        }
      }
      \drummode {
        <tomfh hhp>4_\right hhp hhp hhp16 bd sn8
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
    { "Verse" }
    \hspace #0
    { "Chorus" }
    \hspace #0
  }
}

\score {
  \new DrumStaff {
    \set DrumStaff.instrumentName = #"Bridge"
    \new DrumVoice = "all" {
      \numericTimeSignature
      \voiceOne
      \bar ".|:-|"
      \repeat volta 3 {
        \drummode {
          \alternative {
            \volta 1 {
              <cymc bd>4
            }
            \volta 2 {
              cymr4
            }
            \volta 3 {
              cymc4
            }
          }
          cymr cymr
          \alternative {
            \volta 1,3 {
              cymr
            }
            \volta 2 {
              cymr8 cymc16 cymc
            }
          }
        }
      }
      \drummode {
        cymr4 cymr8 cymr16 sn cymr toml cymr sn sn sn toml tomfh
        <cymc bd>8 cymr16 bd <cymr sn>8 cymr16 bd cymr cymr8 <cymr sn>16 <hh bd>
        cymr hh8
        <cymr bd>8 cymr16 bd <cymr sn>8 cymr16 bd cymr hh cymr bd <cymr sn> bd
        cymc8
        <cymr bd>16 hh cymr bd <cymr sn>8 cymr16 bd cymr hh cymr bd <cymr sn> bd
        cymr hh
        <cymr bd>8 cymr16 bd <cymr sn>8 cymr16 sn cymr toml cymr sn sn sn toml
        tomfh
        <cymc bd>8 cymr16 bd <cymr sn> hh cymr bd cymr8 cymr16 bd <cymr sn> <hh
        bd> cymr hh
        <cymr bd>16 hh cymr bd <cymr sn>8 cymr16 bd cymr hh cymr bd <cymr sn>
        <hh bd> cymc hh
        <cymr bd>8 cymr16 bd <cymr sn> hh cymr bd cymr hh cymr <hh bd> <cymr sn>
        <hh bd> cymr hh
        <cymr bd>8 cymr16 bd <cymr sn>8 cymr16 sn cymr toml cymr sn \tuplet 3/2
        { tomh tomh toml } \tuplet 3/2 { toml tomfh tomfh }
      }
      \repeat volta 4 {
        \drummode {
          \alternative {
            \volta 1 {
              <cymc bd>4
            }
            \volta 2,3,4 {
              cymr4
            }
          }
          cymr cymr cymr
        }
      }
      \bar "|."
    }
  }
}

\score {
  \layout{ ragged-right = ##f }
  \new DrumStaff {
    \set DrumStaff.instrumentName = #"Breakdown-1"
    \new DrumVoice = "all" {
      \numericTimeSignature
      \voiceOne
      \bar ".|:-|"
      <>^\markup \bold "8×"
      \repeat volta 8 {
        \drummode {
          <cymc bd>8 cymc16 bd <cymc sn> bd cymc bd
          \alternative {
            \volta 1,2,3,5,6,7 {
              cymc16 bd cymc bd <cymc sn>8 <cymc bd>
            }
            \volta 4 {
              cymc16 bd cymc bd <cymc sn>8 <cymc sn>
            }
            \volta 8 {
              cymc16 bd cymc bd32 bd <cymc sn>16 bd32 bd32 <cymc sn>8
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
    \set DrumStaff.instrumentName = #"Breakdown-2"
    \new DrumVoice = "all" {
      \numericTimeSignature
      \voiceOne
      \bar ".|:-|"
      \repeat volta 4 {
        \drummode {
          \alternative {
            \volta 1,3 {
              <cymc bd>8
            }
            \volta 2,4 {
              <hho bd>8[
            }
          }
          hho16 bd] <hho sn>8 hho
          \alternative {
            \volta 1,3 {
              <hho bd>8 hho16 bd <hho sn>8 hho
            }
            \volta 2 {
              <hho bd>8 hho16 bd <hho sn>8 cymc
            }
            \volta 4 {
              <cymc sn>16 sn32 sn sn16 sn \repeat unfold 4 { sn }
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
    { "Chorus" }
    \hspace #0
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
      \repeat volta 8 {
        \drummode {
          \alternative {
            \volta 1 {
              <cymc tomfh>8
            }
            \volta 2,3,4,5,6,7,8 {
              tomfh8[
            }
          }
          <sn tomfh>]
          \alternative {
            \volta 1,2,3,4,5,6,7 {
              tomh32 tomh toml toml tomfh8
            }
            \volta 8 {
              <tomh tomfh>8 <toml tomfh bd>
            }
          }
        }
      }
      \bar "|."
    }
  }
}
