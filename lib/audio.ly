\version "2.24.0"

% Include before a song: its scores are collected instead of engraved, and
% \audioScore turns them into one MIDI score, in written order, with every
% repeat unfolded. The Makefile writes the wrapper that does both.

#(define drum-chart-music '())
#(define drum-chart-score-handler (ly:parser-lookup 'toplevel-score-handler))
#(ly:parser-define! 'toplevel-score-handler
   (lambda (score)
     (set! drum-chart-music (cons (ly:score-music score) drum-chart-music))))

audioScore =
#(define-void-function () ()
   (let ((music (make-sequential-music (reverse drum-chart-music))))
     (drum-chart-score-handler
      #{ \score { \unfoldRepeats $music \midi { } } #})))
