require './lib/shift'

class Encryption
  include Shift
  attr_reader :shift_pattern,
              :alphabet,
              :shifted_message,
              :counter

  def initialize
    @shift_pattern = []
    @shifted_message = ""
    @counter = 0
  end

  def main_encrypt_method(message, keys, offsets)
    create_shift_pattern(keys, offsets)
    create_alphabet
    breakdown_message_into_letters(message_to_downcase(message))
    @shifted_message
  end

  def breakdown_message_into_letters(message)
    message.each_char do |character|
      counter = @counter
      split_message(character, counter)
      increment_counter(counter)
    end
    @shifted_message
  end

  def rotate_letter(character, counter)
    placeholder = @alphabet.index(character)
    rotated_alphabet = @alphabet.rotate(@shift_pattern[counter])
    @shifted_message.concat(rotated_alphabet[placeholder])
    @shifted_message
  end

  def split_message(character, counter)
    if letter_in_alphabet?(character) == true
      rotate_letter(character, counter)
    else
      @shifted_message.concat(character)
    end
    @shifted_message
  end

end
