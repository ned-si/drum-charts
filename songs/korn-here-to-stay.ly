\version "2.24.4"
\include "definitions.ly"

\layout{
  \set DrumStaff.drumStyleTable = #(alist->hash-table custom-notes)
}

\header {
  title = "Korn"
  subtitle = "Here to Stay"
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
    \tempo 4 = 99
    \set DrumStaff.instrumentName = #"Pre-intro"
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
          <cymc bd>4 <cymc sn>
          \alternative {
            \volta 1,2,3,4 {
              <cymc bd>8 <cymc bd> <cymc sn>16 bd cymc8
            }
            \volta 5,6,7 {
              <cymc bd>8 <cymc bd> <cymc sn>16 bd cymc bd
            }
            \volta 8 {
              <cymc bd>8 <cymc bd> <cymc sn>16 bd hho8
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
      <>^\markup \bold "3×"
      \numericTimeSignature
      \voiceOne
      \bar ".|:-|"
      \repeat volta 3 {
        \drummode {
          <cymc bd hhp>8 hho <sn bd hhp> hho <bd hhp> <hho bd> <sn hhp>16 bd
          hho8
          <bd hhp>8 hho <sn bd hhp> hho <bd hhp> <hho bd> sn16 bd hho8
          <bd hhp>8 hho <sn bd hhp> hho <bd hhp> <hho bd> sn16 bd hho8
          <bd hhp>8 hho <sn bd hhp> hho <bd hhp>[ <hho bd>]
          \alternative {
            \volta 1,2 {
              sn16 bd hho8
            }
            \volta 3 {
              <cymc sn bd> <cymc sn bd>
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
      <>^\markup \bold "2×"
      \numericTimeSignature
      \voiceOne
      \bar ".|:-|"
      \repeat volta 2 {
        \drummode {
          <cymc bd>8 cymc <cymc sn> cymc16 bd <cymc bd>8 cymc16 bd32 bd <cymc
          sn>16 bd cymc8
          <cymc bd>8 <cymc bd> <cymc sn> cymc 
          \alternative {
            \volta 1 {
              <cymc bd>8 cymc16 bd <cymc sn> bd cymc8
            }
            \volta 2 {
              <cymc sn>8 sn16:32_\right sn_\left sn_\right sn_\left tomh_\right
              hho_\left
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
    \set DrumStaff.instrumentName = #"Chorus"
    \new DrumVoice = "all" {
      <>^\markup \bold "4×"
      \numericTimeSignature
      \voiceOne
      \bar ".|:-|"
      \repeat volta 4 {
        \drummode {
          <cymc bd>8 cymc <cymc sn> cymc <cymc bd> cymc <cymc sn>16 bd cymc8
          \alternative {
            \volta 1,3 {
              <cymc bd>8 cymc <cymc sn> cymc16 sn <cymc bd>8 <cymc bd> sn16
              <cymc bd>8 <cymc bd>16
            }
            \volta 2 {
              <cymc bd>8 cymc <cymc sn> cymc16 sn <cymc bd>8 cymc16 bd \flam
              tomh tomfh tomfh
            }
            \volta 4 {
              bd8 \flam sn tomh16 tomh sn sn <toml hhp>8 <toml hhp> <tomfh
              hhp>16 tomfh <bd hhp> bd
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
    { "Verse - only 2x" }
    \hspace #0
    { "Pre-Chorus" }
    \hspace #0
    { "Chorus" }
    \hspace #0
  }
}

\score {
  \new DrumStaff {
    \set DrumStaff.instrumentName = #"Pre-Bridge"
    \new DrumVoice = "all" {
      \numericTimeSignature
      \voiceOne
      \bar ".|:-|"
      \repeat volta 4 {
        \drummode {
          \alternative {
            \volta 1,2,3 {
              <cymc bd>8_\right hh16_\right hh_\left hh8_\right hh16:32_\right
              hh:32_\left hh8_\right hh16_\right hh_\left hh_\right hh_\left
              hh:32_\right hh:32_\left
              hh8 hh16 hh hh8 hh16:32 hh:32 hh hh hh:32 hh:32 hh cymch hh8
            }
            \volta 4 {
              \repeat unfold 2 { <cymc bd>16 hh hh hh hh hh hh:32 hh:32 }
              <>_\markup "Gradually open hi-hats." 
              \repeat unfold 3 { <hho bd>16^\act hho hho hho }<hho bd>4^\act
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
    \set DrumStaff.instrumentName = #"Bridge"
    \new DrumVoice = "all" {
      \numericTimeSignature
      \voiceOne
      \bar ".|:-|"
      \repeat volta 4 {
        \drummode {
          \alternative {
            \volta 1,2,3 {
              <hh bd>8^\act <hh bd>16 hh hh^\act bd hh <hh bd> <hh bd>^\act hh
              hh hh hh^\act hh hh hh
              <hh bd>8^\act <hh bd>16 hh hh^\act bd hh hh <hh bd>^\act hh
              <hh bd> hh hh^\act hh hh hh
            }
            \volta 4 {
              <hh bd>8^\act <hh bd>16 hh hh^\act bd hh <hh bd> <hh bd>^\act hh
              hh hh hh^\act hh hh hh
              <hh bd>8^\act <hh bd>16 hh hh^\act bd8. bd8 bd <sn bd>4
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
    \set DrumStaff.instrumentName = #"Breakdown"
    \new DrumVoice = "all" {
      <>^\markup \bold "4×"
      \numericTimeSignature
      \voiceOne
      \bar ".|:-|"
      \repeat volta 4 {
        \drummode {
          <cymc bd>8 <cymc bd> <cymc sn>16 bd cymc bd <cymc bd>8 cymc <cymc sn>
          cymc 
          <cymc bd>8 <cymc bd> <cymc sn>16 bd8. <cymc bd>16 bda <cymc bd>8
          \alternative {
            \volta 1,2,3 {
              <cymch sn>4
            }
            \volta 4 {
              <cymc sn>8 <cymc sn>
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
    { "Verse - only 2 last bars" }
    \hspace #0
    { "Pre-Chorus" }
    \hspace #0
    { "Chorus - last bar without fill" }
    \hspace #0
  }
}

\score {
  \new DrumStaff {
    \set DrumStaff.instrumentName = #"Pre-Outro"
    \new DrumVoice = "all" {
      \numericTimeSignature
      \voiceOne
      \bar ".|:-|"
      \repeat volta 8 {
        \drummode {
          \alternative {
            \volta 1,5,7,8 {
              <cymc bd>4 <cymc sn>8 cymc <cymc bd> <cymc bd> <cymc sn>16 bd
              cymc8
            }
            \volta 2,3,6 {
              <cymc bd>8 cymc <cymc sn> cymc <cymc bd> <cymc bd> <cymc sn>16 bd
              cymc bd
            }
            \volta 4 {
              <cymc bd>4 <cymc sn> <cymc bd>8 cymc16 bd32 bda <cymch sn>16 bd8.
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
    \new DrumVoice = "all" {
      <>^\markup \bold "4×"
      \numericTimeSignature
      \voiceOne
      \bar ".|:-|"
      \repeat volta 8 {
        \drummode {
          <toml tomfh bd>8 <toml tomfh bd> \flam sn16 bd8 tomfh16 tomfh16 tomfh
          tomfh8. hhp4
          <toml tomfh bd>8 <toml tomfh> \flam sn16 bd8 <toml tomfh bd>16 <toml
          tomfh> <toml tomfh bd>8
            \alternative {
            \volta 1,2,3 {
              hhp4
            }
            \volta 4 {
              r4
            }
          }
        }
      }
      \bar "|."
    }
  }
}
