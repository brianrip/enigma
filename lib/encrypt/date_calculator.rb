class Offset
  attr_accessor :date_offset, :date  # => nil

  def initialize(date = Time.now.strftime("%m%d%y"))
    @date = date.to_i ** 2                            # => 14765895225
  end                                                 # => :initialize

  def offset_a
    @date.to_s[-4]

  end  # => :offset_a

  def offset_b
    @date.to_s[-3]
  end               # => :offset_b

  def offset_c
    @date.to_s[-2]
  end               # => :offset_c

  def offset_d
    @date.to_s[-1]
  end               # => :offset_d

  def array_of_offsets
    @date.to_s[-4..-1].chars.map { |number_string| number_string.to_i }  # => [5, 2, 2, 5]
  end                                                                    # => :array_of_offsets

end                          # => :array_of_offsets
Offset.new.array_of_offsets  # => [5, 2, 2, 5]
