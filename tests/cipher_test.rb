require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/encrypt/key_generator'
require_relative '../lib/encrypt/date_calculator'
require_relative '../lib/encrypt/cipher'

class CipherTest < Minitest::Test

  def test_index_has_39_characters
    all_chars = Cipher.new.index
    all_chars.index
    assert_equal 39, all_chars.count
  end

  def test_index_is_in_an_array
    all_chars = Cipher.new.index
    assert_equal Array,  all_chars.class
  end
end
