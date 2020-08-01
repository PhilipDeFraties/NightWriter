require 'pry'
require './lib/translator.rb'

class NightWriter

referenced_file = File.open(ARGV[0])
created_file = File.open(ARGV[1], 'w')

#
#
#
#
# translator = Translator.new

# translator.read(referenced_file)
#
# translator.write(created_file)

end


# p "Created '#{ARGV[1]}' containing #{} characters"

# puts ARGV.inspect
