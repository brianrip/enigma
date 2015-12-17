require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/crack/cracker'
require_relative '../lib/encrypt/encryptor'
require_relative '../lib/encrypt/date_calculator'

class CrackTest < Minitest::Test

  def setup
    @crack = Crack.new
  end

  def test_finds_index_of_known_characters
    assert_equal [13, 3, 37, 37], @crack.index_known_chars
  end

  def test_finds_index_of_encrypted_characters
    assert_equal [1, 2, 3, 4], @crack.index_encrypted_chars
  end
  def test_finds_offsets
    assert_equal [12, 1, 34, 33],  @crack.crack_offsets
  end
  def test_cracks_in_increments_of_4
    assert_equal "brian..end..", @crack.crack_it("vdfl7x8p728j")
  end
end
