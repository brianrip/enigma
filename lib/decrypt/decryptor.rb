require_relative 'decrypt_key_generator'    # => true
require_relative 'decrypt_date_calculator'  # => true
require_relative 'decrypt_cipher'           # => true
class Decrypt
  attr_accessor :key, :offset, :cipher      # => nil

  def initialize
    @key = DecryptKeyGenerator.new("12345")  # => #<DecryptKeyGenerator:0x007f950404e430 @key="12345">
    @offset = DecryptDateCalculator.new      # => #<DecryptDateCalculator:0x007f950404e188 @date=14765895225>
    @cipher = DecryptCipher.new.index        # => ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ".", ","]
  end                                        # => :initialize

  def rotation_value
    rotation_values = @offset.array_of_offsets.zip(@key.array_of_keys)  # => [[5, 12], [2, 23], [2, 34], [5, 45]], [[5, 12], [2, 23], [2, 34], [5, 45]], [[5, 12], [2, 23], [2, 34], [5, 45]], [[5, 12], [2, 23], [2, 34], [5, 45]], [[5, 12], [2, 23], [2, 34], [5, 45]]
    rotation_values.map{ |value| value.reduce(:+) }                     # => [17, 25, 36, 50], [17, 25, 36, 50], [17, 25, 36, 50], [17, 25, 36, 50], [17, 25, 36, 50]
  end                                                                   # => :rotation_value

  def decrypt_message(message)
      message = message.downcase.chars                               # => ["s", "d", "f", "l", "4"]
      message.map!.with_index do |string,index|                      # => #<Enumerator: ["s", "d", "f", "l", "4"]:map!>
        if index % 4 == 0                                            # => true, false, false, false, true
          full_rotation = @cipher.index(string) - rotation_value[0]  # => 1, 13
          string = @cipher.rotate(full_rotation)[0]                  # => "b", "n"
        elsif index % 4 == 1                                         # => true, false, false
          full_rotation = @cipher.index(string) - rotation_value[1]  # => -22
          string = @cipher.rotate(full_rotation)[0]                  # => "r"
        elsif index % 4 == 2                                         # => true, false
          full_rotation = @cipher.index(string) - rotation_value[2]  # => -31
          string = @cipher.rotate(full_rotation)[0]                  # => "i"
        else
          full_rotation = @cipher.index(string) - rotation_value[3]  # => -39
          string = @cipher.rotate(full_rotation)[0]                  # => "a"
        end                                                          # => "b", "r", "i", "a", "n"
      end                                                            # => ["b", "r", "i", "a", "n"]
      message.join                                                   # => "brian"
    end                                                              # => :decrypt_message
end                                                                  # => :decrypt_message

Decrypt.new.decrypt_message("sdfl4")  # => "brian"
