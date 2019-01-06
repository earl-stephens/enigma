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

    offset.test_time_helper_method("02032009")

    assert_equal "02032009", offset.time
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

end
