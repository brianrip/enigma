class Cipher
  attr_reader :index  # => nil

  def index
    lowercase = ("a".."z").to_a                 # => ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
    numbers = (0..9).to_a.join.chars            # => ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
    extra_chars = [" ",".",","]                 # => [" ", ".", ","]
    @index = lowercase + numbers + extra_chars  # => ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ".", ","]
  end                                           # => :index
end                                             # => :index
Cipher.new.index                                # => ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ".", ","]
