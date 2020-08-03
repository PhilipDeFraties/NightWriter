require 'pry'
require './lib/translator.rb'
require './lib/filereader.rb'

class NightWriter
  attr_reader :translator,
              :text,
              :output,
              :file_input,
              :file_output
include FileReader

  def initialize(file_input, file_output)
    @file_input = file_input
    @file_output = file_output
    @translator = Translator.new
    load_input_text(file_input)
    @output = []
  end

  def cut
    @text_array = ((@text.chomp.length + 40 -1) / 40).times.collect { |i| @text.chomp[i * 40, 40] }
  end

  def translate
    @text_array.each do |string|
      @translator.translate_to_braille_arrays(string)
      @output << @translator.format_to_braille
  end
end
