require './lib/shift'

class Decryption
  include Shift
  attr_reader :shift_pattern,
              :shifted_message,
              :counter

  def initialize
    @shift_pattern = []
    @shifted_message = ""
    @counter = 0
  end

  def main_decrypt_method(message, keys, offsets)
    create_shift_pattern(keys, offsets)
    create_alphabet
    breakdown_message_into_letters(message_to_downcase(message))
    @shifted_message
  end

  def rotate_letter_backwards(character, counter)
    placeholder = create_alphabet.index(character)
    backwards_shift = @shift_pattern[counter] * -1
    rotated_alphabet = create_alphabet.rotate(backwards_shift)
    @shifted_message.concat(rotated_alphabet[placeholder])
    @shifted_message
  end

  def validate_letter(character, counter)
    if letter_in_alphabet?(character) == true
      rotate_letter_backwards(character, counter)
    else
      @shifted_message.concat(character)
    end
    @shifted_message
  end

  def breakdown_message_into_letters(message)
    message.each_char do |character|
      counter = @counter
      validate_letter(character, counter)
      increment_counter(counter)
    end
    @shifted_message
  end

end
