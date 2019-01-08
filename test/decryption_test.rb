require './test/test_helper'

class DecryptionTest < Minitest::Test
  def test_it_exists
    decryption = Decryption.new

    assert_instance_of Decryption, decryption
  end

  def test_it_has_attributes
    decryption = Decryption.new

    assert_equal [], decryption.shift_pattern
  end

  def test_it_can_split_a_message_backwards
    decryption = Decryption.new
    decryption.create_alphabet
    key = Key.new
    offset = Offset.new
    keys = key.main_test_method("02715")
    offsets = offset.main_test_method("040895")
    decryption.create_shift_pattern(keys, offsets)

    assert_equal "e", decryption.split_message_backward("h", 0)
  end

  def test_it_can_rotate_letters_backwards
    decryption = Decryption.new
    decryption.create_alphabet
    key = Key.new
    offset = Offset.new
    keys = key.main_test_method("02715")
    offsets = offset.main_test_method("040895")
    decryption.create_shift_pattern(keys, offsets)

    assert_equal "h", decryption.split_message_backward("k", 0)
  end

end
