\version "2.24.3"
\include "definitions.ly"

\header {
  title = "Linkin Park"
  subtitle = "One Step Closer"
  composer = "nedsi"
}

% Custom markup to create vertical space
\markup {
  \vspace #2  % Adjust this value to set the amount of space you need
}

\layout{
  \set DrumStaff.drumStyleTable = #(alist->hash-table custom-notes)
}

"empty-4" = \drummode {
  \compressEmptyMeasures
  \override MultiMeasureRest.expand-limit = 1
    R1*4
}

silence = \drummode {
  r4*4
}

silence-half = \drummode {
  s2
}

hands-hh = \drummode {
  hh8[ hh] <hh sn>[ hh]
}

hands-hho-start = \drummode {
  cymc8[ hho] <hho sn>[ hho]
}

hands-hho = \drummode {
  hho8[ hho] <hho sn>[ hho]
}

hands-hh-verse = \drummode {
  cymc16[ hh hh hh] <hh sn>8 hh16 hho
  hh8[ hh] <hh sn>16 hh hh hho
}

"hands-hh-verse-2" = \drummode {
  cymc16[ hh hh hh] <hh sn>8 hh16 hho
  hh8[ hh] <hh sn>16[ s hh hho]
}

hands-hh-verse-fill = \drummode {
  hh16[ hh hh hh] <hh sn>8 hh16 hho
  hho8[ hho] <hho sn>16 tomh32 tomh sn16 sn
}

hands-hho-verse = \drummode {
  hho8[ hho] <hho sn>8 hho16 hho
}

hands-hho-verse-fill = \drummode {
  hho16[ hho hho8] <hho sn>8 hho16 hho
}

"hands-fill-1" = \drummode {
  hho8[ hho] <hho sn>16 tomh32 tomh sn16 sn
}

"hands-fill-2" = \drummode {
  hho8[ hho] <hho sn>16 sn32 sn sn16 sn
}

"hands-c1" = \drummode {
  cymc8[ hho] <hho sn>[ hho] hho8[ hho] <hho sn>[ hho]
}

"hands-c2" = \drummode {
  cymc8[ hho] <hho sn>[ hho] cymc8[ hho] <hho sn>[ hho]
}

"hands-c2-ch" = \drummode {
  cymch8 cymch <cymch sn> cymch cymch cymch <cymch sn> \parenthesize cymch
}

"hands-p-c2" = \drummode {
  r4 sn16 sn sn sn
}

"feet-2" = \drummode {
  bd8[ bd] s4
}

"feet-2-verse" = \drummode {
  <bd hhp>8[ bd] s4
}

"feet-3" = \drummode {
  bd8[ bd] s16 bd8 s16
}

"feet-3-verse" = \drummode {
  <bd hhp>8[ bd] s16 bd8 s16
}

"feet-c2" = \drummode {
  bd8[ bd] s bd[ bd bd] s bd
}

feet-oneshot = \drummode {
  <bd hhp>4 r2.
}

feet-verse-fill = \drummode {
  <bd hhp>4 s16 bd8 s16
}

\score {
    \new DrumStaff {
      \set DrumStaff.instrumentName = #"Guitar: 4"
      \new DrumVoice = "hands" { \numericTimeSignature \voiceOne \"empty-4" }
    }
}

\score {
  <<
    \new DrumStaff {
      \set DrumStaff.instrumentName = #"Intro: 4"
      <<
        \new DrumVoice = "hands" {
          \numericTimeSignature
          \voiceOne
          \bar ".|:-|"
          ^\markup \bold "3×"
          \hands-hho-start
          \hands-hho
          \bar ":|."
          \hands-hho
          \"hands-fill-1"
          \bar "|."
        }
        \new DrumVoice = "feet" {
          \voiceTwo
          \repeat unfold 3 {
            \"feet-3"
          }
          \"feet-2"
        }
      >>
    }
  >>
}

\score {
  <<
    \new DrumStaff {
      \set DrumStaff.instrumentName = #"Verse1-1: 2+2"
      \set DrumStaff.drumStyleTable = #(alist->hash-table custom-notes)
      <<
        \new DrumVoice = "hands" {
          \numericTimeSignature
          \voiceOne
          \bar ".|:-|"
          ^\markup \bold "3×"
          \hands-hh-verse
          \bar ":|."
          \hands-hh-verse-fill
          \bar "|."
        }
        \new DrumVoice = "feet" {
          \voiceTwo
          \"feet-3-verse"
          \"feet-2-verse"
          \feet-verse-fill
          \"feet-2"
        }
      >>
    }
  >>
}

