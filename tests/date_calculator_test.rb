require 'minitest/autorun'                     # => true
require 'minitest/pride'                       # => true
require_relative '../encrypt/key_generator'    # ~> LoadError: cannot load such file -- /Users/brianrippeto/Turing/1module/enigma/encrypt/key_generator
require_relative '../encrypt/date_calculator'

class DateCalculatorTest < Minitest::Test
  def test_date_is_printed_as_six_digits
    six_digits = Time.now.strftime("%m%d%y")
    assert_equal 6, six_digits.to_s.length
  end
  def test_pull_last_four_digits_of_date
    four_digits = Offset.new
    four_digits = "14741602225"
    assert_equal "2225", four_digits[-4..-1]
  end
  def test_array_of_offsets
    four_digits = Offset.new
    assert_equal [5, 2, 2, 5], four_digits.array_of_offsets
  end
end

# ~> LoadError
# ~> cannot load such file -- /Users/brianrippeto/Turing/1module/enigma/encrypt/key_generator
# ~>
# ~> /Users/brianrippeto/Turing/1module/enigma/tests/date_calculator_test.rb:3:in `require_relative'
# ~> /Users/brianrippeto/Turing/1module/enigma/tests/date_calculator_test.rb:3:in `<main>'
