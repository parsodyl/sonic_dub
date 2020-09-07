feedBack = 1
inputVol = 1

live_loop :clk do
  sleep 8
end

live_loop :skank, sync: :clk do
  dub_echo 0.25, feedBack, 0.125 do
    dub_echo 0.75, 4, 0.25 do
      with_fx :level, amp: inputVol do
        use_synth :pluck
        4.times do
          sleep 0.5
          play_chord chord(:e4, :minor), amp: rrand(1.9, 2.1), release: rrand(0.24, 0.26)
          sleep 0.5
        end
        4.times do
          sleep 0.5
          play_chord chord(:b3, :minor), amp: rrand(1.9, 2.1), release: rrand(0.24, 0.26)
          sleep 0.5
        end
      end
    end
  end
end

live_loop :beat, sync: :clk do
  sample :bd_klub, amp: 0.65
  sample :bd_tek, amp: 0.65
  sleep 0.5
end

live_loop :hh, sync: :clk do
  with_fx :level, amp: 0.2 do
    with_fx :reverb, room: 1, mix: 0.4 do
      sleep 0.25
      sample :drum_cymbal_closed, amp: rrand(0.32, 0.36), release: rrand(0.35, 0.75)
      sleep 0.25
    end
  end
end

live_loop :bass, sync: :clk do
  use_synth :square
  with_fx :level, amp: 0.4 do
    2.times do
      play :e2, amp: rrand(1.5,2), cutoff: 50, release: 0.85
      sleep 0.5
      play :e2, amp: rrand(1.5,2), cutoff: 50, release: 0.85
      sleep 0.5
      play :e2, amp: rrand(1.5,2), cutoff: 50, release: 0.85
      sleep 0.5
      play :e2, amp: rrand(1.5,2), cutoff: 50, release: 0.35
      sleep 0.25
      play :e2, amp: rrand(1.5,2), cutoff: 50, release: 0.35
      sleep 0.25
    end
    2.times do
      play :b1, amp: rrand(1.5,2), cutoff: 50, release: 0.85
      sleep 0.5
      play :b1, amp: rrand(1.5,2), cutoff: 50, release: 0.85
      sleep 0.5
      play :b1, amp: rrand(1.5,2), cutoff: 50, release: 0.85
      sleep 0.5
      play :b1, amp: rrand(1.5,2), cutoff: 50, release: 0.35
      sleep 0.25
      play :b1, amp: rrand(1.5,2), cutoff: 50, release: 0.35
      sleep 0.25
    end
  end
end

live_loop :melody, sync: :clk do
  stop
  use_synth_defaults amp: 0.4
  with_synth :piano do
    with_fx :reverb, amp: 0.85 do
      with_fx :slicer, phase: 0.75, wave: 3, mix: 0.75 do
        with_fx :echo, phase: 0.250, decay: 3, max_phase: 4, mix: 0.5 do
          play_pattern_timed (scale :e4, :aeolian), [0.5], amp: 1.5, pan: -0.4
          play_pattern_timed (scale :b4, :aeolian), [0.5], amp: 1.5, pan: +0.4
        end
      end
    end
  end
end
