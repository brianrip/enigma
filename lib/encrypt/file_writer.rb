class FileWriter

  def initialize(message = "the end is near ..end..", file = "testwrite.txt")
    @message = message
    @file = file
  end

  def file_writer
    file_output = File.open(@file, 'hello')
    file_output.write(@message)
    file_output.close
  end
end
