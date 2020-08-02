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

text = "close your eyes and see when there aint no light all youll ever be come and save the night cause I don't leave when the morning comes it doesnt seem to say an awful lot to me"
p text.length
