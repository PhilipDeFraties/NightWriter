require './lib/night_writer.rb'

input = ARGV[0]
output = ARGV[1]
nightwriter = NightWriter.new(input, output)

nightwriter.cut
nightwriter.translate
nightwriter.write
nightwriter.confirm

p "Created '#{output}' containing #{nightwriter.confirm} characters"
