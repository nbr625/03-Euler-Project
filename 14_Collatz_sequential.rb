# 131198th place!
# Lets take a crack at lambdas. Probably unnecessary,
# pretentious lambdas. But still cool.

require_relative 'glad_colors'

def collatz_sequence(n)
	#they are so cute
	odd =->(x) { 3*x + 1 }
	even =->(x) { x/2 } #baaaaa!
	length = 1

	n if n <= 1
	while (n > 1)
		n = n.even? ? even.(n) : odd.(n)
		length += 1
	end
	length
end

start, longest = 1, 0
(1..1_000_000).each do |x|
	y = collatz_sequence(x)
	if y > longest
		start, longest = x, y
	end
end


puts "I got your results: " + pink(start) + \
" I also " + pink("refactored/slaughtered ") + "your cute \
little lambdas." + pink(' Teehee~~')