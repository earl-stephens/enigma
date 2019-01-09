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

    assert_equal "e", decryption.validate_letter("h", 0)
  end

  def test_it_can_rotate_letters_backwards
    decryption = Decryption.new
    decryption.create_alphabet
    key = Key.new
    offset = Offset.new
    keys = key.main_test_method("02715")
    offsets = offset.main_test_method("040895")
    decryption.create_shift_pattern(keys, offsets)

    assert_equal "h", decryption.validate_letter("k", 0)
  end

  def test_it_can_shift_letters_backwards
    decryption = Decryption.new
    decryption.create_alphabet
    key = Key.new
    offset = Offset.new
    keys = key.main_test_method("02715")
    offsets = offset.main_test_method("040895")
    decryption.create_shift_pattern(keys, offsets)

    decryption.breakdown_message_into_letters("keder ohulw")

    assert_equal "hello world", decryption.shifted_message
  end

  def test_it_can_increment_the_counter
    # skip
    decryption = Decryption.new
    decryption.create_alphabet
    key = Key.new
    offset = Offset.new
    keys = key.main_test_method("02715")
    offsets = offset.main_test_method("040895")
    decryption.create_shift_pattern(keys, offsets)
    decryption.breakdown_message_into_letters("ab")

    assert_equal 3, decryption.increment_counter(3)
  end

  def test_it_can_shift_letters_backwards_with_special_characters
    decryption = Decryption.new
    decryption.create_alphabet
    key = Key.new
    offset = Offset.new
    keys = key.main_test_method("02715")
    offsets = offset.main_test_method("040895")
    decryption.create_shift_pattern(keys, offsets)

    decryption.breakdown_message_into_letters("keder ohulw!")

    assert_equal "hello world!", decryption.shifted_message
  end

  def test_main_decrypt_method
    decryption = Decryption.new
    key = Key.new
    offset = Offset.new
    keys = key.main_test_method("02715")
    offsets = offset.main_test_method("040895")

    decryption.main_decrypt_method("Keder ohulw", keys, offsets)
    assert_equal "hello world", decryption.shifted_message
  end

end
