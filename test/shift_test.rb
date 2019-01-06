require './test/test_helper'

class ShiftTest < Minitest::Test

  def test_it_exists
    shift = Shift.new

    assert_instance_of Shift, shift
  end

  def test_it_has_attributes
    shift = Shift.new

    assert_equal [], shift.shift_pattern
  end

  def test_it_can_create_a_shift_pattern
    # skip
    shift = Shift.new
    key = Key.new
    offset = Offset.new
    keys = key.main_test_method("02468")
    offsets = offset.main_test_method("122212")

    shift.create_shift_pattern(keys, offsets)

    assert_equal [4, 33, 50, 72], shift.shift_pattern
  end

  def test_it_has_an_alphabet
    shift = Shift.new

    shift.create_alphabet

    expected = ["a","b","c","d","e","f","g","h","i","j","k","l",
      "m","n","o","p","q","r","s","t","u","v","w","x","y","z"," "]
    assert_equal expected, shift.alphabet
  end



end
