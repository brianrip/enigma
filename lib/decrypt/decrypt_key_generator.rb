class DecryptKeyGenerator
  attr_accessor :key, :array_of_keys

  def initialize(key = rand(99999))
    @key = key.to_s.rjust(5,"0")
  end

  def rotation_a
    @key[0..1]
  end

  def rotation_b
    @key[1..2]
  end

  def rotation_c
    @key[2..3]
  end

  def rotation_d
    @key[3..4]
  end

  def array_of_keys
    (rotation_a + rotation_b + rotation_c + rotation_d).scan(/.{1,2}/).map(&:to_i)
  end
end
