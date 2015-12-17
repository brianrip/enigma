require 'simplecov'  # => true
SimpleCov.start      # => nil

require 'minitest/autorun'                                 # => true
require 'minitest/pride'                                   # => true
require_relative '../lib/decrypt/decryptor'                # => true
require_relative '../lib/decrypt/decrypt_date_calculator'  # => false
require_relative '../lib/decrypt/decrypt_key_generator'    # => false

class DecryptorTest < Minitest::Test  # => Minitest::Test

def setup
  @decrypt = Decrypt.new  # => #<Decrypt:0x007f982c80f568 @key=#<DecryptKeyGenerator:0x007f982c80f4f0 @key="12345">, @offset=#<DecryptDateCalculator:0x007f982c80f450 @date=14790208225>, @cipher=["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ".", ","]>, #<Decrypt:0x007f982c173ad8 @key=#<DecryptKeyGenerator:0x007f982c173a88 @key="12345">, @offset=#<DecryptDateCalculator:0x007f982c1739c0 @date=14790208225>, @cipher=["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ".", ","]>
end                       # => :setup

def test_rotation_value_zips_with_sum
  assert_equal [20, 25, 36, 50], @decrypt.rotation_value  # => true
end                                                       # => :test_rotation_value_zips_with_sum

def test_decrypts_message
  assert_equal "brian", @decrypt.decrypt_message("vdfl7")  # => true
end                                                        # => :test_decrypts_message


end  # => :test_decrypts_message

# >> Run options: --seed 15239
# >>
# >> # Running:
# >>
# >> ..
# >>
# >> Finished in 0.001313s, 1523.5739 runs/s, 1523.5739 assertions/s.
# >>
# >> 2 runs, 2 assertions, 0 failures, 0 errors, 0 skips

# !> /Users/brianrippeto/.rvm/rubies/ruby-2.2.1/lib/ruby/2.2.0/fileutils.rb:252:in `mkdir': Permission denied @ dir_s_mkdir - /coverage (Errno::EACCES)
# !> \tfrom /Users/brianrippeto/.rvm/rubies/ruby-2.2.1/lib/ruby/2.2.0/fileutils.rb:252:in `fu_mkdir'
# !> \tfrom /Users/brianrippeto/.rvm/rubies/ruby-2.2.1/lib/ruby/2.2.0/fileutils.rb:226:in `block (2 levels) in mkdir_p'
# !> \tfrom /Users/brianrippeto/.rvm/rubies/ruby-2.2.1/lib/ruby/2.2.0/fileutils.rb:224:in `reverse_each'
# !> \tfrom /Users/brianrippeto/.rvm/rubies/ruby-2.2.1/lib/ruby/2.2.0/fileutils.rb:224:in `block in mkdir_p'
# !> \tfrom /Users/brianrippeto/.rvm/rubies/ruby-2.2.1/lib/ruby/2.2.0/fileutils.rb:210:in `each'
# !> \tfrom /Users/brianrippeto/.rvm/rubies/ruby-2.2.1/lib/ruby/2.2.0/fileutils.rb:210:in `mkdir_p'
# !> \tfrom /Users/brianrippeto/.rvm/gems/ruby-2.2.1/gems/simplecov-0.11.1/lib/simplecov/configuration.rb:41:in `coverage_path'
# !> \tfrom /Users/brianrippeto/.rvm/gems/ruby-2.2.1/gems/simplecov-0.11.1/lib/simplecov/result_merger.rb:17:in `resultset_writelock'
# !> \tfrom /Users/brianrippeto/.rvm/gems/ruby-2.2.1/gems/simplecov-0.11.1/lib/simplecov/result_merger.rb:75:in `store_result'
# !> \tfrom /Users/brianrippeto/.rvm/gems/ruby-2.2.1/gems/simplecov-0.11.1/lib/simplecov.rb:77:in `result'
# !> \tfrom /Users/brianrippeto/.rvm/gems/ruby-2.2.1/gems/simplecov-0.11.1/lib/simplecov/configuration.rb:168:in `block in at_exit'
# !> \tfrom /Users/brianrippeto/.rvm/gems/ruby-2.2.1/gems/simplecov-0.11.1/lib/simplecov/defaults.rb:64:in `call'
# !> \tfrom /Users/brianrippeto/.rvm/gems/ruby-2.2.1/gems/simplecov-0.11.1/lib/simplecov/defaults.rb:64:in `block in <top (required)>'

# ~> Errno::EACCES
# ~> Permission denied @ dir_s_mkdir - /coverage
# ~>
# ~> /Users/brianrippeto/.rvm/rubies/ruby-2.2.1/lib/ruby/2.2.0/fileutils.rb:252:in `mkdir'
# ~> /Users/brianrippeto/.rvm/rubies/ruby-2.2.1/lib/ruby/2.2.0/fileutils.rb:252:in `fu_mkdir'
# ~> /Users/brianrippeto/.rvm/rubies/ruby-2.2.1/lib/ruby/2.2.0/fileutils.rb:226:in `block (2 levels) in mkdir_p'
# ~> /Users/brianrippeto/.rvm/rubies/ruby-2.2.1/lib/ruby/2.2.0/fileutils.rb:224:in `reverse_each'
# ~> /Users/brianrippeto/.rvm/rubies/ruby-2.2.1/lib/ruby/2.2.0/fileutils.rb:224:in `block in mkdir_p'
# ~> /Users/brianrippeto/.rvm/rubies/ruby-2.2.1/lib/ruby/2.2.0/fileutils.rb:210:in `each'
# ~> /Users/brianrippeto/.rvm/rubies/ruby-2.2.1/lib/ruby/2.2.0/fileutils.rb:210:in `mkdir_p'
# ~> /Users/brianrippeto/.rvm/gems/ruby-2.2.1/gems/simplecov-0.11.1/lib/simplecov/configuration.rb:41:in `coverage_path'
# ~> /Users/brianrippeto/.rvm/gems/ruby-2.2.1/gems/simplecov-0.11.1/lib/simplecov/result_merger.rb:17:in `resultset_writelock'
# ~> /Users/brianrippeto/.rvm/gems/ruby-2.2.1/gems/simplecov-0.11.1/lib/simplecov/result_merger.rb:75:in `store_result'
# ~> /Users/brianrippeto/.rvm/gems/ruby-2.2.1/gems/simplecov-0.11.1/lib/simplecov.rb:77:in `result'
# ~> /Users/brianrippeto/.rvm/gems/ruby-2.2.1/gems/simplecov-0.11.1/lib/simplecov/configuration.rb:168:in `block in at_exit'
# ~> /Users/brianrippeto/.rvm/gems/ruby-2.2.1/gems/simplecov-0.11.1/lib/simplecov/defaults.rb:64:in `call'
# ~> /Users/brianrippeto/.rvm/gems/ruby-2.2.1/gems/simplecov-0.11.1/lib/simplecov/defaults.rb:64:in `block in <top (required)>'
