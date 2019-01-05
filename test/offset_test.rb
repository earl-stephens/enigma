# require 'minitest/autorun'
# require 'minitest/pride'
require './lib/enigma'
require './lib/offset'
require './lib/key'
require './test/test_helper'

class OffsetTest < Minitest::Test

  def test_it_exists
    offset = Offset.new

    assert_instance_of Offset, offset
  end

end
