require 'pry'
class Shift
  attr_reader :shift_pattern,
              :alphabet

  def initialize
    @shift_pattern = []
  end

  def create_shift_pattern(keys, offsets)
    temp_array = keys.zip(offsets)
    temp_array.each do |element|
      @shift_pattern << element[0] + element[1]
    end
    @shift_pattern
  end

  def create_alphabet
    @alphabet = ("a".."z").to_a << " "
  end

end
