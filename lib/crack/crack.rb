class Crack
          attr_reader :char_map  # => nil
# def initialize
#   @crack =crack                  # ~> NameError: undefined local variable or method `crack' for #<Crack:0x007fdd140d74f8>
#   @key = key
#
# end  # => :initialize

def characters
  letters = ("a".."z").to_a
  numbers = ("0".."9").to_a
  characters = [" ",".",","]
  @char_map = letters + numbers + characters
end                                           # => :characters


end                 # => :characters
Crack.new.char_map  # => nil
