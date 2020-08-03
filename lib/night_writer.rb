require 'pry'
require './lib/translator.rb'
require './lib/filereader.rb'

class NightWriter
  attr_reader :translator,
              :text,
              :output_strings,
              :file_input,
              :file_output
include FileReader

  def initialize(file_input, file_output)
    @file_input = file_input
    @file_output = file_output
    @translator = Translator.new
    load_input_text(file_input)
    @output_strings = []
  end

  # def load_input_text(file_input)
  #   @text = File.read(file_input)
  # end

  def cut
    @text_array = ((@text.chomp.length + 40 -1) / 40).times.collect { |i| @text.chomp[i * 40, 40] }
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

  # def confirm(file_input)
  #    new_file_count = File.open(file_input).sum do |line|
  #      line.chomp.length
  #    end
  #   p "Created '#{ARGV[1]}' containing #{new_file_count} characters"
  # end
end
