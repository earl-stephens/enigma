require './test/test_helper'

class EncryptionTest < Minitest::Test
  def test_it_exists
    encryption = Encryption.new

    assert_instance_of Encryption, encryption
  end
end
