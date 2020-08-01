require 'pry'
require './lib/translator.rb'
require './lib/file_reader.rb'

class NightWriter
  attr_reader :reader,
              :translator,
              :text
  def initialize
    @reader = FileReader.new
    @translator = Translator.new
  end

  def load_input_text(file_input)
    @text = @reader.read(file_input)
  end

end


# p "Created '#{ARGV[1]}' containing #{} characters"

# puts ARGV.inspect
