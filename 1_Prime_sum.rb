#Find the sum of all the multiples of 3 or 5 below 1000.

def sum_of_5_and_3_mul
	mult = []
	belowonethau = (0...1000).to_a
	belowonethau.each do |n|
		if n % 5 == 0 || n % 3 == 0
			mult << n
		end
	end
	return mult.inject(:+)
end

print "The answer is #{sum_of_5_and_3_mul}  "
	