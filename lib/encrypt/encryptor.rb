require_relative 'key_generator'
require_relative 'date_calculator'
require_relative 'cipher'
class Encrypt
  attr_accessor :key, :offset, :cipher

  def initialize(message = nil, key = nil, date = nil)
    @key = KeyGenerator.new("12345")
    @offset = Offset.new
    @cipher = Cipher.new.index
  end

  def rotation_value
    rotation_values = @offset.array_of_offsets.zip(@key.array_of_keys)
    rotation_values.map{ |value| value.reduce(:+) }
  end

  def encrypt_message(message)
    message = message.downcase.chars
    message.map!.with_index do |string,index|
      if index % 4 == 0
        full_rotation = @cipher.index(string) + rotation_value[0]
        string = @cipher.rotate(full_rotation)[0]
      elsif index % 4 == 1
        full_rotation = @cipher.index(string) + rotation_value[1]
        string = @cipher.rotate(full_rotation)[0]
      elsif index % 4 == 2
        full_rotation = @cipher.index(string) + rotation_value[2]
        string = @cipher.rotate(full_rotation)[0]
      else
        full_rotation = @cipher.index(string) + rotation_value[3]
        string = @cipher.rotate(full_rotation)[0]
      end
    end
    message.join
  end
end
Encrypt.new.encrypt_message("Brian is ready to finish ..end..")
Offset.new
