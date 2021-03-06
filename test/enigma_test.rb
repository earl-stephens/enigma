require 'date'
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
    assert_instance_of Encryption, enigma.encryption
    assert_instance_of Decryption, enigma.decryption
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

    actual = enigma.select_offset(nil)

    assert_equal Array, actual.class
    assert_equal Integer, actual[2].class
    assert_equal 4, actual.length
  end

  def test_it_can_select_an_offset_method_when_given_a_date
    # skip
    enigma = Enigma.new
    enigma.setup

    actual = enigma.select_offset("050598")

    assert_equal [7, 6, 0, 4], actual
  end

  def test_it_can_encrypt_a_message
    # skip
    enigma = Enigma.new

    expected =({
      encryption: "keder ohulw",
      key: "02715",
      date: "040895"
      })
    assert_equal expected, enigma.encrypt("hello world", "02715", "040895")
  end

  def test_it_can_encrypt_a_message_without_a_date
    enigma = Enigma.new

    actual = enigma.encrypt("hello world", "02715")
    assert_equal 11, actual[:encryption].length
    # binding.pry
    assert_equal "02715", actual[:key]
    assert_equal String, actual[:date].class
  end

  def test_it_can_encrypt_a_message_without_a_key_or_a_date
    enigma = Enigma.new

    assert_equal 11, enigma.encrypt("hello world")[:encryption].length
  end

  def test_it_can_decrypt_a_message
    enigma = Enigma.new

    expected =({
      decryption: "hello world",
      key: "02715",
      date: "040895"
      })
    assert_equal expected, enigma.decrypt("keder ohulw", "02715", "040895")
  end

  def test_it_can_decrypt_a_message_without_a_date
    enigma = Enigma.new

    encrypted = enigma.encrypt("hello world", "02715")

    actual = enigma.decrypt(encrypted[:encryption], "02715")
    assert_equal 11, actual[:decryption].length
    assert_equal "02715", actual[:key]
    assert_equal String, actual[:date].class
  end

end
