require 'pry'
class Shift
  attr_reader :shift_pattern,
              :alphabet,
              :shifted_message

  def initialize
    @shift_pattern = []
    @shifted_message = ""
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

  def letter_in_alphabet?(letter)
    @alphabet.include?(letter)
  end

  def shift_letters(message)
    counter = 0
    message.each_char do |character|
      if letter_in_alphabet?(character) == true
        placeholder = @alphabet.index(character)
        rotated_alphabet = @alphabet.rotate(@shift_pattern[counter])
        @shifted_message.concat(rotated_alphabet[placeholder])
          if counter == 3
            counter = 0
          else counter += 1
          end
      else
        @shifted_message.concat(character)
      end
      @shifted_message
    end
  end

  def shift_letters_backwards(message)
    counter = 0
    message.each_char do |character|
      placeholder = @alphabet.index(character)
      backwards_shift = @shift_pattern[counter] * -1
      rotated_alphabet = @alphabet.rotate(backwards_shift)
      @shifted_message.concat(rotated_alphabet[placeholder])
      if counter == 3
        counter = 0
      else counter += 1
      end
    end
    @shifted_message
  end


end
