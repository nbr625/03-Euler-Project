#The following iterative sequence is defined for the set of positive integers:
#n → n/2 (n is even)
#n → 3n + 1 (n is odd)
#Using the rule above and starting with 13, we generate the following sequence:
#13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1
#It can be seen that this sequence (starting at 13 and finishing at 1) contains 10 terms. 
#Although it has not been proved yet (Collatz Problem), it is thought that all starting numbers finish at 1.
#Which starting number, under one million, produces the longest chain?
# NOTE: Once the chain starts the terms are allowed to go above one million.

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