require './lib/encryption'
require './lib/decryption'

class Enigma
  attr_reader :key,
              :offset,
              :encryption,
              :decryption
              # :hash

  def setup
    @key = Key.new
    @offset = Offset.new
    @encryption = Encryption.new
    @decryption = Decryption.new
    # @hash = Hash.new
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
    encrypt_hash = {encryption: @encryption.main_encrypt_method(message, encrypt_key, encrypt_offset)}
    encrypt_hash[:key] = @key.number_as_string
    encrypt_hash[:date] = @offset.time
    encrypt_hash
  end

  def decrypt(message, user_key = nil, user_date = nil)
    setup
    encrypt_key = select_key(user_key)
    encrypt_offset = select_offset(user_date)
    decrypt_hash = {decryption: @decryption.main_decrypt_method(message, encrypt_key, encrypt_offset)}
    decrypt_hash[:key] = @key.number_as_string
    decrypt_hash[:date] = @offset.time
    decrypt_hash
  end

end
