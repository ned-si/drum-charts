\version "2.24.3"

\header {
  title = "Best Of You"
}

intro = {
  \compressFullBarRests R1 R1*21 R1*4
}

intro_one = \drummode {
  <<
    {
      << cymc4. sn4. >> sn4. sn4 |
      sn4. sn4. sn4 |
    } \\
    {
      r8 << toml8 bd8 >> << toml8 bd8 >> toml8 << toml8 bd8 >><< toml8 bd8 >> toml << toml8 bd8 >> |
      toml8 << toml8 bd8 >> << toml8 bd8 >> toml8 << toml8 bd8 >><< toml8 bd8 >> toml << toml8 bd8 >> |
    }
  >>
}

intro_two = \drummode {
  <<
    {
      << cymc4. sn4. >> sn4. sn4 |
      sn4. sn4. sn16 sn cymc8 |
    } \\
    {
      r8 << toml8 bd8 >> << toml8 bd8 >> toml8 << toml8 bd8 >><< toml8 bd8 >> toml << toml8 bd8 >> |
      toml8 << toml8 bd8 >> << toml8 bd8 >> toml8 << toml8 bd8 >><< toml8 bd8 >> toml << toml8 bd8 >> |
    }
  >>
}

verse = \repeat volta 2 {
    \set countPercentRepeats = ##t
    \repeat percent 3 \intro_one
    \intro_two
    \intro_one
    \intro_two
  }

chorus_one = \drummode {
  <<
    {
      << cymc4 sn4 >> sn sn sn |
    } \\
    {
      r8 << toml8 bd8 >> \repeat unfold 3 { toml8 << toml8 bd8 >> } |
    }
  >>
}

chorus_two = \drummode {
  <<
    {
      << cymc4 sn4 >> sn sn sn16 sn cymc8 |
    } \\
    {
      r8 << toml8 bd8 >> \repeat unfold 3 { toml8 << toml8 bd8 >> } |
    }
  >>
}

chorus_three = \drummode {
  <<
    {
      << cymc4 sn4 >> sn << cymc sn >> sn |
    } \\
    {
      r8 << toml8 bd8 >> toml8 << toml8 bd8 >>  r8 << toml8 bd8 >> toml8 << toml8 bd8 >>  |
    }
  >>
}

chorus_break = \drummode {
  <<cymc4 sn4>> \repeat unfold 12 sn16
}

chorus_one = {
  \repeat volta 2 {
    \repeat percent 3 \chorus_one
    \chorus_two
  }
  \break
  \repeat percent 7 \chorus_three
  \chorus_break
}

post_chorus_beat = \drummode {
  <<
    { cymc8 cymr cymr cymr }
    \\
    { bd8. sn16 bd8 sn }
  >>
}

post_chorus_break_one = \drummode {
  <<
    { cymr cymr s4 }
    \\
    { r8 bd8 tomml16 tomml toml toml }
  >>
}

post_chorus_break_two = \drummode {
  sn16 sn tommh tommh tomml tomml toml toml
}

post_chorus_break_three = \drummode {
  sn16 sn sn sn tomml tomml toml toml
}

post_chorus_break_four = \drummode {
  \repeat unfold 8 sn16
}


post_chorus = {
  \post_chorus_beat
  \post_chorus_break_one |
  \post_chorus_beat
  \post_chorus_break_two |
  \repeat volta 2 {
    \post_chorus_beat
    \post_chorus_break_one |
    \post_chorus_beat
    \post_chorus_break_three |
  }
  \post_chorus_beat
  \post_chorus_break_one |
  \post_chorus_beat
  \post_chorus_break_four |
}

verse_two_beat = \drummode {
  <<
    { cymc8-> \repeat unfold 7 cymc8 | }
    \\
    { bd8. sn16 bd8 sn8 r16 sn16 bd8 sn8 bd16 sn16 | }
  >>
}

verse_two = {
  \repeat percent 3 \verse_two_beat

  \drummode {
    <<
      { cymc8 cymc cymc cymc r4 r16 cymc8.-> | }
      \\
      { bd8. sn16 bd8 sn8 bd8 bd sn16 bd8. | }
    >>
  }
  \verse_two_beat

  \drummode {
    <<
      { cymc8 cymc cymc cymc r4 r16 cymc8.-> | }
      \\
      { bd8. sn16 bd8 sn8 \repeat unfold 4 sn16 sn16 bd8. | }
    >>
  }
  \verse_two_beat

  \drummode {
    <<
      { cymc4-> r2. | }
      \\
      { << bd8 sn8 >> \repeat unfold 14 sn16 | }
    >>
  }
}

