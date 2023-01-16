require 'pry'
require './lib/translator.rb'
require './lib/iomanager.rb'

class NightWriter
  attr_reader :translator,
              :text,
              :output,
              :file_input,
              :file_output
include IoManager
  def initialize(file_input, file_output)
    @file_input = file_input
    @text = load_input_text(file_input)
    @file_output = file_output
    @translator = Translator.new
    @output = []
  end

  def cut
    words = @text.split
    words = break_up_long_words(words)

    strings = [""]

    words.each do |str|
      unless strings[-1].length + str.length > 40
        strings[-1] << "#{str} "
      else
        strings << "#{str} "
      end
    end
    @text_array = strings.map(&:rstrip)
  end

  def break_up_long_words(words)
    words.map do |word|
      unless word.length > 40
        word
      else
        word.scan(/.{1,40}/)
      end
    end.flatten
  end

  def translate
    @text_array.each do |string|
      @translator.translate_to_braille_arrays(string)
      @output << @translator.format_to_braille
    end
  end
end
