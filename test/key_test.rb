# require 'minitest/autorun'
# require 'minitest/pride'
require './lib/key'
require './test/test_helper'

class KeyTest < Minitest::Test

  def test_it_exists
    key = Key.new

    assert_instance_of Key, key
  end

  def test_it_has_attributes
    key = Key.new

    assert_equal 0, key.random_number
  end

  def test_it_can_generate_a_random_number
    key = Key.new

    assert_equal Integer, key.random_number.class
  end

  def test_convert_random_number_to_array
    key = Key.new

    key.convert_random_number_to_array

    assert_equal Array, key.random_number_array.class
  end

  def test_to_use_a_test_random_number_method
    key = Key.new

    key.test_random_number(123)

    assert_equal 123, key.random_number

    key.convert_random_number_to_array
    assert_equal [3, 2, 1], key.random_number_array
  end

  def test_random_number_has_5_digits
    key = Key.new

    key.convert_random_number_to_array = ["1", "2", "3"]

    assert_equal false, key.test_random_number_array_for_5_digits
  end

end
