require_relative 'decrypt_key_generator'
require_relative 'decrypt_date_calculator'
require_relative 'decrypt_cipher'
class Decryptor
  attr_accessor :key, :offset, :cipher

  def initialize
    @key = DecryptKeyGenerator.new("12345")
    @offset = DecryptDateCalculator.new
    @cipher = DecryptCipher.new.index
  end

  def rotation_value
    rotation_values = @offset.array_of_offsets.zip(@key.array_of_keys)
    rotation_values.map{ |value| value.reduce(:+) }
  end

  def decrypt_message(message)
      message = message.downcase.chars
      message.map!.with_index do |string,index|
        if index % 4 == 0
          full_rotation = @cipher.index(string) - rotation_value[0]
          string = @cipher.rotate(full_rotation)[0]
        elsif index % 4 == 1
          full_rotation = @cipher.index(string) - rotation_value[1]
          string = @cipher.rotate(full_rotation)[0]
        elsif index % 4 == 2
          full_rotation = @cipher.index(string) - rotation_value[2]
          string = @cipher.rotate(full_rotation)[0]
        else
          full_rotation = @cipher.index(string) - rotation_value[3]
          string = @cipher.rotate(full_rotation)[0]
        end
      end
      message.join
    end
end
Decryptor.new.decrypt_message("odfl0wf3kdblqk741wct07pskx8p028j")
