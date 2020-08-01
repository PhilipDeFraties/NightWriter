require 'pry'
require './lib/translator.rb'
require './lib/file_reader.rb'

class NightWriter
  attr_reader :reader,
              :translator,
              :text,
              :output_text
  def initialize
    @reader = FileReader.new
    @translator = Translator.new
  end

  def load_input_text(file_input)
    @text = @reader.read(file_input)
  end

  def translate
    @translator.translate_to_braille_arrays(@text)
    @output_text = @translator.format_to_braille
  end

  def write(file_output)
    File.open(file_output, "w") { |file| file.write(@output_text) }
  end

end

# p "Created '#{ARGV[1]}' containing #{} characters"

# puts ARGV.inspect
