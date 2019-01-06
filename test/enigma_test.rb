# require 'minitest/autorun'
# require 'minitest/pride'
require 'date'
require './lib/enigma'
require './test/test_helper'

class EnigmaTest < Minitest::Test

  def test_it_exists
    enigma = Enigma.new

    assert_instance_of Enigma, enigma
  end

  def test_it_can_use_a_setup_method
    enigma = Enigma.new
    enigma.setup

    assert_instance_of Key, enigma.key
    assert_instance_of Offset, enigma.offset
    assert_instance_of Shift, enigma.shift
    assert_instance_of Hash, enigma.hash
  end

  def test_it_can_choose_a_key_method_when_given_a_key
    enigma = Enigma.new
    enigma.setup

    enigma.select_key("02715")

    assert_equal [2, 27,71, 15], enigma.key.converted_key_array
  end

  def test_it_can_choose_a_key_method_without_a_given_key
    enigma = Enigma.new
    enigma.setup

    enigma.select_key(nil)

    assert_equal Array, enigma.key.converted_key_array.class
    assert_equal 4, enigma.key.converted_key_array.length
  end

  def test_it_can_select_an_offset_method_when_not_given_a_date
    enigma = Enigma.new
    enigma.setup

    enigma.select_offset(nil)

    assert_equal Array, enigma.offset.last_four.class
    assert_equal Integer, enigma.offset.last_four[2].class
    assert_equal 4, enigma.offset.last_four.length
  end

  def test_it_can_select_an_offset_method_when_given_a_date
    skip
    enigma = Enigma.new
    enigma.setup

    enigma.select_offset(nil)

    assert_equal Array, enigma.offset.last_four.class
    assert_equal Integer, enigma.offset.last_four[2].class
    assert_equal 4, enigma.offset.last_four.length
  end
  def test_it_can_encrypt_a_message
    skip
    enigma = Enigma.new

    expected =({
      encryption: "keder ohulw",
      key: "02715",
      date: "040895"
      })
    assert_equal expected, enigma.encrypt("hello world", "02715", "040895")
  end

end
