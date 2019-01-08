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

end
