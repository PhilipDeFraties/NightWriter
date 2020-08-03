require './lib/nightreader.rb'

input = ARGV[0]
output = ARGV[1]

nightreader = NightReader.new(input, output)

nightreader.translate
nightreader.write
nightreader.confirm