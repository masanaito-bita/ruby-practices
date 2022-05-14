# frozen_string_literal: true

shots = []
ARGV[0].split(',').each do |score|
  if score == 'X'
    shots << 10
    shots << 0
  else
    shots << score.to_i
  end
end

frames = []
shots.each_slice(2) do |score|
  frames << score
end

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
