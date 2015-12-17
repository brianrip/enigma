require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/decrypt/decryptor'
require_relative '../lib/decrypt/decrypt_date_calculator'
require_relative '../lib/decrypt/decrypt_key_generator'

class DecryptorTest < Minitest::Test

def setup
  @decrypt = Decrypt.new
end

def test_rotation_value_zips_with_sum
  assert_equal [20, 25, 36, 50], @decrypt.rotation_value
end

def test_decrypts_message
  assert_equal "brian", @decrypt.decrypt_message("vdfl7")
end


end
