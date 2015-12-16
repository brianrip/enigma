class FileWriter

  def initialize(message = "thinking thoughts", file = "testwrite.txt")
    @message = message
    @file = file
  end

  def file_writer
    file_output = File.open(@file, 't')
    file_output.write(@message)
    file_output.close
  end
end
