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
  <<
    \new DrumStaff {
      \set DrumStaff.instrumentName = #"Intro 1"
      <<
        \new DrumVoice = "hands" {
          \numericTimeSignature
          \voiceOne
          \bar ".|:-|"
          \repeat volta 3 {
            \drummode {
              \alternative {
                \volta 1 {
                  \repeat unfold 3 { <tomh tomfh>4 \flam sn } <tomh tomfh> <tomh tomfh>8 <cymc sn>
                }
                \volta 2,3 {
                  cymc8 hho <hho sn> hho hho hho <hho sn> hho
                  hho hho <hho sn> hho hho hho hho <cymc sn>^\act
                }
              }
            }
          }
          \bar "|."
        }
        \new DrumVoice = "feet" {
          \voiceTwo
          \repeat volta 8 {
            \drummode {
              \alternative {
                \volta 1 {
                  <bd hhp>16 bd hhp8 hhp hhp <bd hhp>16 bd hhp8 hhp hhp
                  <bd hhp>16 bd hhp8 hhp hhp bd16 bd8. bd16 bd8.
                }
                \volta 2,3 {
                  bd16 bd s4. bd16 bd s4.
                  bd16 bd s4. bd16 bd8. bd16 bd8.
                }
              }
            }
          }
        }
      >>
    }
  >>
}

\score {
  <<
    \new DrumStaff {
      \set DrumStaff.instrumentName = #"Intro 2"
      <<
        \new DrumVoice = "hands" {
          \numericTimeSignature
          \voiceOne
          \bar ".|:-|"
          \repeat volta 8 {
            \drummode {
              \alternative {
                \volta 1,3,5,7 {
                  hh8 hh <hh sn> hh hh hh <hh sn> hh
                }
                \volta 2,4,6 {
                  hh8 hh <hh sn> hh hh hh  hh <cymc sn>
                }
                \volta 8 {
                  hh8 hh <hh sn> hho <hho sn>16 toml tomfh8 <tomh tomfh>8 <cymc
                  sn>
                }
              }
            }
          }
          \bar "|."
        }
        \new DrumVoice = "feet" {
          \voiceTwo
          \repeat volta 8 {
            \drummode {
              \alternative {
                \volta 1,3,5,7 {
                  bd16 bd8. s4 bd16 bd8. s4
                }
                \volta 2,4,6 {
                  bd16 bd8. s4 bd16 bd8. bd16 bd8.
                }
                \volta 8 {
                  bd16 bd8. s8 bd8 s8. bd8 bd8.
                }
              }
            }
          }
        }
      >>
    }
  >>
}

