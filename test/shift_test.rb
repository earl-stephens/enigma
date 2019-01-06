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

  def test_it_can_create_a_shift_pattern
    shift = Shift.new
    key = Key.new
    offset = Offset.new


  end
end
