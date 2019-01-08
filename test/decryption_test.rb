require './test/test_helper'

class DecryptionTest < Minitest::Test
  def test_it_exists
    decryption = Decryption.new

    assert_instance_of Decryption, decryption
  end

  def test_it_has_attributes
    decryption = Decryption.new

    assert_equal [], decryption.shift_pattern
  end

end
