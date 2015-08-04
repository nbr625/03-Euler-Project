#The sum of the squares of the first ten natural numbers is,
#12 + 22 + ... + 102 = 385
#The square of the sum of the first ten natural numbers is,
#(1 + 2 + ... + 10)2 = 552 = 3025
#Hence the difference between the sum of the squares of the first
#ten natural numbers and the square of the sum is 3025 − 385 = 2640.
#Find the difference between the sum of the squares of the first one 
#hundred natural numbers and the square of the sum.

require_relative 'glad_colors'

arr1 = []
arr2 = (1..100).to_a

(1..100).each do |n|
	n *= n
	arr1.push(n)
end
sumsqr = arr1.inject(:+)
sqrsums = arr2.inject(:+) * arr2.inject(:+)

puts "the answer is " + pink(sqrsums - sumsqr) + ". \
Well that was easy..." + pink('even for you') + "."





