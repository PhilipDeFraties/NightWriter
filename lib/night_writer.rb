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



  # @created_file = File.open(ARGV[1], 'w')

# translator = Translator.new

# translator.read(referenced_file)
#
# translator.write(created_file)

end


# p "Created '#{ARGV[1]}' containing #{} characters"

# puts ARGV.inspect
