require 'pry'
require './lib/alphabet.rb'
class Translator

  attr_reader :input_text
  def initialize
    @alphabet = Alphabet.new
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


  def format_braille
    @braille_array
  end
  # def count(filename)
  #   File.open(filename).sum do |line|
  #     line.length
  #   end
  # end
end
