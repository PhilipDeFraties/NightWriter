require 'pry'
require './lib/alphabet.rb'
class Translator
  attr_reader :alphabet,
              :input_text,
              :formatted_braille
  def initialize
    @alphabet = Alphabet.new
    @formatted_braille = ""
  end

  def cut(text)
    ((text.length + 80 -1) / 80).times.collect { |i| text[i * 80, 80] }
  end

  def translate_to_braille_arrays(text)
    @braille_arrays = []
    text.each_char do |character|
      @alphabet.lowercase.each do |letter, braille|
        if letter == character
          @braille_arrays << braille
        end
      end
    end
    @braille_arrays
  end

  def format_to_braille
    collumn1 = []
    collumn2 = []
    collumn3 = []
    @braille_arrays.each do |array|
      collumn1 << array[0].to_s
      collumn2 << array[1].to_s
      collumn3 << array[2].to_s
    end
    @formatted_braille = "#{collumn1.join}\n#{collumn2.join}\n#{collumn3.join}"
  end

end
