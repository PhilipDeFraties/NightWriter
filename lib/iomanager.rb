module IoManager

  def load_input_text(file_input)
    @text = File.read(file_input).chomp
  end

  def confirm
     new_file_count = File.open(@file_input).sum do |line|
       line.chomp.length
     end
    p "Created '#{@file_output}' containing #{new_file_count} characters"
  end

  def write
    @output.each do |string|
      File.open(@file_output, "a") { |file| file.write(string) }
    end
  end
end
