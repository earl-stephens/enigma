# require './shift'
class Encryption
  include Shift
  attr_reader :shift_pattern,
              :alphabet

  def initialize
    @shift_pattern = []
  end

  def shift_letters(message)
  message.each_char do |character|
    counter = @counter
    split_message(character, counter)
    increment_counter(counter)
  end
  @shifted_message
  end 

end