chorus_two_beat_one = \drummode {
  <<
    { cymc8-> cymc8 cymc8 cymc8 cymc8-> cymc8 cymc8 cymc8 | }
    \\
    { bd4 bd8 bd << sn4 bd4 >> bd8 bd | }
  >>
}

chorus_two_beat_two = \drummode {
  <<
    { cymc8-> \repeat unfold 7 cymc8 | }
    \\
    { sn4 bd8 bd sn4 bd8 bd | }
  >>
}

crescendo_break = \drummode {
  <<
    { \repeat unfold 6 cymc8 cymc8-> cymc8-> | }
    \\
    { bd8\< \repeat unfold 6 bd bd\!| }
  >>
}

chorus_two = {
  \repeat percent 7 \chorus_two_beat_one
  
  \drummode {
    bd8 \repeat unfold 6 << sn toml bd>> bd8 |
  }
  \break
  \chorus_two_beat_one
  
  \repeat percent 3 \chorus_two_beat_two
  
  \repeat percent 2 \chorus_two_beat_one
  \chorus_two_beat_two
  \crescendo_break
  \drummode { << cymc4-> bd >> r4 r2 }
  \compressFullBarRests R1*6
  
  \drummode {
    r2 r4 r8 toml16 toml
  }
}

bridge_beat = \drummode {
  <<
    { cymc8 }
    \\
    { \repeat unfold 8 toml8 | }
  >>
}

bridge = {
  \bridge_beat
  
  \drummode {
    \stemDown
    toml8 toml toml toml sn16 sn8 tomml16 tomml8 toml16 toml
  }

  \drummode {
    <<
      { cymc8 }
      \\
      { \repeat unfold 5 toml8 \repeat unfold 3 { \acciaccatura toml16 toml8 } | }
    >>
  }

  \drummode {
    toml8 toml sn16 sn8 \repeat unfold 5 tomml16 \repeat unfold 4 toml16 |
  }

  \bridge_beat
  
  \drummode {
    toml8 toml \repeat unfold 4 sn16 \repeat unfold 4 tomml16 \repeat unfold 4 toml16 |
  }

  \drummode {
    <<
      { cymc8 }
      \\
      { \repeat unfold 4 toml8 sn16 sn tomml tomml toml toml bd bd | << toml4 bd >> r4 r2 }
    >>
  }
}

chorus_three_beat = \drummode {
  <<
    { cymc4-> cymc cymc cymc }
    \\
    { \repeat unfold 4 { sn8 bd } }
  >>
}

chorus_three_break = \drummode {
  <<
    { cymc4 cymc cymc r8 cymc8-> }
    \\
    { \repeat unfold 3 { sn8 bd } sn16 sn bd8 }
  >>
}

chorus_three = {
  \repeat percent 3 \chorus_three_beat
  \chorus_three_break
  \repeat percent 3 \chorus_three_beat

  \drummode {
    <<
      { cymc4 cymc cymc cymc4-> }
      \\
      { \repeat unfold 2 { sn8 bd } sn8 sn16 sn bd sn sn8 }
    >>
  }

  \repeat percent 3 \chorus_three_beat
  \chorus_three_break
  \repeat percent 3 \chorus_three_beat
  \crescendo_break
}

outro_break_begin = \drummode {
  <<
    { cymc4-> r8 cymc8-> }
    \\
    { bd8. sn16 sn8 bd }
  >>
}

outro = {
  \outro_break_begin
  \drummode { r16 sn sn sn tomml tomml toml toml | }
  \outro_break_begin
  \drummode { r8 sn16 sn toml toml toml sn | }
  \outro_break_begin
  \drummode { sn sn sn sn sn8 toml16 toml | }
  \outro_break_begin
  \drummode { sn8 toml16 toml toml8 sn | }
  \outro_break_begin
  \drummode { \repeat unfold 8 sn16 | }
  \outro_break_begin
  \drummode { sn8 sn16 sn r16 toml8 sn16 | }
  \outro_break_begin
  \drummode { \tuplet 3/2 \repeat unfold 6 sn8 | }
  \outro_break_begin
  r2
}

\new DrumStaff {
  \mark "Intro"
  \intro
  \mark "Verse 1"
  \verse
  \break
  \mark "Chorus 1"
  \chorus_one
  \break
  \mark "Post Chorus"
  \post_chorus
  \mark "Verse 2"
  \verse_two
  \break
  \mark "Chorus 2"
  \chorus_two
  \break
  \mark "Bridge"
  \bridge
  \break
  \mark "Chorus 3"
  \chorus_three
  \break
  \mark "Outro"
  \outro
  \bar "|."
}
