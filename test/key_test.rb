require 'minitest/autorun'
require 'minitest/pride'
require './lib/key'

class KeyTest < Minitest::Test

  def test_it_exists
    key = Key.new

    assert_instance_of Key, key
  end

  def test_it_can_generate_a_random_number
    key = Key.new

    assert_equal Integer, key.random_number.class
  end

end
