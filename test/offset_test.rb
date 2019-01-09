# require 'minitest/autorun'
# require 'minitest/pride'
# require './lib/enigma'
# require './lib/offset'
# require './lib/key'
require './test/test_helper'

class OffsetTest < Minitest::Test

  def test_it_exists
    offset = Offset.new

    assert_instance_of Offset, offset
  end

  def test_it_can_get_the_time
    offset = Offset.new

    offset.get_time

    assert_instance_of Time, offset.time
  end

  def test_it_can_use_a_test_time_helper_method
    offset = Offset.new

    offset.test_time_helper_method("020309")

    assert_equal "020309", offset.time
  end

  def test_it_can_format_time_input
    offset = Offset.new
    # offset.test_time_helper_method("02032009")
    #
    # offset.format_time
    #
    # assert_equal "020309", offset.time

    offset.get_time
    offset.format_time
    assert_equal String, offset.time.class
    assert_equal 6, offset.time.length
  end

  def test_it_can_convert_the_time_to_an_integer
    offset = Offset.new
    offset.get_time
    offset.format_time

    offset.convert_time_to_integer
    assert_equal Integer, offset.convert_time_to_integer.class
  end

  def test_it_can_square_the_numeric_time
    offset = Offset.new

    offset.test_time_helper_method("020309")
    offset.convert_time_to_integer

    assert_equal 412455481, offset.square_the_numeric_time
  end

  def test_it_can_get_the_last_four_of_numeric_time
    offset = Offset.new
    offset.test_time_helper_method("020309")
    offset.convert_time_to_integer
    offset.square_the_numeric_time

    # offset.get_the_last_four

    assert_equal [5, 4, 8, 1], offset.get_the_last_four
  end

  def test_CEO_tester_method
    offset = Offset.new

    offset.main_test_method("050598")

    assert_equal [7, 6, 0, 4], offset.main_test_method("050598")
  end

  def test_CEO_main_method
    offset = Offset.new

    actual = offset.main_method

    assert_equal 4, actual.length
    assert_equal Array, actual.class
    assert_equal Integer, actual[2].class
  end

end
