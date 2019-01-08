# require './shift'
class Encryption
  include Shift
  attr_reader :shift_pattern,
              :alphabet,
              :shifted_message

  def initialize
    @shift_pattern = []
    @shifted_message = ""
  end

  def shift_letters(message)
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

end
