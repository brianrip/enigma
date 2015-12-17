require 'minitest/autorun'                         # => true
require 'minitest/pride'                           # => true
require_relative '../lib/encrypt/key_generator'    # => true
require_relative '../lib/encrypt/date_calculator'  # => true
require_relative '../lib/encrypt/cipher'           # => true

class CipherTest < Minitest::Test  # => Minitest::Test

  def test_index_has_39_characters
    all_chars = Cipher.new.index      # => ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ".", ","]
    all_chars.index                   # => #<Enumerator: ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ".", ","]:index>
    assert_equal 39, all_chars.count  # => true
  end                                 # => :test_index_has_39_characters

  def test_index_is_in_an_array
    all_chars = Cipher.new.index          # => ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ".", ","]
    assert_equal Array,  all_chars.class  # => true
  end                                     # => :test_index_is_in_an_array
end                                       # => :test_index_is_in_an_array

# >> Run options: --seed 43372
# >>
# >> # Running:
# >>
# >> ..
# >>
# >> Finished in 0.001363s, 1466.9026 runs/s, 1466.9026 assertions/s.
# >>
# >> 2 runs, 2 assertions, 0 failures, 0 errors, 0 skips
