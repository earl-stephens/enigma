require 'pry'
class Shift
  attr_reader :shift_pattern,
              :alphabet

  def initialize
    @shift_pattern = []
  end

  # def create_shift_pattern_hash
  #   @shift_pattern = Hash.new
  #   letter_array = ("a".."d").to_a
  #   letter_array.each do |letter|
  #     @shift_pattern[letter.to_sym] = 0
  #   end
  #   @shift_pattern
  # end

  def create_shift_pattern(keys, offsets)
    counter = 0
    keys.each do |key, number|
      temp_number = number.to_i + offsets[counter]
      @shift_pattern[key] = temp_number
      counter += 1
    end
    @shift_pattern
  end

  def create_alphabet
    @alphabet = ("a".."z").to_a << " "
  end

end
