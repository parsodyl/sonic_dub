define :dub_echo do |fb, decay, mix, &block|
  
  dry = 1 - mix
  wet = mix
  
  in_thread do
    with_fx :level, amp: dry do
      block.call
    end
  end
  
  with_fx :level, amp: wet do
    with_fx :reverb, amp: 2, room: 0.7 do
      with_fx :echo, phase: fb, max_phase: 4, decay: decay, mix: 0.3 do |e|
        with_fx :flanger, phase: 5, phase_offset: 0, depth: 10, decay: decay, wave: 3, mix_slide: fb, mix: 0 do |f|
          with_fx :rlpf, cutoff: 90, res: 0.25, mix: 0.9 do |c|
            control f, mix: 0.4
            block.call(c)
          end
        end
      end
    end
  end
  
end
