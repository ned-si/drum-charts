\version "2.24.4"
\include "definitions.ly"

\layout{
  \set DrumStaff.drumStyleTable = #(alist->hash-table custom-notes)
}

\header {
  title = "Papa Roach"
  subtitle = "Last Resort"
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
    \tempo 4 = 90
    \set DrumStaff.instrumentName = #"Pre-Intro"
    \new DrumVoice = "hands" {
      \numericTimeSignature
      \voiceOne
      \drummode {
        \compressEmptyMeasures
        \override MultiMeasureRest.expand-limit = 1
        R1*2
      }
    }
  }
}

\score {
  \new DrumStaff {
    \set DrumStaff.instrumentName = #"Intro 1"
    \new DrumVoice = "hands" {
      \numericTimeSignature
      \voiceOne
      \bar ".|:-|"
      \repeat volta 3 {
        \drummode {
          \alternative {
            \volta 1 {
              \repeat unfold 3 { <tomh tomfh bd hhp>16 bd hhp8 \flam <sn hhp> hhp } <tomh tomfh bd>16 bd8. <tomh tomfh bd>16 bd <cymc sn>8
            }
            \volta 2,3 {
              <cymc bd>16 bd hho8 <hho sn> hho <hho bd>16 bd hho8 <hho sn> hho
              <hho bd>16 bd hho8 <hho sn> hho <hho bd>16 bd hho8 <hho bd>16 bd <cymc sn>8^\act
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
    \set DrumStaff.instrumentName = #"Intro 2"
    \new DrumVoice = "hands" {
      \numericTimeSignature
      \voiceOne
      \bar ".|:-|"
      \repeat volta 8 {
        \drummode {
          \alternative {
            \volta 1,3,5,7 {
              <hh bd>16 bd hh8 <hh sn> hh <hh bd>16 bd hh8 <hh sn> hh
            }
            \volta 2,4,6 {
              <hh bd>16 bd hh8 <hh sn> hh <hh bd>16 bd hh8 <hh bd>16 bd <cymc sn>8
            }
            \volta 8 {
              <hh bd>16 bd hh8 <hh sn> <hho bd> <hho sn>16 toml tomfh16 bd <tomh
              tomfh>16 bd <cymc sn>8
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
    \new DrumVoice = "hands" {
      \numericTimeSignature
      \voiceOne
      \bar ".|:-|"
      \drummode {
        <cymc bd>8 <hho bd> <hho sn> hho <cymc bd> <hho bd> <hho sn> hho
        <cymc bd>8 <hho bd> <hho sn> hho <cymc bd> <hho bd> <cymc sn> sn32 sn sn sn
        <cymc bd>8 <hho bd> <cymc sn> hho <hho bd> <hho bd> <hho sn> <hho bd>16 sn
        <cymc bd>8 <hho bd> <hho sn> hho <cymc bd> <hho bd> <hho sn> <hho bd>
        \repeat volta 4 {
        <>^\markup \bold "4×"
          \drummode {
            <cymc sn>16 bd hho bd <cymc sn>8 <hho bd> hho16 bd hho bd <hho sn>8
            \alternative {
              \volta 1,2,3 {
                <hho bd>8
              }
              \volta 4 {
                <cymc sn>8
              }
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
    \new DrumVoice = "hands" {
      <>^\markup \bold "12×"
      \numericTimeSignature
      \voiceOne
      \bar ".|:-|"
      \repeat volta 12 {
        \drummode {
          \alternative {
            \volta 1,3,5,7,9,11 {
              <tomh tomfh bd hhp>16 bd hhp8 \flam <sn hhp> hhp <tomh tomfh bd 
              hhp>16 bd hhp8 \flam <sn hhp> hhp
            }
            \volta 2,6,10 {
              <tomh tomfh bd hhp>16 bd hhp8 \flam <sn hhp> hhp <tomh tomfh bd
              hhp>16 bd hhp8 <tomh tomfh bd hhp>16 bd hhp8
            }
            \volta 4,8 {
              <tomh tomfh bd hhp>16 bd hhp8 \flam <sn hhp> hhp <tomh tomfh bd
              hhp>16 bd hhp8 <tomh tomfh bd hhp>16 bd <cymc sn hhp>8
            }
            \volta 12 {
              <tomh tomfh bd hhp>16 bd hhp8 <sn tomfh hhp> <hho bd> <cymc sn>16
              tomh tomfh bd <tomh tomfh> bd <cymc sn>8
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
          <cymc sn>8 <cymc bd> <cymc sn>16 bd cymc bd
          \alternative {
            \volta 1,2,3 {
              <cymc sn>8 <cymc bd> <cymc sn>16 bd cymc bd
            }
            \volta 4 {
              <cymc sn>8 <hho bd> <cymc sn>16 tomh tomfh bd
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
    { "Bridge" }
    \hspace #0
    { "Verse" }
  }
}

\score {
  \new DrumStaff {
    \set DrumStaff.instrumentName = #"Chorus"
    \new DrumVoice = "hands" {
      <>^\markup \bold "12×"
      \numericTimeSignature
      \voiceOne
      \bar ".|:-|"
      \repeat volta 12 {
        \drummode {
          \makePercent
          s1
          \alternative {
            \volta 8 {
              <cymc sn>8 <hho bd> <sn tomfh>16 <sn tomfh> <sn tomfh> bd
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
      \drummode {
        \repeat unfold 2 { <cymc bd>8 <hho bd> <hho sn> hho }
        \time 2/4
        <cymc bd>8 \repeat unfold 6 { <tomh tomfh>16 }
        \time 4/4
        <cymc bd>8 <cymc bd> \repeat unfold 8 { sn32 } <cymc bd>8 <hho bd> <cymc
        sn> sn32 sn sn sn
        \repeat unfold 3 { <cymc bd>8 sn32 sn sn sn } <hho bd>16 sn tomh tomfh
        \repeat unfold 2 { <cymc bd>8 <hho bd> <hho sn> hho }
        \repeat unfold 3 { <cymc bd>8 sn16 sn } <cymc bd>16 sn tomh tomfh
        \repeat unfold 2 { <cymc bd>8 <hho bd> <hho sn> hho }
        <cymc bd>8 \repeat unfold 3 { <sn hhp>16 sn } <tomh bd> tomh <tomh bd>
        tomh <tomfh bd> tomfh <tomfh bd> tomfh
        <cymc bd>8 <hho bd> <hho sn> <hho bd> <cymc sn>16 bd <cymc sn> bd <cymc sn>4
      }
      \bar "|."
    }
  }
}
