require 'pry'
require './lib/alphabet.rb'
class Translator

  attr_reader :input_text
  def initialize
    @input_text = ""
    @alphabet = Alphabet.new
  end

  def read(filepath)
    @input_text << File.read(filepath)
  end

  def write(filename)
    File.open(filename, 'w').write(@input_text)
  end

  def to_braille_arrays
    braille_array = []
    @input_text.each_char do |character|
      @alphabet.lowercase.each do |letter, braille|
        if letter == character
          braille_array << braille
        end
      end
    end
    braille_array
  end
end


  # def count(filename)
  #   File.open(filename).sum do |line|
  #     line.length
  #   end
  # end
