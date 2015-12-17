require 'minitest/autorun'                         # => true
require 'minitest/pride'                           # => true
require_relative '../lib/encrypt/key_generator'    # => true
require_relative '../lib/encrypt/date_calculator'  # => true

class DateCalculatorTest < Minitest::Test                    # => Minitest::Test
  def test_date_is_printed_as_six_digits
    six_digits = Time.now.strftime("%m%d%y")                 # => "121615"
    assert_equal 6, six_digits.to_s.length                   # => true
  end                                                        # => :test_date_is_printed_as_six_digits
  def test_pull_last_four_digits_of_date
    four_digits = Offset.new                                 # => #<Offset:0x007f8d8c19e418 @date=14790208225>
    four_digits = "14741602225"                              # => "14741602225"
    assert_equal "2225", four_digits[-4..-1]                 # => true
  end                                                        # => :test_pull_last_four_digits_of_date
  def test_array_of_offsets
    four_digits = Offset.new                                 # => #<Offset:0x007f8d8c19ceb0 @date=14790208225>
    assert_equal [8, 2, 2, 5], four_digits.array_of_offsets  # => true
  end                                                        # => :test_array_of_offsets
end                                                          # => :test_array_of_offsets

# >> Run options: --seed 64620
# >>
# >> # Running:
# >>
# >> ...
# >>
# >> Finished in 0.001483s, 2023.5719 runs/s, 2023.5719 assertions/s.
# >>
# >> 3 runs, 3 assertions, 0 failures, 0 errors, 0 skips
