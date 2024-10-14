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
    \set DrumStaff.instrumentName = #"Pre-intro1"
    \new DrumVoice = "hands" {
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
  <<
    \new DrumStaff {
      \set DrumStaff.instrumentName = #"Pre-intro2"
      <<
        \new DrumVoice = "hands" {
          \numericTimeSignature
          \voiceOne
          \drummode {
            \repeat unfold 2 {
              hho4 hho hho hho
              s1
            }
            <cymc cymch>4 <hho sn> hho <hho sn>8[ s16 tomfh32 tomfh]
            \break
            tomfh4 s2 s8 sn
            <cymc cymch>8[ hho] <hho sn> <hho sn> hho16 sn hho8 <hho sn>8 <hho sn>16 tomfh32 tomfh
            tomfh4 s2 s8 sn
          }
          \bar "|."
        }
        \new DrumVoice = "feet" {
          \voiceTwo
          \drummode {
            \repeat unfold 2 {
              s1
              hhp4 s2.
            }
            bd8 bd16 bd s8 bd16 bd bd8 bd16 bd s8 bd8
            hhp4 hhp hhp hhp16 bd s8
            bd8 bd16 bd s4 bd8 bd s4
            hhp4 hhp hhp hhp16 bd s8
          }
        }
      >>
    }
  >>
}

