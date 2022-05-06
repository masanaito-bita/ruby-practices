# frozen_string_literal: true

# @type [Integer]
max_number = 20

# @type [Integer] number
(1..max_number).each do |number|
  # @param [Integer] number
  def fizz_buzz(number)
    if (number % 3).zero? && (number % 5).zero?
      puts 'FizzBuzz'
    elsif (number % 3).zero?
      puts 'Fizz'
    elsif (number % 5).zero?
      puts 'Buzz'
    else
      puts number
    end
  end
  puts fizz_buzz(number)
end
