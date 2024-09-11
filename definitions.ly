\version "2.24.3"

% Drum notations customized

#(define custom-notes '(
  (bassdrum         default          #f  -3)
  (acousticbassdrum default          #f  -6)
  (pedalhihat       cross            #f  -5)
  (closedhihat      xcircle          #f  -5)
  (snare            default          #f   1)
  (sidestick        cross            #f   1)
  (hightom          default          #f   3)
  (lowtom           default          #f   2)
  (highfloortom     default          #f  -1)
  (lowfloortom      default          #f  -2)
  (hihat            cross            #f   5)
  (openhihat        xcircle          #f   5)
  (ridecymbal       cross            #f   6)
  (ridebell         harmonic-black   #f   6)
  (crashcymbal      cross            #f   7)
  (chinesecymbal    xcircle          #f   8)
  (cowbell          harmonic-black   #f   4)
))


allheads = \drummode {
  \stemUp
  sn4
  \override NoteHead.style = #'cross sn4
  \override NoteHead.style = #'xcircle sn4
  \override NoteHead.style = #'harmonic-black sn4
}

defnote = \drummode {
  bd4^\markup { \translate #'(0 . 4) "feet"} bda hhp hhc |
  sn^\markup { \translate #'(0 . 4) "snare"} \parenthesize sn ss s |
  tomh^\markup { \translate #'(0 . 4) "toms"} toml tomfh tomfl |
  hh^\markup { \translate #'(0 . 4) "hihat"} s hho s |
  cymr^\markup { \translate #'(0 . 4) "ride"} s rb s |
  cymc^\markup { \translate #'(0 . 4) "cymbals"} \parenthesize cymc cymch s |
  cb^\markup { \translate #'(0 . 4) "cowbell"} |
}

defname = \lyricmode {
  bd bda hhp hhc |
  sn sn ss |
  tomh toml tomfh tomfl |
  hh hho |
  cymr rb |
  cymc cymc cymch |
  cb |
}


%% function to add an accent
%% usage sn^\act
act = \markup { \left-align \musicglyph "scripts.sforzato" }

%% function to add right or left (open or filled circle) below notes
%% usage sn_\left
left = \markup {\center-column {\draw-circle #0.5 #0.1 ##t }}
right= \markup {\center-column {\draw-circle #0.5 #0.1 ##f }}

%% function to add a ghost note
%% usage \ghost sn
ghost = #(define-music-function
          (note)
          (ly:music?)
          #{
          \parenthesize \tweak font-size -4 #note
          #})

%% Function to add a single Percent
%% usage \makePercent note
makePercent =
#(define-music-function
  (note) (ly:music?)
  "Make a percent repeat the same length as NOTE."
  (make-music 'PercentEvent
   'length (ly:music-length note)))


%% Function that display Percent with repeat
%% usage  \makePercentRepeat "     x2" s1
makePercentRepeat =
#(define-music-function
  (txt note) (string? ly:music?)
  "Make a percent repeat the same length as NOTE."
  #{
  \mark \markup { #txt }
  \makePercent #note
  #}
)
% ======= Swing ======================================
swing = \mark \markup {
  \line \general-align #Y #DOWN { \score {
  \new Staff \with {
    fontSize = #-2
    \override StaffSymbol.line-count = #0
    \override VerticalAxisGroup.Y-extent = #'(0 . 0)
  }
  \relative {
    \stemUp
    \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 3 16)
    \override Beam.positions = #'(2.5 . 2.5)
    b'8[ b8]
  }
  \layout {
    ragged-right= ##t
    indent = 0
    \context {
    \Staff \remove "Clef_engraver"
    \remove "Time_signature_engraver" }
  }} " ="
  \score { \new Staff \with {
    fontSize = #-2
    \override StaffSymbol.line-count = #0
    \override VerticalAxisGroup.Y-extent = #'(0 . 0)
  }
  \relative {
    \stemUp
    \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 3 16)
    \override Beam.positions = #'(2.5 . 2.5)
    \times 2/3 { b'8[ r b8] }
  }
  \layout {
    ragged-right= ##t
    indent = 0
    \context {
      \Staff
      \remove "Clef_engraver"
      \remove "Time_signature_engraver" }
    }}
  \fontsize #-2
  \italic { "  swing" }
  }
}
%% ***************************************************************************
