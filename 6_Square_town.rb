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





