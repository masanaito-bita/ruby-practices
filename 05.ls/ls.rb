#!/usr/bin/env ruby
# frozen_string_literal: true

def main()
  files = Dir.glob("*").sort
  show_files(files).each do |display|
    puts display.join("    ")
  end
end

def show_files(files)
  files_number = files.size
  if (files_number % 3) == 0
    slice_number = files_number / 3
  else
    slice_number = files_number / 3 + 1
  end

  sliced_array = files.each_slice(slice_number).to_a
  third_array = sliced_array.last
  if third_array.size < slice_number
    (slice_number - third_array.size).times do
      third_array << ""
    end
  end

  array_with_blank = sliced_array.map do |str_array|
    max_string = str_array.max_by(&:size).size
    str_array.map do |str|
      str + (" " * (max_string - str.size))
    end
  end

  array_with_blank.transpose
end

main()
