# require './shift'
class Encryption
  include Shift
  attr_reader :shift_pattern,
              :alphabet

  def initialize
    @shift_pattern = []
  end

end
