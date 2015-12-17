require 'minitest/autorun'                         # => true
require 'minitest/pride'                           # => true
require_relative '../lib/crack/cracker'            # => true
require_relative '../lib/encrypt/encryptor'        # => false
require_relative '../lib/encrypt/date_calculator'  # => false

class CrackTest < Minitest::Test  # => Minitest::Test

  def setup
    @crack = Crack.new  # => #<Crack:0x007f8a74849cb0 @encrypted_message="vdfl7wf3rdblxk748wct77psrx8p728j", @char_map=["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ".", ","], @rotate=#<Encrypt:0x007f8a74849198 @key=#<KeyGenerator:0x007f8a74849148 @key="12345">, @offset=#<Offset:0x007f8a748490d0 @date=14790208225>, @cipher=["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ".", ","]>>, #<Crack:0x007f8a74842f00 @encrypted_message="vdfl7wf3rdblxk748wct77psrx8p728j", @char_map=["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ".", ","], @rotate=#<Encrypt:0x007f8a74842348 @key=#<KeyGenerator:0x007f8a748422f8 @key="12345">, @offset=#<Offset:0x007f8a74842280 @date=14790208225>, @cipher=["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ".", ","]>>, #<Crack:0x007f8a748380a0 @encrypted_message="vdfl7wf3rdblxk748wct77psrx8p728j", @char_map=["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ".", ","], @rotate=#<Encrypt:0x007f8a74833758 @key=#<KeyGenerator:0x007f8a74833708 @key="12345">, @offset=#<Offset:0x007f8a74833690 @date=14790208225>, @cipher=["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ".", ","]>>, #<Crack:0x007f8a74830eb8 @encrypted_message="vdfl7wf3rdblxk748wct77psrx8p728j", @char_map=["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ".", ","], @rotate=#<Encrypt:0x007f8a74830350 @key=#<KeyGenerator:0x007f8a748302b0 @key="12345">, @offset=#<Offset:0x007f8a74830238 @date=14790208225>, @cipher=["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ".", ","]>>
  end                   # => :setup

  def test_finds_index_of_known_characters
    assert_equal [13, 3, 37, 37], @crack.index_known_chars  # => true
  end                                                       # => :test_finds_index_of_known_characters

  def test_finds_index_of_encrypted_characters
    assert_equal [1, 2, 3, 4], @crack.index_encrypted_chars
  end                                                            # => :test_finds_index_of_encrypted_characters
  def test_finds_offsets
    assert_equal [12, 1, 34, 33],  @crack.crack_offsets
  end                                                            # => :test_finds_offsets
  def test_cracks_in_increments_of_4
    assert_equal "brian..end..", @crack.crack_it("vdfl7x8p728j")
  end                                                            # => :test_cracks_in_increments_of_4
end                                                              # => :test_cracks_in_increments_of_4

# >> Run options: --seed 44215
# >>
# >> # Running:
# >>
# >> .EFF
# >>
# >> Finished in 0.001812s, 2207.0731 runs/s, 1655.3048 assertions/s.
# >>
# >>   1) Error:
# >> CrackTest#test_cracks_in_increments_of_4:
# >> NoMethodError: undefined method `asser_equal' for #<CrackTest:0x007f8a74843068>
# >>     /Users/brianrippeto/Turing/1module/enigma/tests/crack_test.rb:24:in `test_cracks_in_increments_of_4'
# >>
# >>
# >>   2) Failure:
# >> CrackTest#test_finds_index_of_encrypted_characters [/Users/brianrippeto/Turing/1module/enigma/tests/crack_test.rb:18]:
# >> Expected: [1, 2, 3, 4]
# >>   Actual: [33, 28, 34, 9]
# >>
# >>
# >>   3) Failure:
# >> CrackTest#test_finds_offsets [/Users/brianrippeto/Turing/1module/enigma/tests/crack_test.rb:21]:
# >> Expected: [12, 1, 34, 33]
# >>   Actual: [-20, -25, 3, 28]
# >>
# >> 4 runs, 3 assertions, 2 failures, 1 errors, 0 skips
