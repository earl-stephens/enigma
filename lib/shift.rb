module Shift

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

  def message_to_downcase(message)
    message.downcase
  end

  def letter_in_alphabet?(letter)
    @alphabet.include?(letter)
  end

  def increment_counter(counter)
    if @counter == 3
      @counter = 0
    else
      @counter += 1
    end
    counter
  end
  
end