\score {
  <<
    \new DrumStaff {
      \set DrumStaff.instrumentName = #"Verse1-2: 4"
      <<
        \new DrumVoice = "hands" {
          \numericTimeSignature
          \voiceOne
          \bar ".|:-|"
          ^\markup \bold "3×"
          \hands-hho-start
          \hands-hho-verse
          \bar ":|."
          \repeat unfold 2 {
            \hands-hho-verse-fill
          }
        }
        \new DrumVoice = "feet" {
          \voiceTwo
          \repeat unfold 4 {
            \"feet-3"
          }
          \feet-oneshot
          \bar "|."
        }
      >>
    }
  >>
}

\score {
  <<
    \new DrumStaff {
      \set DrumStaff.instrumentName = #"Pre-chorus1"
      \set DrumStaff.drumStyleTable = #(alist->hash-table custom-notes)
        \new DrumVoice = "hands" {
          \numericTimeSignature
          \time 2/4
          \voiceOne
          \silence-half
          \bar "|."
        }
    }
  >>
}

\score {
  <<
    \new DrumStaff {
      \set DrumStaff.instrumentName = #"Chorus1: 4*1"
      <<
        \new DrumVoice = "hands" {
          \numericTimeSignature
          \voiceOne
          \bar ".|:-|"
          ^\markup \bold "3×"
          \"hands-c1"
          \bar ":|."
          \hands-hho-start
          \"hands-fill-1"
          \bar "|."
        }
        \new DrumVoice = "feet" {
          \voiceTwo
          \repeat unfold 3 {
            \"feet-3"
          }
          \"feet-2"
        }
      >>
    }
  >>
}

\score {
  <<
    \new DrumStaff {
      \set DrumStaff.instrumentName = #"Verse2-1: 2+2"
      \set DrumStaff.drumStyleTable = #(alist->hash-table custom-notes)
      <<
        \new DrumVoice = "hands" {
          \numericTimeSignature
          \voiceOne
          \bar ".|:-|"
          ^\markup \bold "3×"
          \"hands-hh-verse-2"
          \bar ":|."
          \hands-hh-verse-fill
          \bar "|."
        }
        \new DrumVoice = "feet" {
          \voiceTwo
          \"feet-3-verse"
          \"feet-2-verse"
          \feet-verse-fill
          \"feet-2"
        }
      >>
    }
  >>
}

\score {
  <<
    \new DrumStaff {
      \set DrumStaff.instrumentName = #"Verse1-2: 4"
      <<
        \new DrumVoice = "hands" {
          \numericTimeSignature
          \voiceOne
          \bar ".|:-|"
          ^\markup \bold "3×"
          \hands-hho-start
          \hands-hho-verse
          \bar ":|."
          \repeat unfold 2 {
            \hands-hho-verse-fill
          }
        }
        \new DrumVoice = "feet" {
          \voiceTwo
          \repeat unfold 4 {
            \"feet-3"
          }
          \feet-oneshot
          \bar "|."
        }
      >>
    }
  >>
}

\score {
  <<
    \new DrumStaff {
      \set DrumStaff.instrumentName = #"Pre-chorus2"
      \set DrumStaff.drumStyleTable = #(alist->hash-table custom-notes)
        \new DrumVoice = "hands" {
          \numericTimeSignature
          \time 2/4
          \voiceOne
          \"hands-p-c2"
          \bar "|."
        }
    }
  >>
}

\score {
  <<
    \new DrumStaff {
      \set DrumStaff.instrumentName = #"Chorus2: 8*1"
      <<
        \new DrumVoice = "hands" {
          \numericTimeSignature
          \voiceOne
          \bar ".|:-|"
          ^\markup \bold "8×"
          \"hands-c2"
          \bar ":|."
          ^\markup \bold "bar 4"
          \hands-hho-start
          \"hands-fill-2"
          \break
          \"hands-c2-ch"
          \"empty-4"
          \bar "|."
        }
        \new DrumVoice = "feet" {
          \voiceTwo
          \repeat unfold 3 {
            \"feet-3"
          }
          \"feet-2"
          \"feet-c2"
        }
      >>
    }
  >>
}

%TODO: continue here
\score {
  <<
    \new DrumStaff {
      \set DrumStaff.instrumentName = #"Bridge: 8*1"
      <<
        \new DrumVoice = "hands" {
          \numericTimeSignature
          \voiceOne
          \bar ".|:-|"
          ^\markup \bold "8×"
          \"hands-c2"
          \bar ":|."
          ^\markup \bold "bar 4"
          \hands-hho-start
          \"hands-fill-2"
          \break
          \"hands-c2-ch"
          \"empty-4"
          \bar "|."
        }
        \new DrumVoice = "feet" {
          \voiceTwo
          \repeat unfold 3 {
            \"feet-3"
          }
          \"feet-2"
          \"feet-c2"
        }
      >>
    }
  >>
}
