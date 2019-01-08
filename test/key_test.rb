require './test/test_helper'

class KeyTest < Minitest::Test

  def test_it_exists
    key = Key.new

    assert_instance_of Key, key
  end

  def test_it_has_attributes
    key = Key.new

    assert_equal "", key.random_number
    assert_equal [], key.key_array
    assert_equal [], key.converted_key_array
  end

  def test_it_can_generate_a_random_number
    key = Key.new

    assert_instance_of Random, key.random_number_generator
  end

  def test_to_use_a_test_random_number_method
    key = Key.new

    key.test_random_number("123")

    assert_equal "123", key.random_number
  end

  def test_it_can_fill_in_zeroes
    # skip
    key = Key.new
    key.test_random_number("1")
    key.fill_in_zeroes

    assert_equal "00001", key.random_number

    key.test_random_number("89")
    key.fill_in_zeroes

    assert_equal "00089", key.random_number

    key.test_random_number("123")
    key.fill_in_zeroes

    assert_equal "00123", key.random_number

    key.test_random_number("8765")
    key.fill_in_zeroes

    assert_equal "08765", key.random_number

    key.test_random_number("12345")
    key.fill_in_zeroes

    assert_equal "12345", key.random_number
  end

  def test_it_can_populate_key_array
    key = Key.new

    key.test_random_number("00189")
    key.fill_in_zeroes

    key.populate_key_array

    expected = ["00", "01", "18", "89"]
    assert_equal expected, key.key_array
  end

  def test_it_can_convert_strings_to_integers
    key = Key.new
    key.test_random_number("67843")
    key.fill_in_zeroes
    key.populate_key_array

    assert_equal [67, 78, 84, 43], key.convert_key_array
  end

  def test_CEO_tester_method
    # skip
    key = Key.new
    key.main_test_method("45678")

    expected = ["45", "56", "67", "78"]
  assert_equal expected, key.key_array
  end

  def test_CEO_main_method
    key = Key.new
    key.main_method

    assert_equal 4, key.converted_key_array.length
    assert_instance_of Integer, key.convert_key_array[2]
  end


end
