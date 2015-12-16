require_relative 'key_generator'        # => true
require_relative 'date_calculator'      # => true
require_relative 'cipher'               # => true
class Encrypt
  attr_accessor :key, :offset, :cipher  # => nil

  def initialize(key = "12345")
    @key = KeyGenerator.new(key)  # => #<KeyGenerator:0x007fc9b20963d8 @key="12345">
    @offset = Offset.new          # => #<Offset:0x007fc9b2096130 @date=14765895225>
    @cipher = Cipher.new.index    # => ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ".", ","]
  end                             # => :initialize

  def rotation_value
    rotation_values = @offset.array_of_offsets.zip(@key.array_of_keys)  # => [[5, 12], [2, 23], [2, 34], [5, 45]], [[5, 12], [2, 23], [2, 34], [5, 45]], [[5, 12], [2, 23], [2, 34], [5, 45]], [[5, 12], [2, 23], [2, 34], [5, 45]], [[5, 12], [2, 23], [2, 34], [5, 45]]
    rotation_values.map{ |value| value.reduce(:+) }                     # => [17, 25, 36, 50], [17, 25, 36, 50], [17, 25, 36, 50], [17, 25, 36, 50], [17, 25, 36, 50]
  end                                                                   # => :rotation_value

  def encrypt_message(message)
      message = message.downcase.chars                               # => ["b", "r", "i", "a", "n"]
      message.map!.with_index do |string,index|                      # => #<Enumerator: ["b", "r", "i", "a", "n"]:map!>
        if index % 4 == 0                                            # => true, false, false, false, true
          full_rotation = @cipher.index(string) + rotation_value[0]  # => 18, 30
          string = @cipher.rotate(full_rotation)[0]                  # => "s", "4"
        elsif index % 4 == 1                                         # => true, false, false
          full_rotation = @cipher.index(string) + rotation_value[1]  # => 42
          string = @cipher.rotate(full_rotation)[0]                  # => "d"
        elsif index % 4 == 2                                         # => true, false
          full_rotation = @cipher.index(string) + rotation_value[2]  # => 44
          string = @cipher.rotate(full_rotation)[0]                  # => "f"
        else
          full_rotation = @cipher.index(string) + rotation_value[3]  # => 50
          string = @cipher.rotate(full_rotation)[0]                  # => "l"
        end                                                          # => "s", "d", "f", "l", "4"
      end                                                            # => ["s", "d", "f", "l", "4"]
      message.join                                                   # => "sdfl4"
    end                                                              # => :encrypt_message
end                                                                  # => :encrypt_message

Encrypt.new.encrypt_message("Brian")  # => "sdfl4"