\score {
  <<
    \new DrumStaff {
      \set DrumStaff.instrumentName = #"Intro"
      <<
        \new DrumVoice = "hands" {
          <>^\markup \bold "4×"
          \numericTimeSignature
          \voiceOne
          \bar ".|:-|"
          \repeat volta 4 {
            \drummode {
              <cymc cymch>8[ cymc] <cymc sn> cymc cymc[ cymc] <cymc sn> cymc
              <cymc cymch>8[ cymc] <cymc sn>16 sn cymc8
              \alternative {
                \volta 1,2 {
                  cymc8 <cymc sn> <cymc sn> r
                }
                \volta 3 {
                  cymc8 <cymc sn> <cymc sn>8 tomh16 toml32 toml
                }
                \volta 4 {
                  r16 tomh32_\right[ tomh_\left toml8_\right] toml8_\left \tuplet 3/2 { tomfh16_\right tomfh16_\left tomfh16_\left }
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
              bd8.[ bd] bd8.[ bd8] s bd8.
              bd8.[ bd8.] bd8
              \alternative {
                \volta 1,3 {
                  s16 bd4 s8.
                }
                \volta 2 {
                  s16 bd4 s8.
                }
                \volta 4 {
                  s2
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
      \set DrumStaff.instrumentName = #"Verse1"
      <<
        \new DrumVoice = "hands" {
          \numericTimeSignature
          \voiceOne
          \bar ".|:-|"
          \repeat volta 8 {
            \drummode {
              \alternative {
                \volta 1,5 {
                  cymc8
                }
                \volta 2,3,4,6,7,8 {
                  hh8[
                }
              }
              hh8] <hh sn> hh
              \alternative {
                \volta 1,2,3,5,6,7 {
                  hh[ hh8] <hh sn> hho
                }
                \volta 4 {
                  \repeat unfold 2 { sn16 hho s8 }
                }
                \volta 8 {
                  hh[ hh8] <hh sn> \tuplet 3/2 { tomh16_\right tomh_\left toml_\right }
                }
              }
            }
          }
          \drummode {
            tomfh4_\right s2 s8 sn
          }
          \bar "|."
        }
        \new DrumVoice = "feet" {
          \voiceTwo
          \repeat volta 8 {
            \drummode {
              \alternative {
                \volta 1,5 {
                  bd8
                }
                \volta 2,3,4,6,7,8 {
                  bd8.
                }
              }
              [ bd8] s8.
              \alternative {
                \volta 1,2,3,5,6,7 {
                  bd8.[ bd8] s8.
                }
                \volta 4 {
                  \repeat unfold 2 { s16 bd hhp8 }
                }
                \volta 8 {
                  bd8.[ bd8] s8.
                }
              }
            }
          }
          \drummode {
            hhp4 hhp hhp hhp16 bd s8
          }
        }
      >>
    }
  >>
}

\markuplist {
  \column
  \bold {
    { "Chorus1 = Intro" }
    \hspace #0
    { "Verse2    = Verse1" }
    \hspace #0
    { "Chorus2 = Intro" }
    \hspace #0
  }
}

\score {
  <<
    \new DrumStaff {
      \set DrumStaff.instrumentName = #"Bridge1"
      <<
        \new DrumVoice = "hands" {
          \numericTimeSignature
          \voiceOne
          \bar ".|:-|"
          \repeat volta 3 {
            \drummode {
              \alternative {
                \volta 1 {
                  cymc4
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
            cymc8[ cymr] <cymr sn> cymr cymr cymr <cymr sn>16 hh cymr hh
            cymr8[ cymr] <cymr sn> cymr cymr16 hh cymr8 <cymr sn> cymc
            cymr16 hh cymr s <cymr sn>8 cymr cymr16 hh cymr s16 <cymr sn>8 cymr16 hh
            cymr8 cymr <cymr sn> cymr16 sn cymr toml cymr sn sn sn toml tomfh
            cymc8[ cymr] <cymr sn>16 hh cymr s cymr8 cymr <cymr sn>16 hh cymr hh
            cymr16 hh cymr s <cymr sn>8 cymr cymr16 hh cymr s <cymr sn> hh cymc hh
            cymr8[ cymr] <cymr sn>16 hh cymr s cymr hh cymr hh <cymr sn> hh cymr hh
            cymr8 cymr <cymr sn> cymr16 sn cymr toml cymr sn \tuplet 3/2 { tomh tomh toml } \tuplet 3/2 { toml tomfh tomfh }
          }
          \repeat volta 4 {
            \drummode {
              \alternative {
                \volta 1 {
                  cymc4
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
        \new DrumVoice = "feet" {
          \voiceTwo
          \repeat volta 3 {
            \drummode {
              \alternative {
                \volta 1 {
                  bd4
                }
                \volta 2 {
                  s4
                }
                \volta 3 {
                  s4
                }
              }
              s2
              \alternative {
                \volta 1,3 {
                  s4
                }
                \volta 2 {
                  s4
                }
              }
            }
          }
          \drummode {
            s1
            \repeat unfold 2 {
              \repeat unfold 3 { bd8.[ bd8] s bd4 bd8 bd8. }
              bd8. bd8 s2 s8.
           }
          }
          \repeat volta 4 {
            \drummode {
              \alternative {
                \volta 1 {
                  bd4
                }
                \volta 2,3,4 {
                  s4
                }
              }
              s2.
            }
          }
        }
      >>
    }
  >>
}
\pageBreak

\score {
  \layout{ ragged-right = ##f }
  <<
    \new DrumStaff {
      \set DrumStaff.instrumentName = #"Bridge2"
      <<
        \new DrumVoice = "hands" {
          \numericTimeSignature
          \voiceOne
          \bar ".|:-|"
          <>^\markup \bold "8×"
          \repeat volta 8 {
            \drummode {
              cymc8[ cymc] <cymc sn>[ cymc]
              \alternative {
                \volta 1,2,3,5,6,7 {
                  cymc8[ cymc] <cymc sn>[ cymc]
                }
                \volta 4 {
                  cymc8[ cymc] <cymc sn>[ <cymc sn>]
                }
                \volta 8 {
                  cymc8[ cymc] <cymc sn>[ <cymc sn>]
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
              bd8.[ bd8] bd[ bd16]
              \alternative {
                \volta 1,2,3,5,6,7 {
                  s16 bd8[ bd8.] bd8
                }
                \volta 4 {
                  s16 bd8[ bd] s8.
                }
                \volta 8 {
                  s16 bd8[ bd32 bd] s16 bd32[ bd]
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
      \set DrumStaff.instrumentName = #"Bridge3"
      <<
        \new DrumVoice = "hands" {
          \numericTimeSignature
          \voiceOne
          \bar ".|:-|"
          \repeat volta 4 {
            \drummode {
              \alternative {
                \volta 1,3 {
                  cymc8
                }
                \volta 2,4 {
                  hho8[
                }
              }
              hho] <hho sn>[ hho]
              \alternative {
                \volta 1,3 {
                  hho[ hho] <hho sn>[ hho]
                }
                \volta 2 {
                  hho[ hho] <hho sn>[ cymc]
                }
                \volta 4 {
                  <cymc sn>16 sn32 sn sn16 sn \repeat unfold 4 { sn }
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
                \volta 1,3 {
                  bd8
                }
                \volta 2,4 {
                  bd8.[
                }
              }
              bd8] s8.
              \alternative {
                \volta 1,3 {
                  bd8.[ bd8] s8.
                }
                \volta 2 {
                  bd8.[ bd8] s8.
                }
                \volta 4 {
                  s2
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
      \set DrumStaff.instrumentName = #"Chorus3"
      <<
        \new DrumVoice = "hands" {
          \numericTimeSignature
          \voiceOne
          <>^\markup \bold "4×"
          \bar ".|:-|"
          \repeat volta 4 {
            \drummode {
              <cymc cymch>8[ cymc] <cymc sn>[ cymc] cymc[ cymc] <cymc sn> cymc
              <cymc cymch>8[ cymc] <cymc sn>16[ sn cymc8] 
              \alternative {
                \volta 1,3 {
                  cymc <cymc sn> <cymc sn> r
                }
                \volta 2 {
                  cymc <cymc sn> <cymc sn> hho
                }
                \volta 4 {
                  r <cymc sn> <cymc sn> r
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
              bd8.[ bd] bd8.[ bd8] s bd8.
              bd8.[ bd8.] bd8
              \alternative {
                \volta 1,3 {
                  s16 bd4 s8.
                }
                \volta 2 {
                  s16 bd8 bd bd s16
                }
                \volta 4 {
                  s8. bd8 bd s16
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
                  <tomh tomfh>8 <toml tomfh>
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
                \volta 1 {
                  s8
                }
                \volta 2,3,4,5,6,7,8 {
                  s8
                }
              }
              s8
              \alternative {
                \volta 1,2,3,4,5,6,7 {
                  s4
                }
                \volta 8 {
                  s8 bd
                }
              }
            }
          }
        }
      >>
    }
  >>
}
