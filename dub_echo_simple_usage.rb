loop do
  dub_echo 0.75, 4, 0.35 do
    use_synth :pluck
    4.times do
      sleep 0.5
      play_chord chord(:e4, :minor), amp: rrand(1.9, 2.1), release: rrand(0.24, 0.26)
      sleep 0.5
      play :e5, amp: 2, release: 0.05
    end
    4.times do
      sleep 0.5
      play_chord chord(:b3, :minor), amp: rrand(1.9, 2.1), release: rrand(0.24, 0.26)
      sleep 0.5
      play :b4, amp: 2, release: 0.05
    end
  end
end
