class Decryption
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

end
