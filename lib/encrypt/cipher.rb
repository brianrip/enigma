class Cipher
  attr_reader :index  # => nil

  def index
    lowercase = ("a".."z").to_a
    numbers = (0..9).to_a.join.chars
    extra_chars = [" ",".",","]
    @index = lowercase + numbers + extra_chars
  end                                           # => :index
end                                             # => :index
