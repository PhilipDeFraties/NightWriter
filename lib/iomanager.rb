module IoManager
  def load_input_text(file_input)
    File.read(file_input).chomp
  end

  def confirm
    File.open(@file_input).sum do |line|
       line.chomp.length
     end
  end

  def write
    @output.each do |string|
      File.open(@file_output, "a") { |file| file.write(string) }
    end
  end

  def delete_output
    File.delete(@file_output)
  end
end
