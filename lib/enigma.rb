require 'pry'
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

  def select_key(user_key)
    if user_key == nil
      @key.main_method
      # binding.pry
    else
      @key.main_test_method(user_key)
    end
  end

  def encrypt(message, user_key = nil, user_date = nil)
    setup
    select_key(user_key)



  end

end
