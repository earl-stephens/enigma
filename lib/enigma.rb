class Enigma
  attr_reader :key,
              :offset,
              :shift,
              :hash

  def setup
    @key = Key.new
    @offset = Offset.new
    @shift = Shift.new
    @hash = Hash.new
  end

  def encrypt(message, user_key, user_date)
    setup

  end

end
