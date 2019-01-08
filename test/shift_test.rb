require './test/test_helper'

class ShiftTest < Minitest::Test

  # def test_it_exists
  #   shift = Shift.new
  #
  #   assert_instance_of Shift, shift
  # end

  # def test_it_has_attributes
  #   shift = Shift.new
  #
  #   assert_equal [], shift.shift_pattern
  # end

  # def test_it_can_create_a_shift_pattern
  #   # skip
  #   shift = Shift.new
  #   key = Key.new
  #   offset = Offset.new
  #   keys = key.main_test_method("02468")
  #   offsets = offset.main_test_method("122212")
  #
  #   shift.create_shift_pattern(keys, offsets)
  #
  #   assert_equal [4, 33, 50, 72], shift.shift_pattern
  # end
  #
  # def test_it_has_an_alphabet
  #   shift = Shift.new
  #
  #   shift.create_alphabet
  #
  #   expected = ["a","b","c","d","e","f","g","h","i","j","k","l",
  #     "m","n","o","p","q","r","s","t","u","v","w","x","y","z"," "]
  #   assert_equal expected, shift.alphabet
  # end

  # def test_it_can_shift_letters
  #   shift = Shift.new
  #   shift.create_alphabet
  #   key = Key.new
  #   offset = Offset.new
  #   keys = key.main_test_method("02715")
  #   offsets = offset.main_test_method("040895")
  #   shift.create_shift_pattern(keys, offsets)
  #
  #   shift.shift_letters("hello world")
  #
  #   assert_equal "keder ohulw", shift.shifted_message
  # end

  # def test_it_can_split_a_message
  #   shift = Shift.new
  #   shift.create_alphabet
  #   key = Key.new
  #   offset = Offset.new
  #   keys = key.main_test_method("02715")
  #   offsets = offset.main_test_method("040895")
  #   shift.create_shift_pattern(keys, offsets)
  #
  #   assert_equal "k", shift.split_message("h", 0)
  # end

  # def test_it_can_rotate_letters
  #   shift = Shift.new
  #   shift.create_alphabet
  #   key = Key.new
  #   offset = Offset.new
  #   keys = key.main_test_method("02715")
  #   offsets = offset.main_test_method("040895")
  #   shift.create_shift_pattern(keys, offsets)
  #
  #   assert_equal "k", shift.split_message("h", 0)
  # end

  # def test_it_can_increment_the_counter
  #   shift = Shift.new
  #   shift.create_alphabet
  #   key = Key.new
  #   offset = Offset.new
  #   keys = key.main_test_method("02715")
  #   offsets = offset.main_test_method("040895")
  #   shift.create_shift_pattern(keys, offsets)
  #   shift.shift_letters("ab")
  #
  #   assert_equal 3, shift.increment_counter(3)
  # end

  # def test_it_can_split_a_message_backwards
  #   shift = Shift.new
  #   shift.create_alphabet
  #   key = Key.new
  #   offset = Offset.new
  #   keys = key.main_test_method("02715")
  #   offsets = offset.main_test_method("040895")
  #   shift.create_shift_pattern(keys, offsets)
  #
  #   assert_equal "k", shift.split_message("h", 0)
  # end

  def test_it_can_rotate_letters_backwards
    shift = Shift.new
    shift.create_alphabet
    key = Key.new
    offset = Offset.new
    keys = key.main_test_method("02715")
    offsets = offset.main_test_method("040895")
    shift.create_shift_pattern(keys, offsets)

    assert_equal "h", shift.split_message_backward("k", 0)
  end

  def test_it_can_shift_letters_backwards
    shift = Shift.new
    shift.create_alphabet
    key = Key.new
    offset = Offset.new
    keys = key.main_test_method("02715")
    offsets = offset.main_test_method("040895")
    shift.create_shift_pattern(keys, offsets)

    shift.shift_letters_backward("keder ohulw")

    assert_equal "hello world", shift.shifted_message
  end

  # def test_if_character_is_in_the_alphabet
  #   shift = Shift.new
  #   shift.create_alphabet
  #
  #   assert_equal true, shift.letter_in_alphabet?("d")
  #   assert_equal false, shift.letter_in_alphabet?("!")
  # end

  def test_it_can_shift_letters_with_special_characters
    shift = Shift.new
    shift.create_alphabet
    key = Key.new
    offset = Offset.new
    keys = key.main_test_method("02715")
    offsets = offset.main_test_method("040895")
    shift.create_shift_pattern(keys, offsets)

    shift.shift_letters("hello! world!")

    assert_equal "keder!sprrdx!", shift.shifted_message
  end

  def test_it_can_shift_letters_backwards_with_special_characters
    shift = Shift.new
    shift.create_alphabet
    key = Key.new
    offset = Offset.new
    keys = key.main_test_method("02715")
    offsets = offset.main_test_method("040895")
    shift.create_shift_pattern(keys, offsets)

    shift.shift_letters_backward("keder ohulw!")

    assert_equal "hello world!", shift.shifted_message
  end

  # def test_main_encrypt_method
  #   shift = Shift.new
  #   key = Key.new
  #   offset = Offset.new
  #   keys = key.main_test_method("02715")
  #   offsets = offset.main_test_method("040895")
  #
  #   shift.main_encrypt_method("Hello world", keys, offsets)
  #   assert_equal "keder ohulw", shift.shifted_message
  # end

  def test_main_decrypt_method
    shift = Shift.new
    key = Key.new
    offset = Offset.new
    keys = key.main_test_method("02715")
    offsets = offset.main_test_method("040895")

    shift.main_decrypt_method("Keder ohulw", keys, offsets)
    assert_equal "hello world", shift.shifted_message
  end

  # def test_it_can_change_a_message_to_lower_case
  #   shift = Shift.new
  #
  #   message = "This Is A Big Sentence"
  #   expected = "this is a big sentence"
  #   assert_equal expected, shift.message_to_downcase(message)
  # end


end
