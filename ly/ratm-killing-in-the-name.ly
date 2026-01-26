\version "2.24.4"
\include "definitions.ly"

\layout{
  \set DrumStaff.drumStyleTable = #(alist->hash-table custom-notes)
}

\header {
  title = "Rage Against The Machine"
  subtitle = "Killing In The Name"
  composer = "nedsi"
  tagline = #f
}

% Custom markup to create vertical space after header
\markup {
  \vspace #-1
}

\score {
  \layout{ ragged-right = ##f }
  <<
    \new DrumStaff {
    \override Score.MetronomeMark.outside-staff-horizontal-padding = 1
    \tempo 4 = 110
      \set DrumStaff.instrumentName = #"Pre-Intro"
      <<
        \new DrumVoice = "hands" {
          \numericTimeSignature
          \voiceOne
          \bar ".|:-|"
          \repeat volta 8 {
            \drummode {
              \alternative {
                \volta 1,2,3,4 {
                  <cymc cymch>4 hho hho hho
                }
                \volta 5 {
                  s1
                }
                \volta 6,7 {
                  R1
                }
                \volta 8 {
                  r2. r8 \flam sn
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
                \volta 1,2,3,4 {
                  bd1
                }
                \volta 5 {
                  <bd hhp>1
                }
                \volta 6,7 {
                  s1
                }
                \volta 8 {
                  s1
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
    \tempo 4 = 124
      \set DrumStaff.instrumentName = #"Intro"
      <<
        \new DrumVoice = "hands" {
          \numericTimeSignature
          \voiceOne
          \bar ".|:-|"
          \repeat volta 8 {
            \drummode {
              \alternative {
                \volta 1 {
                  cymc8
                }
                \volta 2,3,4,5,6,7,8 {
                  hh8[
                }
              }
              hh8 <hh sn> hh] hh16 sn hh8 <hh sn> hh
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
                  bd8
                }
                \volta 2,3,4,5,6,7,8 {
                  bd8
                }
              }
              s16 bd s8 bd s8. bd8. bd8
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
    \tempo 4 = 115
      \set DrumStaff.instrumentName = #"Post-Intro"
      <<
        \new DrumVoice = "hands" {
          <>^\markup \bold "4×"
          \numericTimeSignature
          \voiceOne
          \bar ".|:-|"
          \repeat volta 4 {
            \drummode {
              \tuplet 3/2 {
                <cymc sn>4 <cymc sn> <cymc sn>
              }
              \alternative {
                \volta 1,2,3 {
                  \tuplet 3/2 {
                    cymc4 cymc cymc
                  }
                }
                \volta 4 {
                  s2
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
              \tuplet 3/2 {
                s8 bd4 bd bd8
              }
              \alternative {
                \volta 1,2,3 {
                  \tuplet 3/2 {
                    bd4 bd bd
                  }
                }
                \volta 4 {
                  bd2
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
    \tempo 4 = 80
      \set DrumStaff.instrumentName = #"Pre-Verse"
      <<
        \new DrumVoice = "hands" {
          \numericTimeSignature
          \voiceOne
          \bar ".|:-|"
          \repeat volta 4 {
            \drummode {
              \alternative {
                \volta 1 {
                  <cymc cymch>8
                }
                \volta 2,3,4 {
                  hho8[
                }
              }
              hho8 <hho sn> hho] 
              \alternative {
                \volta 1,2,3 {
                  hho hho <hho sn> hho
                }
                \volta 4 {
                  hho hho <hho sn> \flam sn
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
                  bd8
                }
                \volta 2,3,4 {
                  bd8
                }
              }
              s4.
              \alternative {
                \volta 1,2,3 {
                  bd2
                }
                \volta 4 {
                  bd16 bd s bd8 bd8.
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
      \set DrumStaff.instrumentName = #"Verse"
      <<
        \new DrumVoice = "hands" {
          \numericTimeSignature
          \voiceOne
          \bar ".|:-|"
          \repeat volta 8 {
            \drummode {
              \alternative {
                \volta 1 {
                  <cymc cymch>8
                }
                \volta 2,3,4,5,6,7,8 {
                  hh8[
                }
              }
              hh8 <hh sn> hh] 
              \alternative {
                \volta 1,2,3,5,6,7 {
                  hh8 hh <hh sn> hho
                }
                \volta 4 {
                  hh8 hh <hh sn> hho
                }
                \volta 8 {
                  hho8 hho <hho sn> <hho sn>
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
                  bd8
                }
                \volta 2,3,4,5,6,7,8 {
                  bd8
                }
              }
              s4.
              \alternative {
                \volta 1,2,3,5,6,7 {
                  bd2
                }
                \volta 4 {
                  bd16 bd s bd8. bd8
                }
                \volta 8 {
                  bd8. bd8 bd8.
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
              cymc8 hho <hho sn> hho
              \alternative {
                \volta 1,3 {
                  cymc8 hho <hho sn> hho
                }
                \volta 2 {
                  cymc8 hho <hho sn> cymc
                }
                \volta 4 {
                  <cymc sn>16 <cymc sn> <cymc sn> <cymc sn> <cymc sn> <cymc sn> <cymc sn> <cymc sn> 
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
              bd2
              \alternative {
                \volta 1,3 {
                  bd2
                }
                \volta 2 {
                  bd8. bd bd8
                }
                \volta 4 {
                  bd16 bd bd bd bd bd bd bd
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
    \tempo 4 = 89
      \set DrumStaff.instrumentName = #"Bridge"
      <<
        \new DrumVoice = "hands" {
          \numericTimeSignature
          \voiceOne
          \bar ".|:-|"
          \repeat volta 12 {
            \drummode {
              \alternative {
                \volta 1,2,3,4 {
                  <sn tomfh>16 <sn tomfh> s8 <sn tomfh>2.
                }
                \volta 5,6,7,8,9,10,11 {
                  <sn tomfh>16 <sn tomfh> s8 <sn tomfh>2 \flam sn8 sn
                }
                \volta 12 {
                  <sn tomfh>16 <sn tomfh> s8 <sn tomfh>8 <cymc sn> \tuplet 6/4 {
                    sn16 sn sn sn sn sn } \tuplet 6/4 { sn sn sn sn sn sn }
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
              \alternative {
                \volta 1,2,3,4 {
                  hhp4 hhp hhp hhp
                }
                \volta 5,6,7,8,9,10,11 {
                  s8 hhp16 bd s4 bd8. bd16 s8. bd16
                }
                \volta 12 {
                  s8 hhp16 bd8 bd8. s2
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
      \set DrumStaff.instrumentName = #"Break"
      <<
        \new DrumVoice = "hands" {
          \numericTimeSignature
          \voiceOne
          \bar ".|:-|"
          \repeat volta 8 {
            \drummode {
              \alternative {
                \volta 1,2,3,5,6,7 {
                  cymc8 hho <hho sn> hho hho hho <hho sn> hho
                }
                \volta 4,8 {
                  cymc8 hho <hho sn> hho16 sn hho sn hho8 <hho sn> <hho sn>
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
                \volta 1,2,3,5,6,7 {
                  bd16 bd8 bd16 s8. bd8. bd16 bd s4
                }
                \volta 4,8 {
                  bd16 bd8 bd16 s4. bd16 bd8 bd8.
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
    { "Verse" }
    \hspace #0
    { "Chorus" }
    \hspace #0
    { "Bridge" }
    \hspace #0
    { "Break - 16x" }
    \hspace #0
  }
}

\score {
  \layout{ ragged-right = ##f }
  <<
    \new DrumStaff {
      \set DrumStaff.instrumentName = #"Pre-Outro"
      <<
        \new DrumVoice = "hands" {
          \numericTimeSignature
          \voiceOne
          \bar ".|:-|"
          \repeat volta 8 {
            \drummode {
              \alternative {
                \volta 1 {
                  \repeat unfold 4 {
                    cymc32 cymch cymc cymch cymc cymch cymc cymch
                  }
                }
                \volta 2,3,4,5,6 {
                  \repeat unfold 4 {
                    cymc32 cymch sn sn sn sn sn sn
                  }
                }
                \volta 7 {
                  \repeat unfold 4 {
                    cymc32 cymch cymc cymch cymc cymch cymc cymch
                  }
                }
                \volta 8 {
                  \repeat unfold 4 {
                    cymc32 cymch cymc cymch cymc cymch cymc cymch
                  }
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
                  \repeat unfold 4 {
                    bd32 hhp bd hhp bd hhp bd hhp
                  }
                }
                \volta 2,3,4,5,6 {
                  \repeat unfold 4 {
                    bd32 hhp bd hhp bd hhp bd hhp
                  }
                }
                \volta 7 {
                  \repeat unfold 4 {
                    bd8. bd16
                  }
                }
                \volta 8 {
                  \repeat unfold 4 {
                    bd4
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

\markuplist {
  \column
  \bold {
    { "Break - 12x" }
    \hspace #0
  }
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
            \repeat unfold 4 {
              \tuplet 6/4 {
                sn16 sn sn sn sn sn
              }
            }
            \tuplet 3/2 { cymc4 cymc cymc }
            \tuplet 3/2 { <cymc sn>4 <cymc sn> <cymc sn> }
          }
          \bar "|."
        }
        \new DrumVoice = "feet" {
          \voiceTwo
          \drummode {
            s1
            \tuplet 3/2 { bd4 bd bd }
            s2
          }
        }
      >>
    }
  >>
}