\score {
  <<
    \new DrumStaff {
      \set DrumStaff.instrumentName = #"Bridge"
      <<
        \new DrumVoice = "hands" {
          \numericTimeSignature
          \voiceOne
          \bar ".|:-|"
          \drummode {
            cymc8 hho <hho sn> hho cymc hho <hho sn> hho
            cymc8 hho <hho sn> hho cymc hho <cymc sn> sn32 sn sn sn
            cymc8 hho <cymc sn> hho hho hho <hho sn> hho16 sn
            cymc8 hho <hho sn> hho cymc hho <hho sn> hho
            \repeat volta 4 {
            <>^\markup \bold "4×"
              \drummode {
                <cymc sn>8 hho <cymc sn> hho hho[ hho <hho sn>
                \alternative {
                  \volta 1,2,3 {
                    hho8]
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
        \new DrumVoice = "feet" {
          \voiceTwo
          \drummode {
            bd8 bd s4 bd8 bd s4
            bd8 bd s4 bd8 bd s4
            bd8 bd s4 bd8 bd s bd
%            \break
            bd16 bd s4. bd8 bd s bd
            \repeat volta 4 {
              \drummode {
                s16 bd8 bd8. bd bd8 bd8.
                \alternative {
                  \volta 1,2,3 {
                    bd8
                  }
                  \volta 4 {
                    s8
                  }
                }
              }
            }
          }
        }
      >>
    }
  >>
}

\score {
  <<
    \new DrumStaff {
      \set DrumStaff.instrumentName = #"Verse"
      <<
        \new DrumVoice = "hands" {
          <>^\markup \bold "12×"
          \numericTimeSignature
          \voiceOne
          \bar ".|:-|"
          \repeat volta 12 {
            \drummode {
              \alternative {
                \volta 1,3,5,7,9,11 {
                  <tomh tomfh>4 \flam sn <tomh tomfh>4 \flam sn
                }
                \volta 2,6,10 {
                  <tomh tomfh>4 \flam sn <tomh tomfh>4 <tomh tomfh>4
                }
                \volta 4,8 {
                  <tomh tomfh>4 \flam sn <tomh tomfh>4 <tomh tomfh>8 <cymc sn>8
                }
                \volta 12 {
                  <tomh tomfh>4 <sn tomfh>8 hho <cymc sn>16 tomh tomfh8 <tomh
                  tomfh>8 <cymc sn>
                }
              }
            }
          }
          \bar "|."
        }
        \new DrumVoice = "feet" {
          \voiceTwo
          \repeat volta 4 {
            \drummode {
              \alternative {
                \volta 1,3,5,7,9,11 {
                  <bd hhp>16 bd hhp8 hhp hhp <bd hhp>16 bd hhp8 hhp hhp
                }
                \volta 2,6,10 {
                  <bd hhp>16 bd hhp8 hhp hhp <bd hhp>16 bd hhp8 <bd hhp>16 bd
                  hhp8
                }
                \volta 4,8 {
                  <bd hhp>16 bd hhp8 hhp hhp <bd hhp>16 bd hhp8 <bd hhp>16 bd
                  hhp8
                }
                \volta 12 {
                  <bd hhp>16 bd hhp8 hhp bd s8. bd8 bd8.
                }
              }
            }
          }
        }
      >>
    }
  >>
}

\score {
  \layout{ ragged-right = ##f }
  <<
    \new DrumStaff {
      \set DrumStaff.instrumentName = #"Chorus"
      <<
        \new DrumVoice = "hands" {
          <>^\markup \bold "4×"
          \numericTimeSignature
          \voiceOne
          \bar ".|:-|"
          \repeat volta 4 {
            \drummode {
              <cymc sn>8 cymc <cymc sn> cymc
              \alternative {
                \volta 1,3 {
                  <cymc sn>8 cymc <cymc sn> cymc
                }
                \volta 2 {
                  <cymc sn>8 hho <cymc sn> cymc32 cymc16.
                }
                \volta 4 {
                  <cymc sn>8 hho <cymc sn>16 tomh tomfh8
                }
              }
            }
          }
          \bar "|."
        }
        \new DrumVoice = "feet" {
          \voiceTwo
          \repeat volta 4 {
            \drummode {
              s8 bd8. bd8 bd16
              \alternative {
                \volta 1,3 {
                  s8 bd8. bd8 bd16
                }
                \volta 2 {
                  s8 bd8. bd8 bd16
                }
                \volta 4 {
                  s8 bd8. s8 bd16
                }
              }
            }
          }
        }
      >>
    }
  >>
}

\markuplist {
  \column
  \bold {
    { "Bridge" }
    { "Verse" }
  }
}


\score {
  <<
    \new DrumStaff {
      \set DrumStaff.instrumentName = #"Chorus"
      <<
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
                  <cymc sn>8 hho <sn tomfh>16 <sn tomfh> <sn tomfh>8
                }
              }
            }
          }
          \bar "|."
        }
        \new DrumVoice = "feet" {
          \voiceTwo
          \repeat volta 12 {
            \drummode {
              s1
              \alternative {
                \volta 8 {
                  s8 bd8. s8 bd16
                }
              }
            }
          }
        }
      >>
    }
  >>
}

\score {
  \layout{ ragged-right = ##f }
  <<
    \new DrumStaff {
      \set DrumStaff.instrumentName = #"Outro"
      <<
      \new DrumVoice = "hands" {
        \numericTimeSignature
        \voiceOne
        \bar ".|:-|"
          \drummode {
          \repeat unfold 2 { cymc8 hho <hho sn> hho }
          \time 2/4
          cymc8 \repeat unfold 6 { <tomh tomfh>16 }
          \time 4/4
          cymc8 cymc \repeat unfold 8 { sn32 } cymc8 hho <cymc sn> sn32 sn sn sn
          \repeat unfold 3 { cymc8 sn32 sn sn sn } hho16 sn tomh tomfh
          \repeat unfold 2 { cymc8 hho <hho sn> hho }
          \repeat unfold 3 { cymc8 sn16 sn } cymc16 sn tomh tomfh
          \repeat unfold 2 { cymc8 hho <hho sn> hho }
          cymc8 \repeat unfold 6 { sn16 } tomh tomh tomh tomh tomfh tomfh tomfh
          tomfh
            cymc8 hho <hho sn> hho <cymc sn>8 <cymc sn> <cymc sn>4
          }
          \bar "|."
        }
      \new DrumVoice = "feet" {
        \voiceTwo
          \drummode {
            \repeat unfold 2 { bd8 bd8 s4 }
            \time 2/4
            bd2
            \time 4/4
            bd8 bd s4 bd8 bd s4
            bd4 bd bd bd
            \repeat unfold 2 { bd8 bd8 s4 }
            bd4 bd bd bd
            \repeat unfold 2 { bd8 bd8 s4 }
            bd8 \repeat unfold 7 { hhp }
            bd8[ bd s bd] s16 bd8 bd8 s8.
          }
        }
      >>
    }
  >>
}
