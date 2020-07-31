
sum = File.open(ARGV[0]).sum do |line|
  line.gsub(/\s+/, '').length
end

p "Created '#{ARGV[1]}' containing #{sum} characters"

puts ARGV.inspect
