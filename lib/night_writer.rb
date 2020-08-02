require 'pry'
require './lib/translator.rb'
require './lib/file_reader.rb'

class NightWriter
  attr_reader :reader,
              :translator,
              :text,
              :output_strings

  def initialize
    @reader = FileReader.new
    @translator = Translator.new
    @output_strings = []
    # load_input_text(ARGV[0])
    # cut(@text)
    # translate
    # write(ARGV[1])
  end

  def load_input_text(file_input)
    @text = @reader.read(file_input)
  end

  def cut(text)
    @text_array = ((text.length + 40 -1) / 40).times.collect { |i| text[i * 40, 40] }
  end

  def translate
    @text_array.each do |string|
      @translator.translate_to_braille_arrays(string)
      @output_strings << @translator.format_to_braille
    end

  end

  def write(file_output)
    @output_strings.each do |string|
      File.open(file_output, "a") { |file| file.write(string) }
    end
  end

  def confirm(file_input)
     new_file_count = File.open(file_input).sum do |line|
       line.chomp.length
     end
    p "Created '#{ARGV[1]}' containing #{new_file_count} characters"
  end
end

# nightwriter = NightWriter.new
