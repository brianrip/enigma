require 'minitest/autorun'
require 'minitest/pride'
require '../lib/key_generator'

class KeyGeneratorTest < Minitest::Test

  def test_key_is_random
    generated = []
    50.times do
      random_number = KeyGenerator.new
      generated << random_number
    end
    assert_equal 50, generated.uniq.count
  end

  # 50 * 5 = 250
  def test_key_is_always_five_digits
    generated = []
    50.times do
      five_digits = KeyGenerator.new
      generated << five_digits.key
    end

    assert_equal 250, generated.join.length
    end

    def test_determine_rotation_a
      random_number = KeyGenerator.new
      random_number.key = "12345"
      assert_equal "12", random_number.rotation_a
    end

    def test_determine_rotation_b
      random_number = KeyGenerator.new
      random_number.key = "12345"
      assert_equal "23", random_number.rotation_b
    end

    def test_determine_rotation_c
      random_number = KeyGenerator.new
      random_number.key = "12345"
      assert_equal "34", random_number.rotation_c
    end

    def test_determine_rotation_d
      random_number = KeyGenerator.new
      random_number.key = "12345"
      assert_equal "45", random_number.rotation_d
    end

    def test_keys_converted_to_integers_into_array_of_four_numbers
      random_number = KeyGenerator.new
      random_number.key = "12345"
      assert_equal [12, 23, 34, 45], random_number.array_of_keys
    end


  end
