# require './shift'
class Encryption
  include Shift
  attr_reader :shift_pattern

  def initialize
    @shift_pattern = []
  end

end
