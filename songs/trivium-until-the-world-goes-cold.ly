\version "2.24.4"
\include "definitions.ly"
\layout{
  \set DrumStaff.drumStyleTable = #(alist->hash-table custom-notes)
}
#(set-global-staff-size 18)
\paper {
  system-system-spacing.basic-distance = #10
  score-system-spacing.basic-distance = #10
  markup-system-spacing.basic-distance = #8
}
\header {
  title = "Trivium"
  subtitle = "Until The World Goes Cold"
  composer = "nedsi"
  tagline = #f
}
% Custom markup to create vertical space after header
\markup {
  \vspace #-1
}
\score {
  \layout{ ragged-right = ##f }
  \new DrumStaff {
    \override Score.MetronomeMark.outside-staff-horizontal-padding = 1
    \tempo 4 = 165
    \set DrumStaff.instrumentName = #"Intro"
    \new DrumVoice = "all" {
      <>^\markup \bold "8×"
      \numericTimeSignature
      \voiceOne
      \bar ".|:-|"
      \repeat volta 8 {
        \drummode {
          <toml tomfh>8 bd <toml tomfh> bd <cymch sn> bd <cymr bd> hho
          \alternative {
            \volta 1,2,3,4,5,6,7 {
              hhp8 r hhp r <cymc sn hhp>4 r
            }
            \volta 8 {
              hhp8 r hhp r \flam <sn hhp> sn sn sn
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
    \set DrumStaff.instrumentName = #"Bridge 1"
    \new DrumVoice = "all" {
      \numericTimeSignature
      \voiceOne
      \bar ".|:-|"
      \repeat volta 2 {
        \drummode {
          <cymc bd>8 bd <cymc bd> r <cymc sn> bd <cymc bd> r
          cymc8 bd16 bd <cymc bd>8 bd <cymc sn> bd
          \alternative {
            \volta 1 { <cymc bd> hho }
            \volta 2 { <cymr bd> hho }
          }
          <cymc bd hhp>8 bd <cymc bd> r <cymc sn> bd <cymc bd> r
          cymc8 bd16 bd <cymc bd>8 bd <cymc sn> bd
          \alternative {
            \volta 1 { <cymch sn> r }
            \volta 2 { <cymc sn> r }
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
    \set DrumStaff.instrumentName = #"Verse 1"
    \new DrumVoice = "all" {
      <>^\markup \bold "4×"
      \numericTimeSignature
      \voiceOne
      \bar ".|:-|"
      \repeat volta 4 {
        \drummode {
          <toml bd>8 <tomfh bd> <tomfh bd> bd <cymch sn> bd <cymr bd> hho
          \alternative {
            \volta 1,3 {
              hh8 r hh r <cymc sn> r hho r
            }
            \volta 2 {
              \tuplet 3/2 { hh8 r hh } hh8 hh <cymc sn> r hho r
            }
            \volta 4 {
              hh8 hh16 hh hh8 hh \flam sn sn sn sn
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
    \set DrumStaff.instrumentName = #"Pre-Chorus 1"
    \new DrumVoice = "all" {
      \numericTimeSignature
      \voiceOne
      \bar ".|:-|"
      \repeat volta 4 {
        \drummode {
          <cymc bd>8 bd <hho bd> bd <hho sn> bd
          \alternative {
            \volta 1 {
              <hho bd> bd
              <hho bd>8 bd <hho bd> bd <hho sn> bd <hho bd> sn
            }
            \volta 2 {
              <hho bd>8 bd
              hho8 sn hho bd <hho sn> bd <hho bd> sn16 sn
            }
            \volta 3 {
              <hho bd>8 bd
              hho8 sn hho bd <hho sn> bd <hho bd> sn
            }
            \volta 4 {
              <hho sn>8 bd
              <hho bd>8 sn hho bd \flam sn sn sn sn
            }
          }
        }
      }
      \bar ":|."
      \break
      \drummode {
        <cymc bd>8 bd <hh bd> bd <hh sn> bd <hh sn> bd
        <hh bd>8 sn hh bd <hh sn> bd <hh bd> sn16 sn
      }
      \bar ".|:-|"
      \repeat volta 2 {
        \drummode {
          <hh bd>8 bd <hh bd> bd <hh sn> bd <hh sn> bd
          <hh bd>8 sn hh bd <hh sn> bd <hh bd> bd
        }
      }
      \bar ":|."
      \drummode {
        \repeat unfold 8 { <sn tomfh bd>8 }
        <sn tomfh bd>8 q <sn bd>16 <toml bd> tomfh <tomfh bd> sn4 r
      }
      \bar "|."
    }
  }
}
\score {
  \layout{ ragged-right = ##f }
  \new DrumStaff {
    \set DrumStaff.instrumentName = #"Chorus 1"
    \new DrumVoice = "all" {
      \numericTimeSignature
      \voiceOne
      \bar ".|:-|"
      \repeat volta 2 {
        \drummode {
          <cymc bd>8 bd <cymc bd> bd <cymc sn> r <cymc bd> bd
          <cymc bd>8 bd cymc r <cymc sn> bd cymc r
          <cymc bd>8 r cymc r <cymc sn> r cymc bd
          <cymc bd>8 r <cymc bd> r <cymc sn> bd cymc r
          <cymc bd>8 r cymc r <cymc sn> r cymc bd
          <cymc bd>8 r <cymc bd> r <cymc sn> bd cymc r
          \alternative {
            \volta 1 {
              <cymc bd>8 r cymc r <cymc sn> r cymc bd
              <cymc bd>8 sn16 sn sn sn tomh toml sn sn sn sn toml toml tomfh
              tomfh
            }
            \volta 2 {
              \repeat unfold 4 { <sn tomfh bd>8 } <sn tomfh bd>2
              R1
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
    \set DrumStaff.instrumentName = #"Bridge 2"
    \new DrumVoice = "all" {
      \numericTimeSignature
      \voiceOne
      \bar ".|:-|"
      \repeat volta 2 {
        \drummode {
          <cymc bd>8 bd <cymc bd> r <cymc sn> bd <cymc bd> r
          cymc8 bd16 bd <cymc bd>8
          \alternative {
            \volta 1 { bd <cymc sn> bd <cymc bd> hho }
            \volta 2 { hhp <cymc sn> bd <cymr bd> hho }
          }
          <cymc bd hhp>8 bd <cymc bd> r <cymc sn> bd <cymc bd> r
          cymc8 bd16 bd <cymc bd>8 bd <cymc sn> bd
          \alternative {
            \volta 1 { <cymch sn> r }
            \volta 2 { <cymc sn> r }
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
    \set DrumStaff.instrumentName = #"Verse 2"
    \new DrumVoice = "all" {
      <>^\markup \bold "4×"
      \numericTimeSignature
      \voiceOne
      \bar ".|:-|"
      \repeat volta 4 {
        \drummode {
          <toml bd>8 <tomfh bd> <tomfh bd> bd <cymch sn> bd <cymr bd> hho
          \alternative {
            \volta 1 {
              hh8 hh hh hh <cymc sn> r hho r
            }
            \volta 2 {
              hh8 hh16 hh hh8 hh <cymc sn> r hho r
            }
            \volta 3 {
              hh8 r hh r <cymc sn> r hho r
            }
            \volta 4 {
              hh8 hh16 hh hh8 hho sn bd sn bd
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
    \set DrumStaff.instrumentName = #"Pre-Chorus 2"
    \new DrumVoice = "all" {
      \numericTimeSignature
      \voiceOne
      \bar ".|:-|"
      \repeat volta 4 {
        \drummode {
          <cymc bd>8 bd <hho bd> bd <hho sn> bd
          \alternative {
            \volta 1 {
              <hho bd> bd
              <hho bd>8 bd <hho bd> bd <hho sn> bd <hho bd> sn
            }
            \volta 2 {
              <hho bd>8 bd
              hho8 sn hho bd <hho sn> bd <hho bd> sn16 sn
            }
            \volta 3 {
              <hho bd>8 bd
              hho8 sn hho bd <hho sn> bd <hho bd> sn
            }
            \volta 4 {
              <hho sn>8 bd
              <hho bd>8 sn hho bd \flam sn sn sn sn
            }
          }
        }
      }
      \bar ":|."
      \break
      \drummode {
        <cymc bd>8 bd <hh bd> bd <hh sn> bd <hh sn> bd
        <hh bd>8 sn hh bd <hh sn> bd <hh bd> sn16 sn
        <hh bd>8 bd <hh bd> bd <hh sn> bd <hh sn> bd
        <hh bd>8 sn hh bd <hh sn> bd <hh bd> <cymc bd>
        <cymc bd>8 bd <hh bd> bd <hh sn> bd <hh sn> bd
        <hh bd>8 sn hh bd <hh sn> bd <hh bd> bd
        \repeat unfold 8 { <sn tomfh bd>8 }
        <sn tomfh bd>8 q <sn bd>16 <toml bd> tomfh <tomfh bd> sn4 r
      }
      \bar "|."
    }
  }
}
\score {
  \layout{ ragged-right = ##f }
  \new DrumStaff {
    \set DrumStaff.instrumentName = #"Chorus 2"
    \new DrumVoice = "all" {
      \numericTimeSignature
      \voiceOne
      \bar ".|:-|"
      \repeat volta 2 {
        \drummode {
          <cymc bd>8 bd <cymc bd> bd <cymc sn> r <cymc bd> bd
          <cymc bd>8 bd cymc r <cymc sn> bd cymc r
          <cymc bd>8 r cymc r <cymc sn> r cymc bd
          <cymc bd>8 r <cymc bd> r <cymc sn> bd cymc r
          <cymc bd>8 r cymc r <cymc sn> r cymc bd
          <cymc bd>8 r <cymc bd> r <cymc sn> bd cymc r
          <cymc bd>8 r cymc r <cymc sn> r cymc bd
          \alternative {
            \volta 1 {
              <cymc sn>8 bd <cymc sn> bd toml16 toml <tomfh bd> <tomfh bd>
              <cymch sn>8 bd
            }
            \volta 2 {
              <cymc bd>8 r <cymc bd> r sn16 sn bd bd toml toml <tomfh bd>
              tomfh
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
    \set DrumStaff.instrumentName = #"Interlude"
    \new DrumVoice = "all" {
      \numericTimeSignature
      \voiceOne
      \bar ".|:-|"
      \repeat volta 4 {
        \drummode {
          <cymc sn>8 bd cymr bd <cymc sn> bd cymr bd
          \alternative {
            \volta 1,2,3 {
              <cymc sn>8 bd cymr bd <cymch sn> bd <cymc sn> bd
            }
            \volta 4 {
              <cymc sn>8 bd cymr bd <cymch sn> bd tomh16 toml tomfh tomfh
            }
          }
        }
      }
      \bar ":|."
      <>^\markup \bold "3×"
      \repeat volta 3 {
        \drummode {
          <cymc sn>8 bd cymr bd <cymc sn> bd cymr bd
          <cymc sn>8 bd cymr bd <cymc sn> bd <cymc sn> bd
        }
      }
      \drummode {
        <cymc sn>8 bd <cymc bd> sn cymc bd <cymc sn> bd
        <cymc bd>8 sn cymc r sn16 sn bd bd toml toml <tomfh bd> <tomfh bd>
      }
      \bar "|."
    }
  }
}
\score {
  \layout{ ragged-right = ##f }
  \new DrumStaff {
    \set DrumStaff.instrumentName = #"Solo"
    \new DrumVoice = "all" {
      \numericTimeSignature
      \voiceOne
      \drummode {
        <cymc bd>8 bd bd r <cymc sn> bd bd r
        cymc8 bd16 bd bd8 bd <cymc sn> bd bd hho
        <cymc bd hhp>8 bd bd r <cymc sn> bd bd r
        cymc8 bd16 bd bd8 bd <cymc sn> bd <cymc sn> r
        <cymc bd>8 bd bd r <cymc sn> bd bd r
        cymc8 bd16 bd bd8 bd <cymc sn> bd <cymr bd> hho
        <cymc bd hhp>8 bd bd r <cymc sn> bd bd r
        cymc8 bd16 bd bd8 bd <cymc sn>16 sn bd bd toml toml tomfh tomfh
        \break
        <cymc bd>8 bd bd r <cymc sn bd> bd bd r
        cymch8 bd16 bd bd8 bd <cymc sn> bd bd hho
        <cymch bd hhp>8 bd bd r <cymc sn> bd bd r
        cymch8 bd16 bd bd8 bd <cymc sn> bd <cymc sn> r
        <cymc bd>8 bd bd r <cymc sn> bd bd r
        cymc8 bd16 bd bd8 bd <cymc sn> bd <cymr bd> hho
        <cymc bd hhp>8 bd bd r <cymc sn> bd bd r
        cymc8 bd16 bd bd8 bd \flam <sn cymc> sn sn sn
      }
      \bar ".|:-|"
      <>^\markup \bold "3×"
      \repeat volta 3 {
        \drummode {
          <cymc bd>16 bd bd bd <cymc bd> bd bd bd <cymc sn bd> r8.
          <cymc bd>16 bd bd bd
          <cymc bd>16 bd bd r cymc4 <cymc sn bd>16 bd bd r cymc4
        }
      }
      \bar ":|."
      \drummode {
        <cymc bd>16 bd bd bd <cymc bd> bd bd bd <cymc sn> r8.
        <cymc bd>16 bd bd bd
        <cymc bd>8 sn16 sn sn sn toml toml sn sn sn sn toml toml tomfh tomfh
      }
      \bar ".|:-|"
      <>^\markup \bold "6×"
      \repeat volta 6 {
        \drummode {
          <cymc bd>16 bd bd bd <cymc bd> bd bd bd <cymc sn bd> bd bd bd
          <cymc bd> bd bd bd
        }
      }
      \bar ":|."
      \drummode {
        <cymc sn>8 bd bd <cymc sn> bd bd <cymc sn> bd
        bd8 <cymc sn> bd bd sn16 sn <toml bd> <toml bd> toml toml <tomfh bd>
        <tomfh bd>
      }
      \bar "|."
    }
  }
}
\score {
  \layout{ ragged-right = ##f }
  \new DrumStaff {
    \set DrumStaff.instrumentName = #"Chorus 3"
    \new DrumVoice = "all" {
      \numericTimeSignature
      \voiceOne
      \drummode {
        <tomfh bd>8 r2. r8
        \compressEmptyMeasures
        \override MultiMeasureRest.expand-limit = 1
        R1*5
        <hho sn>8 <hho bd> r <hho bd> r <hho bd> <hho sn> <hho bd>
        r8 <hho bd> r <hho bd> sn16 sn toml toml <tomfh bd> tomfh tomfh tomfh
      }
      \bar ".|:-|"
      \repeat volta 2 {
        \drummode {
          <cymc bd>8 bd <cymc bd> bd <cymc sn> r <cymc bd> bd
          <cymc bd>8 bd cymc r <cymc sn> bd cymc r
          <cymc bd>8 r cymc r <cymc sn> r cymc bd
          <cymc bd>8 r <cymc bd> r <cymc sn> bd cymc r
          <cymc bd>8 r cymc r <cymc sn> r cymc bd
          <cymc bd>8 r <cymc bd> r <cymc sn> bd cymc r
          <cymc bd>8 r cymc r <cymc sn> r cymc bd
          \alternative {
            \volta 1 {
              <cymc bd>8 sn16 sn sn sn sn sn toml toml sn sn tomfh tomfh tomfh
              tomfh
            }
            \volta 2 {
              <cymc bd>8 r <cymc bd> r sn16 sn <toml bd> <toml bd> toml toml
              <tomfh bd> tomfh
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
    \set DrumStaff.instrumentName = #"Bridge 3"
    \new DrumVoice = "all" {
      \numericTimeSignature
      \voiceOne
      \bar ".|:-|"
      \repeat volta 4 {
        \drummode {
          <cymc sn>8 bd cymr bd <cymc sn> bd cymr bd
          \alternative {
            \volta 1,2,3 {
              <cymc sn>8 bd cymr bd <cymc sn> bd <cymc sn> bd
            }
            \volta 4 {
              <cymc sn>8 bd cymr bd <cymc sn> bd toml16 toml <tomfh bd> tomfh
            }
          }
        }
      }
      \bar ":|."
      \drummode {
        <cymc sn>8 bd cymr bd <cymc sn> bd cymr bd
        <cymc sn>8 bd cymr bd <cymc sn> bd <cymc sn> bd
        <cymc sn>8 bd cymr bd <cymc sn> bd cymr bd
        <cymc sn>8 bd cymr bd <cymc sn> bd16 cymc sn8 bd
        <cymc sn>8 bd cymr bd <cymc sn> bd cymr bd
        <cymc sn>8 bd cymr bd <cymc sn> bd <cymc sn> bd
        sn16 sn sn sn <toml bd> <toml bd> tomfh tomfh tomfh tomfh bd bd sn sn sn
        sn
        <toml bd>16 <toml bd> toml toml tomfh tomfh <tomfh bd> <tomfh bd> tomfh
        tomfh toml8 tomfh tomfh
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
      \numericTimeSignature
      \voiceOne
      \bar ".|:-|"
      \repeat volta 2 {
        \drummode {
          <cymc bd>8 bd bd r <cymc sn> bd bd r
          cymc8 bd16 bd bd8 bd <cymc sn> bd
          \alternative {
            \volta 1 { bd hho }
            \volta 2 { <cymr bd> hho }
          }
          <cymc bd hhp>8 bd bd r <cymc sn> bd bd r
          cymc8 bd16 bd <cymc bd>8 bd <cymch sn> bd <cymc sn> r
        }
      }
      \bar ":|."
      \drummode {
        <cymc tomfh bd>8 <tomfh bd> tomfh <tomfh bd> <cymc sn tomfh> <tomfh bd>
        <tomfh bd> tomfh
        cymc8 tomfh tomfh <tomfh bd> <cymc sn tomfh> <tomfh bd> <tomfh bd> hho
        <cymc tomfh bd hhp>8 <tomfh bd> tomfh <tomfh bd> <cymc sn tomfh>
        <tomfh bd> tomfh tomfh
        cymc8 tomfh tomfh bd <cymc sn> bd <cymc sn> r
        \break
        <cymc bd>8 bd bd r <cymc sn> bd bd r
        cymc8 bd16 bd bd8 bd <cymc sn> bd bd hho
        <cymc bd hhp>8 bd bd r <cymc sn> bd bd r
        cymc8 bd16 bd bd8 bd <cymc sn> bd <cymc sn> r
        <sn tomfh>8 q q r <tomfh bd> q q r
        R1
      }
      \bar "|."
    }
  }
}
