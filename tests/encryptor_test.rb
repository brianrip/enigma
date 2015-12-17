

require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/encrypt/key_generator'
require_relative '../lib/encrypt/date_calculator'
require_relative '../lib/encrypt/cipher'
require_relative '../lib/encrypt/encryptor'
require_relative '../lib/decrypt/decryptor'
class EncryptTest < Minitest::Test



  def test_rotation_value
    skip
    rotation_array = Encrypt.new
    assert_equal [93, 87, 61, 99], Encrypt.new.rotation_value
  end
  def test_encrypt
    skip

    test_key = '12345'
    encr = Encrypt.new(test_key)
    decr = Decrypt.new(test_key)
    rotation_value = encryptor.rotation_value
    assert_equal "", encryptor.rotation_value
  end
  def test_creates_hash_from_cipher
    skip
    encrypted = Encrypt.new
    hash = encrypted.rotation_hash(rotation_value)
    Hash[@cipher.zip(rotation_value)]
    assert_equal "", encrypted.rotation_hash
  end
end
