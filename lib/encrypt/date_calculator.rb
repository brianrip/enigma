class Offset
  attr_accessor :date_offset, :date

  def initialize(date = Time.now.strftime("%m%d%y"))
    @date = date.to_i ** 2
  end

  def offset_a
    @date.to_s[-4]

  end

  def offset_b
    @date.to_s[-3]
  end

  def offset_c
    @date.to_s[-2]
  end

  def offset_d
    @date.to_s[-1]
  end

  def array_of_offsets
    @date.to_s[-4..-1].chars.map { |number_string| number_string.to_i }
  end

end
Offset.new.array_of_offsets
