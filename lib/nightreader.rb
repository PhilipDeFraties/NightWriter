require 'pry'
require './lib/translator.rb'
require './lib/filereader.rb'

class NightReader
  attr_reader :translator,
              :text
  include FileReader
def initialize
  @translator = Translator.new
end

def confirm(file_input, file_output)
  new_file_count = (File.open(file_input).sum { |line| line.chomp.length }) / 6
  p "Created '#{file_output}' containing #{new_file_count} characters"
end

end
