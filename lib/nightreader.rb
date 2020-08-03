require 'pry'
require './lib/translator.rb'
require './lib/filereader.rb'

class NightReader
  attr_reader :translator,
              :text,
              :braille_text,
              :output,
              :file_input,
              :file_output
  include FileReader

  def initialize(file_input, file_output)
    @file_input = file_input
    @file_output = file_output
    @translator = Translator.new
    @braille_text = load_input_text(file_input)
    @output = []
  end

  def translate
    translator.split_braille_lines(@braille_text)
    translator.group_braille_by_lines
    translator.split_braille_chars
    @braille_arrays = translator.combine_braille_chars
    @output << translator.translate_from_braille_arrays(@braille_arrays)
  end


end
