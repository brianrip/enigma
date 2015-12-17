require_relative '../encrypt/date_calculator'
require_relative '../encrypt/encryptor'

class Crack
  attr_reader :char_map ,:rotate, :encrypted_message

  def initialize(encrypted_message = "odfl0wf3kdblqk741wct07pskx8p028j")
    @encrypted_message = encrypted_message
    @char_map = Cipher.new.index
    @rotate = Encrypt.new
  end

  def index_encrypted_chars
    find_char_index_positions(last_four_chars_of_encrypted)
  end

  def index_known_chars
    final_four_known = ["n", "d", ".", "."]

    find_char_index_positions(final_four_known)
  end

  def last_four_chars_of_encrypted
    encrypted_message[-4..-1].chars
  end

  def find_char_index_positions(chars)
    chars.map do |c|
      char_map.find_index(c)
    end
  end

  def crack_offsets
    offsets = index_known_chars.zip(index_encrypted_chars)
    offsets.map do |offset|
      offset.reduce(:-)
    end
  end

  def crack_it(encrypted_message)
    message = encrypted_message.downcase.chars
    message.map!.with_index do |string,index|
      if index % 4 == 0
        full_rotation = @char_map.index(string) + crack_offsets[0]
        string = @char_map.rotate(full_rotation)[0]
      elsif index % 4 == 1
        full_rotation = @char_map.index(string) + crack_offsets[1]
        string = @char_map.rotate(full_rotation)[0]
      elsif index % 4 == 2
        full_rotation = @char_map.index(string) + crack_offsets[2]
        string = @char_map.rotate(full_rotation)[0]
      else
        full_rotation = @char_map.index(string) + crack_offsets[3]
        string = @char_map.rotate(full_rotation)[0]
      end
    end
    message.join
  end


end
Crack.new.crack_offsets
Crack.new.crack_it("odfl0wf3kdblqk741wct07pskx8p028j")
