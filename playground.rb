 # require 'pry'
 #
 # string = "0..000...000"
 #
 # p string.chars.each_slice(2).map(&:join)

arrays = [[["ab", "cd", "ef", "gh"],
 ["ik", "lm", "no", "pq"],
  ["rs", "tu", "vw", "xy"]],
   [["z1", "23", "45", "67"],
    ["89", "AB", "CD", "EF"],
    ["GH", "IJ", "KL", "MN"]]]

goal = [[["ab", "ik", "rs"], ["cd", "lm", "tu"], ["ef", "no", "vw"], ["gh", "pq", "xy"]],
[["z1", "89", "GH"], ["23", "AB", "IJ"], ["45", "CD", "KL"], ["67", "EF", "MN"]]]

result = arrays.map(&:transpose)

  # arrays.map do |array|
  #     array.map do |array|
  #     result  << Array.new(3){ |index| index ** 2 }
  #     end
  #   end

p result


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

# text =
# "0.0.0.0.0....00.0.0.00
# 00.00.0..0..00.0000..0
# ....0.0.0....00.0.0..."
# p text.length
