# frozen_string_literal: true

shots = ARGV[0].split(",").flat_map do |score|
  score == "X" ? [10, 0] : score.to_i
end

frames = shots.each_slice(2).to_a

point = frames.each_with_index.sum do |frame, i|
  next frame.sum unless frame.sum == 10 && i < 9

  next_frame = frames[i + 1]
  after_next_frame = frames[i + 2]
  if frame[0] == 10
    next_frame[0] == 10 ? frame.sum + next_frame[0] + after_next_frame[0] : frame.sum + next_frame.sum
  else
    frame.sum + next_frame[0]
  end
end

puts point
