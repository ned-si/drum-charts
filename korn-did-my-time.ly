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
            <cymc cymch>4 <hho sn> hho <hho sn>8[ s16 tomfl32 tomfl]
            \break
            tomfl4 s2 s8 sn
            <cymc cymch>8[ hho] <hho sn> <hho sn> hho16 sn hho8 <hho sn>8 <hho sn>16 tomfl32 tomfl
            tomfl4 s2 s8 sn
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
            bd8 bd16 bd s8 bd16 bd bd8 bd16 bd s8 bd16 s
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
          \numericTimeSignature
          \voiceOne
          \bar ".|:-|"
          \repeat volta 4 {
            \drummode {
              <cymc cymch>8 cymc16 s <cymc sn>8 cymr cymc[ cymc] <cymc sn> cymc
              <cymc cymch>8 cymc16 s <cymc sn>16 sn cymr8
              \alternative {
                \volta 1,2 {
                  cymc8 <cymc sn> <cymc sn> r
                }
                \volta 3 {
                  cymc8 <cymc sn> <cymc sn>8 tomh16 toml32 toml
                }
                \volta 4 {
                  cymc16[ tomh32 tomh toml8] toml8[\tuplet 3/2 { \repeat unfold 3 { tomfh16 }}]
                  % add sticking here (check how)
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
              bd8[ s16 bd] s8 bd s16 bd s8 s16 bd s8
              bd8[ s16 bd] s8 bd s16 bd s4.
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
                  hh8
                }
              }
              hh16 s <hh sn>8 hh
              \alternative {
                \volta 1,2,3,5,6,7 {
                  hh[ hh8] <hh sn> hh
                }
                \volta 4 {
                  \repeat unfold 2 { sn16 hho s8 }
                }
                \volta 8 {
                  hh[ hh8] <hh sn> \tuplet 3/2 { toml16 tomfh toml }
                }
              }
            }
          }
          \drummode {
            tomfl4 s2 s8 sn
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
                  bd8
                }
              }
              [ s16 bd] s4
              \alternative {
                \volta 1,2,3,5,6,7 {
                  bd8[ s16 bd] s4
                }
                \volta 4 {
                  \repeat unfold 2 { s16 bd hhp8 }
                }
                \volta 8 {
                  bd8[ s16 bd] s4
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

\score {
  <<
    \new DrumStaff {
      \set DrumStaff.instrumentName = #"Chorus1"
      <<
        \new DrumVoice = "hands" {
          \numericTimeSignature
          \voiceOne
          \bar ".|:-|"
          \repeat volta 4 {
            \drummode {
              <cymc cymch>8 cymc16 s <cymc sn>8 cymr cymc[ cymc] <cymc sn> cymc
              <cymc cymch>8 cymc16 s <cymc sn>16 sn cymr8
              \alternative {
                \volta 1,2 {
                  cymc8 <cymc sn> <cymc sn> r
                }
                \volta 3 {
                  cymc8 <cymc sn> <cymc sn>8 tomh16 toml32 toml
                }
                \volta 4 {
                  cymc16[ tomh32 tomh toml8] toml8[\tuplet 3/2 { \repeat unfold 3 { tomfh16 }}]
                  % add sticking here (check how)
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
              bd8[ s16 bd] s8 bd s16 bd s8 s16 bd s8
              bd8[ s16 bd] s8 bd s16 bd s4.
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
      \set DrumStaff.instrumentName = #"Verse2"
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
                  hh8
                }
              }
              hh16 s <hh sn>8 hh
              \alternative {
                \volta 1,2,3,5,6,7 {
                  hh[ hh8] <hh sn> hh
                }
                \volta 4 {
                  \repeat unfold 2 { sn16 hho s8 }
                }
                \volta 8 {
                  hh[ hh8] <hh sn> \tuplet 3/2 { toml16 tomfh toml }
                }
              }
            }
          }
          \drummode {
            tomfl4 s2 s8 sn
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
                  bd8
                }
              }
              [ s16 bd] s4
              \alternative {
                \volta 1,2,3,5,6,7 {
                  bd8[ s16 bd] s4
                }
                \volta 4 {
                  \repeat unfold 2 { s16 bd hhp8 }
                }
                \volta 8 {
                  bd8[ s16 bd] s4
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

\score {
  <<
    \new DrumStaff {
      \set DrumStaff.instrumentName = #"Chorus2"
      <<
        \new DrumVoice = "hands" {
          \numericTimeSignature
          \voiceOne
          \bar ".|:-|"
          \repeat volta 4 {
            \drummode {
              <cymc cymch>8 cymc16 s <cymc sn>8 cymr cymc[ cymc] <cymc sn> cymc
              <cymc cymch>8 cymc16 s <cymc sn>16 sn cymr8
              \alternative {
                \volta 1,2 {
                  cymc8 <cymc sn> <cymc sn> r
                }
                \volta 3 {
                  cymc8 <cymc sn> <cymc sn>8 tomh16 toml32 toml
                }
                \volta 4 {
                  cymc16[ tomh32 tomh toml8] toml8[\tuplet 3/2 { \repeat unfold 3 { tomfh16 }}]
                  % add sticking here (check how)
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
              bd8[ s16 bd] s8 bd s16 bd s8 s16 bd s8
              bd8[ s16 bd] s8 bd s16 bd s4.
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
      \set DrumStaff.instrumentName = #"Bridge"
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
            cymr8[ cymr] <cymr sn> cymr cymr16 hh cymr8 <cymr sn> cymr
            cymr16 hh cymr s <cymr sn>8 cymr cymr16 hh cymr s16 <cymr sn>8 cymr16 hh
            cymr8 cymr8 <cymr sn> cymr16 sn cymr toml cymr sn sn sn toml tomfh
            cymr8[ cymr] <cymr sn>16 hh cymr s cymr8 cymr <cymr sn>16 hh cymr hh
            cymr16 hh cymr s <cymr sn>8 cymr cymr16 hh cymr s16 <cymr sn>16 hh cymr hh
            cymr8[ cymr] <cymr sn>16 hh cymr s cymr hh cymr hh <cymr sn> hh cymr hh
            cymr8 cymr8 <cymr sn> cymr16 sn cymr toml cymr sn \tuplet 3/2 { tomh16 tomh toml } \tuplet 3/2 { toml tomfh tomfh }
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
            bd8. bd16 s8. bd4 bd8 bd8.
            bd8. bd16 s8. bd4 bd8 bd8.
            bd8. bd16 s8. bd4 bd8 bd8.
            bd8. bd16 s2.
            bd8. bd16 s8. bd4 bd8 bd8.
            bd8. bd16 s8. bd4 bd8 bd8.
            bd8. bd16 s8. bd4 bd8 bd8.
            bd8. bd16 s2.
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
