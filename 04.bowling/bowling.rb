# frozen_string_literal: true

shots = ARGV[0].split(",").flat_map do |score|
  score == "X" ? [10, 0] : score.to_i
end

frames = shots.each_slice(2).to_a

point = 0
frames.each_with_index do |frame, i|
  point += frame.sum
  next unless frame.sum == 10 && i < 9

  if frame[0] == 10
    point += frames[i + 1][0] == 10 ? frames[i + 1][0] + frames[i + 2][0] : frames[i + 1].sum
  else
    point += frames[i + 1][0]
  end
end

puts point
