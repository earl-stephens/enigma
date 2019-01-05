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

end
