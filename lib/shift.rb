require 'pry'
class Shift
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
    shift_letters(message_to_downcase(message))
    @shifted_message
  end

  def main_decrypt_method(message, keys, offsets)
    create_shift_pattern(keys, offsets)
    create_alphabet
    shift_letters_backward(message_to_downcase(message))
    @shifted_message
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

  def message_to_downcase(message)
    message.downcase
  end

  def shift_letters(message)
    message.each_char do |character|
      counter = @counter
      split_message(character, counter)
      increment_counter(counter)
    end
    @shifted_message
  end

  def increment_counter(counter)
    if @counter == 3
      @counter = 0
    else
      @counter += 1
    end
    counter
  end

  def split_message(character, counter)
    if letter_in_alphabet?(character) == true
      rotate_letter(character, counter)
    else
      @shifted_message.concat(character)
    end
    @shifted_message
  end

  def rotate_letter(character, counter)
    placeholder = @alphabet.index(character)
    rotated_alphabet = @alphabet.rotate(@shift_pattern[counter])
    @shifted_message.concat(rotated_alphabet[placeholder])
    @shifted_message
  end

  def split_message_backward(character, counter)
    if letter_in_alphabet?(character) == true
      rotate_letter_backwards(character, counter)
    else
      @shifted_message.concat(character)
    end
    @shifted_message
  end

  def rotate_letter_backwards(character, counter)
    placeholder = @alphabet.index(character)
    backwards_shift = @shift_pattern[counter] * -1
    rotated_alphabet = @alphabet.rotate(backwards_shift)
    @shifted_message.concat(rotated_alphabet[placeholder])
    @shifted_message
  end

  def shift_letters_backward(message)
    message.each_char do |character|
      counter = @counter
      split_message_backward(character, counter)
      increment_counter(counter)
      end
    @shifted_message
  end

end
