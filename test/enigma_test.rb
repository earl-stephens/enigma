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

  def test_it_can_choose_a_key
    enigma = Enigma.new

    assert_equal [2, 27,71, 15], enigma.key.main_test_method("02715")
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
