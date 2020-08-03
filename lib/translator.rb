require 'pry'
require './lib/alphabet.rb'
class Translator
  attr_reader :lowercase,
              :input_text,
              :formatted_braille,
              :rev_lowercase
  include Alphabet
  def initialize
    @formatted_braille = ""
    alphabets
  end

  def translate_to_braille_arrays(text)
    @braille_arrays = text.each_char.reduce([]) { |acc, char| acc << @lowercase[char] }
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
    @formatted_braille = "#{collumn1.join}\n#{collumn2.join}\n#{collumn3.join}\n"
  end

  def translate_from_braille_arrays(braille_arrays)
    text = ""
    braille_arrays.each do |arrays|
      arrays.reduce(text) { |acc, array| acc << @rev_lowercase[array] }
    end
    text
  end

  def split_braille_lines(text)
    @lines_array = text.split("\n")
  end

  def group_braille_by_lines
    @lines_arrays = @lines_array.each_slice(3).to_a
  end

  def split_braille_chars
    @chars_arrays = @lines_arrays.map do |array|
      array.map do |string|
        string.chars.each_slice(2).map(&:join)
      end
    end
    @chars_arrays
  end

  def combine_braille_chars
    @chars_arrays.map(&:transpose)
  end
end
