require_relative 'key_generator'        # => true
require_relative 'date_calculator'      # => true
require_relative 'cipher'               # => true
class Encrypt
  attr_accessor :key, :offset, :cipher  # => nil

  def initialize
    @key = KeyGenerator.new(key)  # => #<KeyGenerator:0x007fab5a050ed0 @key="12345">
    @offset = Offset.new          # => #<Offset:0x007fab5a04be08 @date=14790208225>
    @cipher = Cipher.new.index    # => ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ".", ","]
  end                             # => :initialize

  def rotation_value
    rotation_values = @offset.array_of_offsets.zip(@key.array_of_keys)  # => [[8, 12], [2, 23], [2, 34], [5, 45]], [[8, 12], [2, 23], [2, 34], [5, 45]], [[8, 12], [2, 23], [2, 34], [5, 45]], [[8, 12], [2, 23], [2, 34], [5, 45]], [[8, 12], [2, 23], [2, 34], [5, 45]], [[8, 12], [2, 23], [2, 34], [5, 45]], [[8, 12], [2, 23], [2, 34], [5, 45]], [[8, 12], [2, 23], [2, 34], [5, 45]], [[8, 12], [2, 23], [2, 34], [5, 45]], [[8, 12], [2, 23], [2, 34], [5, 45]], [[8, 12], [2, 23], [2, 34], [5, 45]], [[8, 12], [2, 23], [2, 34], [5, 45]]
    rotation_values.map{ |value| value.reduce(:+) }                     # => [20, 25, 36, 50], [20, 25, 36, 50], [20, 25, 36, 50], [20, 25, 36, 50], [20, 25, 36, 50], [20, 25, 36, 50], [20, 25, 36, 50], [20, 25, 36, 50], [20, 25, 36, 50], [20, 25, 36, 50], [20, 25, 36, 50], [20, 25, 36, 50]
  end                                                                   # => :rotation_value

  def encrypt_message(message)
      message = message.downcase.chars                               # => ["b", "r", "i", "a", "n", ".", ".", "e", "n", "d", ".", "."]
      message.map!.with_index do |string,index|                      # => #<Enumerator: ["b", "r", "i", "a", "n", ".", ".", "e", "n", "d", ".", "."]:map!>
        if index % 4 == 0                                            # => true, false, false, false, true, false, false, false, true, false, false, false
          full_rotation = @cipher.index(string) + rotation_value[0]  # => 21, 33, 33
          string = @cipher.rotate(full_rotation)[0]                  # => "v", "7", "7"
        elsif index % 4 == 1                                         # => true, false, false, true, false, false, true, false, false
          full_rotation = @cipher.index(string) + rotation_value[1]  # => 42, 62, 28
          string = @cipher.rotate(full_rotation)[0]                  # => "d", "x", "2"
        elsif index % 4 == 2                                         # => true, false, true, false, true, false
          full_rotation = @cipher.index(string) + rotation_value[2]  # => 44, 73, 73
          string = @cipher.rotate(full_rotation)[0]                  # => "f", "8", "8"
        else
          full_rotation = @cipher.index(string) + rotation_value[3]  # => 50, 54, 87
          string = @cipher.rotate(full_rotation)[0]                  # => "l", "p", "j"
        end                                                          # => "v", "d", "f", "l", "7", "x", "8", "p", "7", "2", "8", "j"
      end                                                            # => ["v", "d", "f", "l", "7", "x", "8", "p", "7", "2", "8", "j"]
      message.join                                                   # => "vdfl7x8p728j"
    end                                                              # => :encrypt_message
end                                                                  # => :encrypt_message

Encrypt.new.encrypt_message("brian..end..")  # => "vdfl7x8p728j"
