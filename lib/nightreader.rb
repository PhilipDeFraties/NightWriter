require 'pry'
require './lib/translator.rb'
require './lib/filereader.rb'

class NightReader
  attr_reader :translator,
              :text,
              :braille_arrays
  include FileReader

  def initialize(input_file)
    @translator = Translator.new
  end

  def confirm(file_input, file_output)
    new_file_count = (File.open(file_input).sum { |line| line.chomp.length }) / 6
    p "Created '#{file_output}' containing #{new_file_count} characters"
  end

  def gather_braille_arrays(file_input)
    @braille_arrays = File.open(file_input).map do |line|
      line[0..1]
    end
  end



end
