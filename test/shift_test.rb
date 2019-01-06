# require 'minitest/autorun'
# require 'minitest/pride'
# require './lib/offset'
# require './lib/key'
# require './lib/shift'
# require './lib/enigma'
require './test/test_helper'

class ShiftTest < Minitest::Test

  def test_it_exists
    shift = Shift.new

    assert_instance_of Shift, shift
  end

  def test_it_creates_a_shift_pattern_hash
    shift = Shift.new

    shift.create_shift_pattern_hash

    expected = ({
      a: 0,
      b: 0,
      c: 0,
      d: 0
      })
    assert_equal expected, shift.create_shift_pattern_hash
  end

  def test_it_can_create_a_shift_pattern
    # skip
    shift = Shift.new
    key = Key.new
    offset = Offset.new
    keys = key.main_test_method("02468")
    offsets = offset.main_test_method("122212")

    shift.create_shift_pattern(keys, offsets)

    expected = ({
      a: 4,
      b: 33,
      c: 50,
      d: 72
      })
    assert_equal expected, shift.shift_pattern
  end

end
