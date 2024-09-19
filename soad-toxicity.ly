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
  \vspace #0
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
%  \layout{ ragged-right = ##f }
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
                \volta 1,2,4 { cymc8  sn16 sn8 sn 
                  \alternative {
                    \volta 1 { sn16[ tomh tomh sn toml toml] sn32[ sn sn sn sn16 tomh tomh toml] }
                    \volta 2 { tomh16[ sn sn toml toml toml] sn[ sn toml tomfh tomfh tomfh] }
                    \volta 4 { sn16[ tomh sn sn tomh tomh] sn[ sn toml tomfh tomfh tomfh]} 
                    }
                  }
                \volta 3 { cymc16 tomh tomh tomh toml toml sn sn toml toml tomfh tomfh 
                           cymc toml tomh tomh tomh tomh sn sn toml toml tomfh tomfh
                }
              }
            }
          }
          \bar ":|."
          \repeat volta 4 {
            \drummode {
              cymc8 hho16 sn hho8 < hho sn > hho16 sn hho8
              \alternative {
                \volta 1,2,3 { cymc hho16 sn hho8 hho hho hho }
                \volta 4 { cymc8 sn16 sn hho8 <hho sn> sn16 toml toml toml }
              }
            }
          }
          \bar "|."
        }
%        \new DrumVoice = "feet" {
%          \voiceTwo
%          \repeat volta 4 {
%            \drummode {
%              \alternative {
%                \volta 1,2,4 { bd8 s16 bd8 bd bd bd }
%                \volta 3 { bd4 bd bd bd }
%              }
%            }
%          }
%          \repeat volta 4 {
%            \drummode {
%              bd8 s bd s4 bd8 bd s bd
%              \alternative {
%                \volta 1,2,3 { s8 bd s }
%                \volta 4 { s4. }
%              }
%            }
%          }
%        }
      >>
    }
  >>
}
