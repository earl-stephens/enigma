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
    encrypt_key = select_key(user_key)
    encrypt_offset = select_offset(user_date)
    @hash[:encryption] = @shift.main_encrypt_method(message, encrypt_key, encrypt_offset)
    @hash[:key] = @key.number_as_string
    @hash[:date] = @offset.time
    @hash
  end

end
