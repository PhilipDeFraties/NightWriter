require 'pry'
require './lib/translator.rb'
require './lib/filereader.rb'

class NightReader
  attr_reader :translator,
              :text,
              :braille_text
  include FileReader

  def initialize(input_file)
    @translator = Translator.new
    @braille_text = load_input_text(input_file)
  end

  def confirm(file_input, file_output)
    new_file_count = (File.open(file_input).sum { |line| line.chomp.length }) / 6
    p "Created '#{file_output}' containing #{new_file_count} characters"
  end
end
