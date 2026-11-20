\version "2.24.4"
\include "definitions.ly"

\layout{
  \set DrumStaff.drumStyleTable = #(alist->hash-table custom-notes)
}

\header {
  title = "Blink 182"
  subtitle = "What's My Age Again"
  composer = "nedsi"
  tagline = #f
}

% Custom markup to create vertical space after header
\markup {
  \vspace #0
}

\score {
  \new DrumStaff {
    \override Score.MetronomeMark.outside-staff-horizontal-padding = 1
    \tempo 4 = 157
    \set DrumStaff.instrumentName = #"Intro"
    \new DrumVoice = "all" {
      \numericTimeSignature
      \voiceOne
      \drummode {
        \compressEmptyMeasures
        \override MultiMeasureRest.expand-limit = 1
        R1*3
        r2 r4. cymr8
        cymr4. \flam cymr8 r cymr cymr cymr16:32 cymr:32
        cymr8 cymr cymr \flam cymr \flam cymr cymr cymr cymr
        \flam cymr4 cymr8 \flam cymr r cymr16:32 cymr:32 cymr8 cymr
        \flam cymr8 cymr cymr \flam cymr \flam cymr cymr cymr cymr
        cymr8 cymr16 cymr cymr8 \flam cymr r cymr cymr cymr
        \flam cymr8 cymr cymr cymr \flam cymr cymr cymr cymr
        cymr8 cymr16:32 cymr:32 cymr8 cymr r cymr cymr cymr
        \flam cymr8 cymr cymr cymr cymr cymr cymr hho
      }
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
      \repeat volta 5 {
        \drummode {
          \alternative {
            \volta 1,2,3 {
              <hh bd>8 <hh bd> <hh sn> hh <hh bd> <hh bd> <hh sn> hh
            }
            \volta 4 {
              <hho bd>8 hho <hho bd> <cymc sn> hho hho <hho bd> hho
            }
            \volta 5 {
              <hho bd>8 <cymc sn> <hho bd> hho hho sn16 sn toml toml tomfh tomfh
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
      \numericTimeSignature
      \voiceOne
      \bar ".|:-|"
      \repeat volta 4 {
        \drummode {
          <cymc bd>4 <cymc sn>8 bd <cymc bd>4 <cymc sn>8 bd
          \alternative {
            \volta 1,3 {
              <cymc bd>4 <cymc sn>8 bd <cymc bd> <toml sn> bd <sn tomfh>
            }
            \volta 2 {
              <cymc bd>8 sn16 sn sn sn <hho bd>8 <hho bd> sn16 sn toml toml tomfh tomfh
            }
            \volta 4 {
              <cymc sn>8 bd <cymc bd> sn cymc bd <cymc sn> bd
              <cymc bd>8 sn <cymc sn> bd <cymc sn> sn <cymc sn> bd
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
    \new DrumVoice = "all" {
      \numericTimeSignature
      \voiceOne
      \bar ".|:-|"
      \drummode {
        <cymc cymch bd hhp>4 hhp hhp hhp
        hhp4 hhp hhp hhp8 hho
      }
      \bar "|."
    }
  }
}

\markuplist {
  \column
  \bold {
    { "Verse - 8x before fill" }
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
      \repeat volta 16 {
        \drummode {
          \alternative {
            \volta 1 {
              <cymc cymch bd>8 cymr cymr cymr cymr cymr cymr cymr16:32 cymr:32
            }
            \volta 2,3 {
              cymr8 cymr cymr cymr cymr cymr cymr cymr16:32 cymr:32
            }
            \volta 4 {
              cymr8 cymr cymr cymr cymr cymr <cymr ss> <cymr bd>
            }
            \volta 5,6,7 {
              <cymr bd>8 cymr <cymr ss> cymr cymr cymr <cymr ss> <cymr bd>
            }
            \volta 8 {
              <cymr bd>8 cymr <cymr ss> cymr cymr <cymr ss> <cymr ss> <cymr bd>
            }
            \volta 9,10,11,12,13,14,15 {
              <cymr bd>8 cymr <cymr ss> <cymr bd> cymr <cymr bd> <cymr ss> <cymr
              bd>
            }
            \volta 16 {
              <cymr bd>8 cymr <cymr ss> cymr <cymr bd> sn16 sn toml toml tomfh tomfh
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
    { "Chorus - 3 times (12 bars)" }
    \hspace #0
  }
}

\score {
  \new DrumStaff {
    \set DrumStaff.instrumentName = #"Outro"
    \new DrumVoice = "all" {
      \numericTimeSignature
      \voiceOne
      \bar ".|:-|"
      \drummode {
        <cymc cymch bd hhp>1
      }
      \bar "|."
    }
  }
}
