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
    \new DrumVoice = "hands" {
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
  <<
    \new DrumStaff {
      \set DrumStaff.instrumentName = #"Intro"
      <<
        \new DrumVoice = "hands" {
          \time 12/8
          \voiceOne
          \bar ".|:-|"
          \repeat volta 4 {
            \drummode {
              \alternative {
                \volta 1,2,4 { cymc8 \flam sn16 s8 s16 \flam sn8[ s \flam sn]
                  \alternative {
                    \volta 1 { sn16 tomh tomh sn toml toml sn32 sn sn sn sn16 tomh tomh toml }
                    \volta 2 { tomh16 sn sn toml toml toml sn sn toml tomfh tomfh tomfh }
                    \volta 4 { sn16 tomh sn sn tomh tomh sn sn toml tomfh tomfh tomfh}
                    }
                  }
                \volta 3 { cymc16 tomh tomh tomh toml toml sn sn toml toml tomfh tomfh
                           cymc toml \repeat unfold 4 { tomh } sn sn toml toml tomfh tomfh
                }
              }
            }
          }
          \bar ":|."
          \repeat volta 4 {
            \drummode {
              cymc8 hho16 sn hho8 <hho sn> hho16 sn hho8
              \alternative {
                \volta 1,2,3 { cymc8 hho16 sn hho8 <hho sn>[ hho8 <hho sn>] }
                \volta 4 { cymc8[ sn16 sn hho] s <hho sn>8[ sn16 toml toml toml] }
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
                \volta 1,2,4 { bd8[ s16 bd8 bd16] s8 bd4 }
                  \alternative {
                    \volta 1 { bd s2 }
                    \volta 2 { bd4 s2 }
                    \volta 4 { bd4 s2 }
                    }
                \volta 3 { \repeat unfold 4 { bd4 s8 } }
              }
            }
          }
          \repeat volta 4 {
            \drummode {
              bd8 [ s s16 bd8] s8. bd8
              \alternative {
                \volta 1,2,3 { bd[ s bd] s8 bd4 }
                \volta 4 { bd8 [ s s16 bd8] s4 }
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
      \set DrumStaff.instrumentName = #"Verse1"
      <<
        \new DrumVoice = "hands" {
          \time 12/8
          \voiceOne
          \bar ".|:-|"
          \drummode {
          }
          \repeat volta 12 {
            \drummode {
              \alternative {
                \volta 1 {
                  cymc8 hh16 \parenthesize sn hh8 <hh sn> hh16 sn hh8 hh8 hh16 \parenthesize sn hh8 <hho sn> hh16 sn hh8
                }
                \volta 2 {
                  hh8 hh16 \parenthesize sn hh8 <hho sn> hh16 sn hh8 hh8 hh16 \parenthesize sn hh8 <hho sn> hh16 \repeat unfold 2 { \parenthesize sn32 } hh16  sn
                }
                \volta 3,5,7,9,11 {
                  \alternative {
                    \volta 9 { cymc8[ }
                    \volta 3,5,7,11 { hh16[ \parenthesize sn }
                  }
                  hh16 \parenthesize sn hh8] <hh sn> hh16 sn hh8
                  hh8 hh16 \parenthesize sn hh8 <hh sn> hh16 sn hh8
                }
                \volta 4,6,8,10 {
                  hh8 hh16 sn hh8 <hh sn> hh16 \parenthesize sn hh8
                  hh8 hh16 sn hh8 <hho sn> hh16 \repeat unfold 2 { \parenthesize sn32 } hh16 sn
                }
                \break
                \volta 12 {
                  hh8 hh16 \parenthesize sn hh8 <hh sn>\< hh16 sn hh8
                  hho8 hho16 \parenthesize sn hho8 <hho sn>8 hho <hho sn>\!
                }
              }
            }
          }
          \bar "|."
        }
        \new DrumVoice = "feet" {
          \voiceTwo
          \drummode {
          }
          \repeat volta 12 {
            \drummode {
              \alternative {
                \volta 1 {
                  <bd hhp>8[ s s16 bd8] s8. bd8 bd[ s s16 bd8] s16 hhp8 bd
                }
                \volta 2 {
                  bd[ s s16 bd8] s16 hhp8 bd bd[ s s16 bd8] s16 hhp8 bd
                }
                \volta 3,5,7,9,11 {
                  \alternative {
                    \volta 9 { bd8[ }
                    \volta 3,5,7,11 { bd8[ }
                  }
                  s s16 bd8] s8. bd8
                  bd8 [ s s16 bd8] s8. bd8
                }
                \volta 4,6,8,10 {
                  bd8 [ s s16 bd8] s8. bd8
                  bd8[ s s16 bd8] s16 s8 bd
                }
                \volta 12 {
                  bd8 [ s s16 bd8] s8. bd8
                  bd8[ s s16 bd8] s16 bd8 s
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
      \set DrumStaff.instrumentName = #"Chorus1"
      <<
        \new DrumVoice = "hands" {
          \time 12/8
          \voiceOne
          \bar ".|:-|"
          \repeat volta 4 {
            \drummode {
              \alternative {
                \volta 1,2,4 { cymc8 \flam sn16 s8 s16 \flam sn8[ s \flam sn]
                  \alternative {
                    \volta 1 { toml16 sn sn toml toml toml sn sn toml tomfh tomfh tomfh }
                    \volta 2 { tomh16 sn sn toml toml toml sn sn toml tomfh tomfh tomfh }
                    \volta 4 { sn16 tomh sn sn tomh tomh sn32 sn sn sn sn16 tomh tomh toml }
                    }
                  }
                \volta 3 { cymc16 tomh tomh tomh toml toml sn sn toml toml tomfh tomfh
                           cymc toml \repeat unfold 4 { tomh } sn sn toml toml tomfh tomfh
                }
              }
            }
          }
          \bar ":|."
          \repeat volta 4 {
            \drummode {
              cymc8 hho16 sn hho8 <hho sn> hho16 sn hho8
              \alternative {
                \volta 1,2,3 { cymc8 hho16 sn hho8 <hho sn>[ hho8 <hho sn>] }
                \volta 4 { cymc8[ sn16 sn hho] s <hho sn>8[ sn16 sn tomh toml] }
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
                \volta 1,2,4 { bd8[ s16 bd8 bd16] s8 bd4 }
                  \alternative {
                    \volta 1 { bd s2 }
                    \volta 2 { bd4 s2 }
                    \volta 4 { bd4 s2 }
                    }
                \volta 3 { \repeat unfold 4 { bd4 s8 } }
              }
            }
          }
          \repeat volta 4 {
            \drummode {
              bd8 [ s s16 bd8] s8. bd8
              \alternative {
                \volta 1,2,3 { bd[ s bd] s8 bd4 }
                \volta 4 { bd8 [ s s16 bd8] s4 }
              }
            }
          }
        }
      >>
    }
  >>
}

\score {
  \new DrumStaff {
    \set DrumStaff.instrumentName = #"Verse2"
    \new DrumVoice = "hands" {
      \time 12/8
      \voiceOne
      \drummode {
        <>_"Same as verse 1"
        \compressEmptyMeasures
        \override MultiMeasureRest.expand-limit = 1
        R1*18
      }
    }
  }
}

\pageBreak

\score {
  <<
    \new DrumStaff {
      \set DrumStaff.instrumentName = #"Chorus2"
      <<
        \new DrumVoice = "hands" {
          \time 12/8
          \voiceOne
          \bar ".|:-|"
          \repeat volta 4 {
            \drummode {
              \alternative {
                \volta 1,2,4 { cymc8 \flam sn16 s8 s16 \flam sn8[ s \flam sn]
                  \alternative {
                    \volta 1 { tomh16 sn sn toml toml toml sn sn toml tomfh tomfh tomfh }
                    \volta 2 { tomh16 sn sn toml toml toml sn sn toml tomfh tomfh tomfh }
                    \volta 4 { sn16 tomh^\act \parenthesize sn tomh^\act \repeat
                    unfold 4 { \parenthesize sn32 } sn16 sn sn tomh tomh toml}
                    }
                  }
                \volta 3 { cymc16 tomh tomh tomh toml toml sn sn toml toml tomfh tomfh
                           cymc toml \repeat unfold 4 { tomh } sn sn toml toml tomfh tomfh
                }
              }
            }
          }
          \bar ":|."
          \break
          \repeat volta 4 {
            \drummode {
              cymc8 hho16 sn hho8 <hho sn> hho16 sn hho8
              cymc8 hho16 sn hho8 <hho sn>[ hho8 <hho sn>]
            }
          }
          \drummode {
            \parenthesize cymc4. r r r
            \compressEmptyMeasures
            \override MultiMeasureRest.expand-limit = 1
            R1*3/2
          }
          \bar "|."
        }
        \new DrumVoice = "feet" {
          \voiceTwo
          \repeat volta 4 {
            \drummode {
              \alternative {
                \volta 1,2,4 { bd8[ s16 bd8 bd16] s8 bd4 }
                  \alternative {
                    \volta 1 { bd s2 }
                    \volta 2 { bd4 s2 }
                    \volta 4 { bd4 s2 }
                    }
                \volta 3 { \repeat unfold 4 { bd4 s8 } }
              }
            }
          }
          \repeat volta 4 {
            \drummode {
              bd8 [ s s16 bd8] s8. bd8
              bd[ s bd] s8 bd4
            }
          }
          \drummode {
            bd4. s s s
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
          \time 12/8
          \voiceOne
          \bar ".|:-|"
          \repeat volta 12 {
            \drummode {
              \alternative {
                \volta 1,2,3,4,9,10,11,12 {
                  cymc8 cymc16 sn cymc8 cymc cymc16 sn cymc8
                }
                \volta 5,6,7,8 {
                  cymc8 cymc16 sn cymc8 cymc[ s16 <cymc sn>8.^\act]
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
              \volta 1,2,3,4,9,10,11,12 {
                \repeat unfold 6 {bd8}
              }
              \volta 5,6,7,8 {
                \repeat unfold 5 {bd8} s
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
      \set DrumStaff.instrumentName = #"Chorus3"
      <<
        \new DrumVoice = "hands" {
          \time 12/8
          \voiceOne
          \bar ".|:-|"
          \repeat volta 4 {
            \drummode {
              \alternative {
                \volta 1,2,4 { cymc8 \flam sn16
                  \alternative { 
                    \volta 1 { s8 }
                    \volta 2,4 { s8 }
                  }
                  s16 \flam sn8[ s \flam sn]
                  \alternative {
                    \volta 1 { \repeat unfold 4 { sn16 } \repeat unfold 4 {
                    \parenthesize sn32 } \repeat unfold 4 { sn16 } tomh toml }
                    \volta 2 { sn16 tomh^\act \parenthesize sn tomh^\act \repeat
                    unfold 4 { \parenthesize sn32 } sn16 sn sn tomh tomh toml}
                    \volta 4 { sn16^\act toml^\act sn \parenthesize sn \repeat
                    unfold 4 { \parenthesize sn32 } sn16 sn sn tomh tomh toml }
                    }
                  }
                \volta 3 { cymc16 tomh tomh tomh toml toml sn sn toml toml tomfh tomfh
                           cymc toml \repeat unfold 4 { tomh } sn sn toml toml tomfh tomfh
                }
              }
            }
          }
          \bar ":|."
          \repeat volta 4 {
            \drummode {
              cymc8 hho16 sn hho8 <hho sn> hho16 sn hho8
              cymc8 hho16 sn hho8 <hho sn>[ hho8 <hho sn>]
            }
          }
          \bar "|."
        }
        \new DrumVoice = "feet" {
          \voiceTwo
          \repeat volta 4 {
            \drummode {
              \alternative {
                \volta 1,2,4 { bd8[ s16
                  \alternative { 
                    \volta 1 { r8 } 
                    \volta 2,4 { bd8 } 
                  }
                  bd16] s8 bd4 }
                  \alternative {
                    \volta 1 { bd s2 }
                    \volta 2 { bd4 s2 }
                    \volta 4 { bd4 s2 }
                    }
                \volta 3 { \repeat unfold 4 { bd4 s8 } }
              }
            }
          }
          \repeat volta 4 {
            \drummode {
              bd8 [ s s16 bd8] s8. bd8
              bd[ s bd] s8 bd4
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
          \time 12/8
          \voiceOne
          \bar ".|:-|"
          <>^\markup \bold "8×"
          \repeat volta 8 {
            \drummode {
              cymc16 \parenthesize sn cymc sn^\act cymc \parenthesize sn
            }
          }
          \repeat volta 4 {
            \drummode {
              cymc8.^\act cymc
              \alternative {
                \volta 1,2,3 {
                  <cymc sn>^\act cymc
                }
                \volta 4 {
                  sn16[ sn sn \parenthesize cymc8]
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
              bd8 bd bd
            }
          }
          \repeat volta 4 {
            \drummode {
              bd8. s
              \alternative {
                \volta 1,2,3 {
                  bd8. s
                }
                \volta 4 {
                  s8. bd16
                }
              }
            }
          }
        }
      >>
    }
  >>
}
