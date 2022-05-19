# frozen_string_literal: true

shots = ARGV[0].split(",").flat_map do |score|
  score == "X" ? [10, 0] : score.to_i
end

frames = shots.each_slice(2).to_a

point = 0
frames.each_with_index do |frame, i|
  point += frame.sum
  next unless frame.sum == 10 && i < 9

  next_frame = frames[i + 1]
  after_next_frame = frames[i + 2]
  if frame[0] == 10
    point += next_frame[0] == 10 ? next_frame[0] + after_next_frame[0] : next_frame.sum
  else
    point += next_frame[0]
  end
end

puts point
