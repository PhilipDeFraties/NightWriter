


referenced_file = File.open(ARGV[0]).sum do |line|
  line.chomp.length
end

created_file = File.open(ARGV[1], 'w')

example_text = "Example text"

created_file.write(example_text)

p "Created '#{ARGV[1]}' containing #{referenced_file} characters"

# puts ARGV.inspect
