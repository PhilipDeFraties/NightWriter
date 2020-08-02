# require 'pry'
# text = "text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text "
# text2 = "text text"
# text3 = "text text text text text text text text text text text text text text text text text text text text text text text text text"
# text3 = "text text text text text text text text text text text text text text text text text text text text text text text text text"
# text4 = "text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text"
#
#   # count = text2.scan(/.{80}/).map do |string|
#   #  string.length
#   # end
#
# # p (text.length / 80).times.collect { |i| text[i * 80, 80] }
# p ((text.length + 80 -1) / 80).times.collect { |i| text[i * 80, 80] }.map do |string|
#   string.length
# end
#
# p ((text2.length + 80 -1) / 80).times.collect { |i| text2[i * 80, 80] }.map do |string|
#    string.length
#  end
#
# p ((text3.length + 80 -1) / 80).times.collect { |i| text3[i * 80, 80] }.map do |string|
#    string.length
#  end
#
#  p ((text4.length + 80 -1) / 80).times.collect { |i| text4[i * 80, 80] }.map do |string|
#     string.length
#   end
#
# p ((text.length + 80 -1) / 80).times.collect { |i| text[i * 80, 80] }
#
# p ((text2.length + 80 -1) / 80).times.collect { |i| text2[i * 80, 80] }
#
# p ((text3.length + 80 -1) / 80).times.collect { |i| text3[i * 80, 80] }
#
# p ((text4.length + 80 -1) / 80).times.collect { |i| text4[i * 80, 80] }
# binding.pry

text = "0.000....0.00....00.0.0.0...000.0.0...00.00.0....0.000...00.0.0.00..0..0000..0..00.0000....00.00..0.0.0.0.0.00...0.00.0.0.0....00..00..00.0.00..000.0.0..00.0.00"
p text.length
