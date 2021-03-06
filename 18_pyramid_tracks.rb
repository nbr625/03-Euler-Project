#By starting at the top of the triangle below and moving to adjacent numbers on the row below, 
#the maximum total from top to bottom is 23.
#    3
#   7 4
#  2 4 6
# 8 5 9 3
#That is, 3 + 7 + 4 + 9 = 23.
#Find the maximum total from top to bottom of the triangle below:
#NOTE: As there are only 16384 routes, it is possible to solve this problem by trying every route. 
#However, Problem 67, is the same challenge with a triangle containing one-hundred rows; it cannot be solved by brute force,
#and requires a clever method! ;o)

#87389th place! we are now at the fivedigit mark.
require_relative 'glad_colors'

numbers =
"75
95 64
17 47 82
18 35 87 10
20 04 82 47 65
19 01 23 75 03 34
88 02 77 73 07 63 67
99 65 04 28 06 16 70 92
41 41 26 56 83 40 80 70 33
41 48 72 33 47 32 37 16 94 29
53 71 44 65 25 43 91 52 97 51 14
70 11 33 28 77 73 17 78 39 68 17 57
91 71 52 38 17 14 91 43 58 50 27 29 48
63 66 04 68 89 53 67 30 73 16 69 87 40 31
04 62 98 27 23 09 70 98 73 93 38 53 60 04 23"

rows = numbers.split("\n")

pyramid = rows.map { |x| x.split(" ") .map { |x| x.to_i } }
 
(pyramid.length - 1).downto(0).each do |y|
  0.upto(y-1).each do |x|  
    pyramid[y-1][x] += [pyramid[y][x], pyramid[y][x+1]].max   
  end
end
 
puts "Your answer: " + pink(pyramid.first) + ". Dont you wish you could calculate numbers at electric speeds? What a shame that " + \
pink("the same will never happen to you")