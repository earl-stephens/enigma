require './test/test_helper'

class KeyTest < Minitest::Test

  def test_it_exists
    key = Key.new

    assert_instance_of Key, key
  end

  def test_it_has_attributes
    key = Key.new

    assert_equal "", key.random_number
  end

  def test_it_can_generate_a_random_number
    key = Key.new

    assert_equal String, key.random_number.class
  end

  def test_to_use_a_test_random_number_method
    key = Key.new

    key.test_random_number("123")

    assert_equal "123", key.random_number
  end

  def test_it_can_fill_in_zeroes
    # skip
    key = Key.new
    key.test_random_number("123")

    key.fill_in_zeroes

    assert_equal "00123", key.random_number

    key.test_random_number("12345")

    assert_equal 5, key.random_number.length
  end

  def test_it_can_create_A_key
    skip
    key = Key.new
    key.test_random_number(12345)
    key.convert_random_number_to_array
    key.test_random_number_array_for_5_digits?

    assert_equal 12, key.create_A_key
  end

  def test_it_can_create_a_key_hash
    # skip
    key = Key.new

    key.create_key_hash

    expected = {
      a: 0,
      b: 0,
      c: 0,
      d: 0
    }
    assert_equal expected, key.key_hash
  end

  def test_it_can_populate_key_hash
    # skip
    key = Key.new
    key.test_random_number("12345")
    key.fill_in_zeroes
    key.create_key_hash

    key.populate_key_hash

    expected = ({
      a: "12",
      b: "23",
      c: "34",
      d: "45"
      })
    assert_equal expected, key.key_hash
  end

end
