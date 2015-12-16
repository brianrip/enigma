class KeyGenerator

  attr_accessor :key, :array_of_keys  # => nil

  def initialize(key = rand(99999))
    @key = key.to_s.rjust(5,"0")
  end                                # => :initialize

  def rotation_a
    @key[0..1]
  end             # => :rotation_a

  def rotation_b
    @key[1..2]
  end             # => :rotation_b

  def rotation_c
    @key[2..3]
  end             # => :rotation_c

  def rotation_d
    @key[3..4]
  end             # => :rotation_d

  def array_of_keys
    (rotation_a + rotation_b + rotation_c + rotation_d).scan(/.{1,2}/).map(&:to_i)
  end                                                                               # => :array_of_keys


end  # => :array_of_keys
