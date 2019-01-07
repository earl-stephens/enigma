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
    else
      @key.main_test_method(user_key)
    end
  end

  def select_offset(user_date)
    if user_date == nil
      @offset.main_method
    else
      @offset.main_test_method(user_date)
    end
  end

  def encrypt(message, user_key = nil, user_date = nil)
    setup
    key = select_key(user_key)
    # binding.pry
    offset = select_offset(user_date)
    binding.pry



  end

end
