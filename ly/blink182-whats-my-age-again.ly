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
  \vspace #-1
}

\score {
  \new DrumStaff {
    \override Score.MetronomeMark.outside-staff-horizontal-padding = 1
    \tempo 4 = 157
    \set DrumStaff.instrumentName = #"Intro"
    \new DrumVoice = "hands" {
      \numericTimeSignature
      \voiceOne
      \drummode {
        \compressEmptyMeasures
        \override MultiMeasureRest.expand-limit = 1
        R1*3
        r2 r4. cymr8
        cymr4. \flam cymr4 cymr8 cymr \tuplet 3/2 { cymr16 cymr cymr }
        \flam cymr8 cymr cymr \flam cymr \flam cymr cymr cymr cymr
        \flam cymr4 cymr8 \flam cymr r \tuplet 3/2 { cymr16 cymr cymr } cymr8 cymr
        \flam cymr8 cymr cymr \flam cymr \flam cymr cymr cymr cymr
        cymr8 \tuplet 3/2 { cymr16 cymr cymr } cymr8 \flam cymr r cymr cymr cymr
        \flam cymr8 cymr cymr \flam cymr \flam cymr cymr cymr cymr
        cymr8 \tuplet 3/2 { cymr16 cymr cymr } cymr8 \flam cymr r cymr cymr cymr
        \flam cymr8 cymr cymr \flam cymr \flam cymr cymr cymr hho
      }
    }
  }
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
          \repeat volta 5 {
            \drummode {
              \alternative {
                \volta 1,2,3 {
                  hh8 hh <hh sn> hh hh hh <hh sn> hh
                }
                \volta 4 {
                  hho8 hho hho <cymc sn> hho hho hho hho
                }
                \volta 5 {
                  hho8 <cymc sn> hho hho hho sn16 sn toml toml tomfh tomfh
                }
              }
            }
          }
          \bar "|."
        }
        \new DrumVoice = "feet" {
          \voiceTwo
          \repeat volta 5 {
            \drummode {
              \alternative {
                \volta 1,2,3 {
                  bd8 bd s4 bd8 bd s4
                }
                \volta 4 {
                  bd4 bd s bd
                }
                \volta 5 {
                  bd4 bd
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
      \set DrumStaff.instrumentName = #"Chorus"
      <<
        \new DrumVoice = "hands" {
          \numericTimeSignature
          \voiceOne
          \bar ".|:-|"
          \repeat volta 4 {
            \drummode {
              cymc4 <cymc sn> cymc <cymc sn>
              \alternative {
                \volta 1,3 {
                  cymc4 <cymc sn> cymc8 <toml sn> s <sn tomfh>
                }
                \volta 2 {
                  cymc8 sn16 sn sn sn hho8 hho sn16 sn toml toml tomfh tomfh
                }
                \volta 4 {
                  <cymc sn>4 cymc8 sn cymc4 <cymc sn>
                  cymc8 sn <cymc sn> s <cymc sn> sn <cymc sn> s
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
              bd4. bd8[ bd] s4 bd8
              \alternative {
                \volta 1,3 {
                  bd4. bd8[ bd] s bd4
                }
                \volta 2 {
                  bd4. bd8[ bd8] s4.
                }
                \volta 4 {
                  s8 bd bd s4 bd4 bd8
                  bd4. bd2 bd8
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
      \set DrumStaff.instrumentName = #"Post-Chorus"
      <<
        \new DrumVoice = "hands" {
          \numericTimeSignature
          \voiceOne
          \bar ".|:-|"
          \drummode {
            <cymc cymch>1
            r2. r8 hho
          }
          \bar "|."
        }
        \new DrumVoice = "feet" {
          \voiceTwo
          \drummode {
            <bd hhp>4 hhp hhp hhp
            hhp4 hhp hhp hhp
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
  }
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
          \repeat volta 16 {
            \drummode {
              \alternative {
                \volta 1 {
                  <cymc cymch>4 cymr8 cymr cymr cymr cymr \tuplet 3/2 { cymr16 cymr cymr }
                }
                \volta 2,3 {
                  cymr8 cymr cymr cymr cymr cymr cymr \tuplet 3/2 { cymr16 cymr cymr }
                }
                \volta 4 {
                  cymr8 cymr cymr cymr cymr cymr <cymr ss> cymr
                }
                \volta 5,6,7 {
                  cymr8 cymr <cymr ss> cymr cymr cymr <cymr ss> cymr
                }
                \volta 8 {
                  cymr8 cymr <cymr ss> cymr cymr <cymr ss> <cymr ss> cymr
                }
                \volta 9,10,11,12,13,14,15 {
                  cymr8 cymr <cymr ss> cymr cymr cymr <cymr ss> cymr
                }
                \volta 16 {
                  cymr8 cymr <cymr ss> cymr cymr sn16 sn toml toml tomfh tomfh
                }
              }
            }
          }
          \bar "|."
        }
        \new DrumVoice = "feet" {
          \voiceTwo
          \repeat volta 16 {
            \drummode {
              \alternative {
                \volta 1 {
                  bd1
                }
                \volta 2,3 {
                  s1
                }
                \volta 4 {
                  s2. s8 bd
                }
                \volta 5,6,7 {
                  bd4 s2 s8 bd
                }
                \volta 8 {
                  bd4 s2 s8 bd
                }
                \volta 9,10,11,12,13,14,15 {
                  bd4. bd4 bd bd8
                }
                \volta 16 {
                  bd2 bd
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
    { "Chorus - 3 times (12 bars)" }
    \hspace #0
    { "Post-Chorus - first 1/4 note" }
    \hspace #0
  }
}
