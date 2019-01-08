require './test/test_helper'

class EncryptionTest < Minitest::Test
  def test_it_exists
    encryption = Encryption.new

    assert_instance_of Encryption, encryption
  end

  def test_it_can_create_a_shift_pattern
    # skip
    encryption = Encryption.new
    key = Key.new
    offset = Offset.new
    keys = key.main_test_method("02468")
    offsets = offset.main_test_method("122212")

    encryption.create_shift_pattern(keys, offsets)

    assert_equal [4, 33, 50, 72], encryption.shift_pattern
  end

  def test_it_has_attributes
    encryption = Encryption.new

    assert_equal [], encryption.shift_pattern
  end

  def test_it_has_an_alphabet
    encryption = Encryption.new

    encryption.create_alphabet

    expected = ["a","b","c","d","e","f","g","h","i","j","k","l",
      "m","n","o","p","q","r","s","t","u","v","w","x","y","z"," "]
    assert_equal expected, encryption.alphabet
  end

  def test_it_can_change_a_message_to_lower_case
    encryption = Encryption.new

    message = "This Is A Big Sentence"
    expected = "this is a big sentence"
    assert_equal expected, encryption.message_to_downcase(message)
  end

  def test_if_character_is_in_the_alphabet
    encryption = Encryption.new
    encryption.create_alphabet

    assert_equal true, encryption.letter_in_alphabet?("d")
    assert_equal false, encryption.letter_in_alphabet?("!")
  end

  def test_it_can_rotate_letters
    encryption = Encryption.new
    encryption.create_alphabet
    key = Key.new
    offset = Offset.new
    keys = key.main_test_method("02715")
    offsets = offset.main_test_method("040895")
    encryption.create_shift_pattern(keys, offsets)

    assert_equal "k", encryption.rotate_letter("h", 0)
  end

  def test_it_can_shift_letters
    skip
    encryption = Encryption.new
    encryption.create_alphabet
    key = Key.new
    offset = Offset.new
    keys = key.main_test_method("02715")
    offsets = offset.main_test_method("040895")
    encryption.create_shift_pattern(keys, offsets)

    encryption.shift_letters("hello world")

    assert_equal "keder ohulw", encryption.shifted_message
  end

end
