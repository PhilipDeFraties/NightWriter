require 'pry'
require './lib/translator.rb'
require './lib/file_reader.rb'

class NightWriter
  attr_reader :reader,
              :translator
  def initialize
    @reader = FileReader.new
    @translator = Translator.new
  end




end


# p "Created '#{ARGV[1]}' containing #{} characters"

# puts ARGV.inspect
